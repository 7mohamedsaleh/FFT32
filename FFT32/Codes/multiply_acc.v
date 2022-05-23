`timescale 1ns / 1ps

module multiply_acc

(
	 input clk , clk_20, rst_n ,
	 // Input sample A+jB 
    input  [47:0] sample1,
	 input  [47:0] sample2,
	 //---------------------------------//
	 input [23:0] twiddleFactor_real, // this value is const 
	 input [23:0] twiddleFactor_imaj , 
	 
    
	 output [47:0] output_add, // 100 MHZ 
	 output [47:0] output_sub,
	 
	 output reg [47:0] output_add_20MHZ , 
	 output reg [47:0] output_sub_20MHZ , 
	 
	 output reg ovf,inexact 
    );
	 
reg  [47:0] real1 ;
reg  [47:0] real2 ;
reg real1_sgn ,real2_sgn ,
		imaj1_sgn ,imaj2_sgn ;
reg [45:0] imaj1 ;
reg [45:0] imaj2 ;

reg [23:0] real1_twoscomp,real2_twoscomp,
				imaj1_twoscomp,imaj2_twoscomp,
				sample1_real_twoscomp,
				sample1_imaj_twoscomp;
				
reg [24:0] real_output_comp_add , imaj_output_comp_add ,
				real_output_add , imaj_output_add ,
				real_output_comp_sub , imaj_output_comp_sub ,
				real_output_sub , imaj_output_sub ;

wire overflow, inexact_flag ;
wire  [23:0] sample1_real,sample1_imaj,
	 sample2_real,sample2_imaj;
reg [23:0] output_real_add,output_imaj_add,
	 output_real_sub,output_imaj_sub;
// Combinitional logic 
assign 	sample1_real = sample1[47:24],
			sample1_imaj = sample1[23:0],
			sample2_real = sample2 [47:24],
			sample2_imaj = sample2 [23:0] ;
			
assign   output_add= {output_real_add,output_imaj_add} , 
			output_sub= {output_real_sub,output_imaj_sub} ;
	 
always@(*)
	begin 
			real1= sample2_real[22:0]*twiddleFactor_real[22:0] ;
			real1_sgn = sample2_real[23] ^ twiddleFactor_real[23] ; 
			real1_twoscomp = (real1_sgn) ? ~real1[33:10]+1'b1 : real1[33:10] ;
			
			real2 = sample2_imaj[22:0]*twiddleFactor_imaj[22:0];
			real2_sgn = sample2_imaj[23] ^twiddleFactor_imaj[23];
			real2_twoscomp = (real2_sgn) ? ~real2[33:10]+1'b1 : real2[33:10] ;
		
			imaj1= sample2_imaj[22:0]*twiddleFactor_real[22:0] ;
			imaj1_sgn = sample2_imaj[23] ^ twiddleFactor_real[23] ; 
			imaj1_twoscomp = (imaj1_sgn) ? ~imaj1[33:10]+1'b1 : imaj1[33:10] ;

			imaj2 = sample2_real[22:0]*twiddleFactor_imaj[22:0];
			imaj2_sgn = sample2_real[23] ^twiddleFactor_imaj[23];
			imaj2_twoscomp = (imaj2_sgn) ? ~imaj2[33:10]+1'b1 : imaj2[33:10] ;
	end 
  
always@(*)
	begin
			sample1_real_twoscomp = (sample1_real[23]) ? ~sample1_real[22:0]+1'b1 : sample1_real[22:0];
			sample1_imaj_twoscomp= (sample1_imaj[23]) ? ~sample1_imaj[22:0]+1'b1 : sample1_imaj[22:0];
	end
 

always@(*)
	begin
		real_output_comp_add =sample1_real_twoscomp +real1_twoscomp - real2_twoscomp;
		real_output_add = (real_output_comp_add[23]&real_output_comp_add[22]) ? ~real_output_comp_add+1'b1 : real_output_comp_add ;
		
		imaj_output_comp_add =sample1_imaj_twoscomp +imaj1_twoscomp + imaj2_twoscomp;
		imaj_output_add = (imaj_output_comp_add[23]&imaj_output_comp_add[22]) ? ~imaj_output_comp_add+1'b1 : imaj_output_comp_add ;
		
		real_output_comp_sub =sample1_real_twoscomp -real1_twoscomp + real2_twoscomp;
		real_output_sub = (real_output_comp_sub[23]&real_output_comp_sub[22]) ? ~real_output_comp_sub+1'b1 : real_output_comp_sub ;
		
		imaj_output_comp_sub =sample1_imaj_twoscomp -imaj1_twoscomp - imaj2_twoscomp;
		imaj_output_sub = (imaj_output_comp_sub[23]&imaj_output_comp_sub[22]) ? ~imaj_output_comp_sub+1'b1 : imaj_output_comp_sub ;
	end

assign overflow = (|real1[45:32]) || (|real2[45:32]) ||
						(|imaj1[45:32]) || (|imaj2[45:32]) ; 

assign inexact_flag= (|real1[9:0]) || (|real2[9:0]) ||
						(|imaj1[9:0]) || (|imaj2[9:0]) ; 
						
 
always@(posedge clk)
	//synchronus reset 
	if (rst_n)
		begin
			output_real_add <= 0 ; 
			output_imaj_add <= 0 ;
			output_real_sub <= 0 ; 
			output_imaj_sub <= 0 ;
			ovf <= 0 ; 
			inexact <= 0; 
			//reg_select <= 3'b111 ; 
		end
	else 
		begin
			ovf <= overflow ; 
			inexact <= inexact_flag ; 
			output_real_add <= {(real_output_comp_add[23]&real_output_comp_add[22]) , real_output_add[22:0] } ;
			output_imaj_add <= {(imaj_output_comp_add[23]&imaj_output_comp_add[22]) , imaj_output_add[22:0] } ;
			
			output_real_sub <= {(real_output_comp_sub[24]&real_output_comp_sub[23]) , real_output_sub[22:0] } ;
			output_imaj_sub <= {(imaj_output_comp_sub[24]&imaj_output_comp_sub[23]) , imaj_output_sub[22:0] } ;
			/*if (reg_select == output_regs_number)
				reg_select <= 0 ;
			else 
				reg_select <= reg_select +1'b1 ;*/ 
		end 
 
always@(posedge clk_20)
	//synchronus reset 
	
		begin
			output_add_20MHZ <= {(real_output_comp_add[23]&real_output_comp_add[22]) , real_output_add[22:0],  
										(imaj_output_comp_add[23]&imaj_output_comp_add[22]) , imaj_output_add[22:0] } ;
			
			output_sub_20MHZ <= {(real_output_comp_sub[24]&real_output_comp_sub[23]) , real_output_sub[22:0],
										(imaj_output_comp_sub[24]&imaj_output_comp_sub[23]) , imaj_output_sub[22:0] } ;
			
		end 
endmodule
