`timescale 1ns / 1ps
module mux_mac_regs(
	input clk , clk_20, rst_n ,
	//--------- FIRST SAMPLE ---------------------//
	input [47:0] sample_1_0 , //first sample at mux first input 
	input [47:0] sample_1_1 , //first sample at mux second input
	input [47:0] sample_1_2 , //etc ...
	input [47:0] sample_1_3 , //etc ...
	input [47:0] sample_1_4 , //etc ...
	
	//--------- SECOND SAMPLE ---------------------//
	input [47:0] sample_2_0 , //second sample at mux first input 
	input [47:0] sample_2_1 , //second sample at mux second input
	input [47:0] sample_2_2 , //etc ...
	input [47:0] sample_2_3 , //etc ...
	input [47:0] sample_2_4 , //etc ...
	
	//--------- TWIDDLE FACTORS ---------------------//
	input [23:0] twiddle_real , //twiddle factor 
	input [23:0] twiddle_imaj , 
	//---------------SELECTION -------------------------//
	input [2:0] sel_line ,
	
	//-----------------OUTPUT -------------------------//
	output [47:0] output_add,
	output [47:0] output_sub,
	
	output [47:0] output_add_20MHZ ,
	output [47:0] output_sub_20MHZ 
    );

reg [47:0] sample_1 , sample_2 ; 

always@(*) //mux 
	begin
		case (sel_line)
			3'b 000 : 
				begin
					sample_1 = sample_1_0;
					sample_2 = sample_2_0;
				end 
			3'b 001 : 
				begin
					sample_1 = sample_1_1;
					sample_2 = sample_2_1;
				end 
			3'b 010 : 
				begin
					sample_1 = sample_1_2;
					sample_2 = sample_2_2;
				end 
			3'b 011 : 
				begin
					sample_1 = sample_1_3;
					sample_2 = sample_2_3;
				end 
			3'b 100 : 
				begin
					sample_1 = sample_1_4;
					sample_2 = sample_2_4;
				end 
			default: 
				begin
					sample_1 = 0;
					sample_2 = 0;
				end 
		endcase
	end 

multiply_acc mac_inst

(
	 .clk(clk) , // 100 MHZ
	 .clk_20(clk_20) , // 20 MHZ
	 .rst_n(rst_n)  ,
	 // Input sample A+jB 
    .sample1 (sample_1) , // mux out 
	 .sample2 (sample_2) ,
	 //---------------------------------//
	 .twiddleFactor_real (twiddle_real) , // Input from controller
	 .twiddleFactor_imaj(twiddle_imaj)  , 
	 
    
	 .output_add(output_add) , // 100 MHZ
	 .output_sub(output_sub) ,
	 
	 .output_add_20MHZ(output_add_20MHZ) ,
	 .output_sub_20MHZ(output_sub_20MHZ) ,
	 
	 .ovf(/*--UNUSED---*/) ,
	 .inexact(/*--UNUSED---*/)   
    );
endmodule
