`timescale 1ns / 1ps



module fft32_tb;

	// Inputs
	reg clk;
	reg rst_n;
	reg start;
	reg clk_20;
	reg [23:0] Xn_0;
	reg [23:0] Xn_1;
	reg [23:0] Xn_2;
	reg [23:0] Xn_3;
	reg [23:0] Xn_4;
	reg [23:0] Xn_5;
	reg [23:0] Xn_6;
	reg [23:0] Xn_7;
	reg [23:0] Xn_8;
	reg [23:0] Xn_9;
	reg [23:0] Xn_10;
	reg [23:0] Xn_11;
	reg [23:0] Xn_12;
	reg [23:0] Xn_13;
	reg [23:0] Xn_14;
	reg [23:0] Xn_15;
	reg [23:0] Xn_16;
	reg [23:0] Xn_17;
	reg [23:0] Xn_18;
	reg [23:0] Xn_19;
	reg [23:0] Xn_20;
	reg [23:0] Xn_21;
	reg [23:0] Xn_22;
	reg [23:0] Xn_23;
	reg [23:0] Xn_24;
	reg [23:0] Xn_25;
	reg [23:0] Xn_26;
	reg [23:0] Xn_27;
	reg [23:0] Xn_28;
	reg [23:0] Xn_29;
	reg [23:0] Xn_30;
	reg [23:0] Xn_31;

	// Outputs
	wire [47:0] Xw_out_0;
	wire [47:0] Xw_out_1;
	wire [47:0] Xw_out_2;
	wire [47:0] Xw_out_3;
	wire [47:0] Xw_out_4;
	wire [47:0] Xw_out_5;
	wire [47:0] Xw_out_6;
	wire [47:0] Xw_out_7;
	wire [47:0] Xw_out_8;
	wire [47:0] Xw_out_9;
	wire [47:0] Xw_out_10;
	wire [47:0] Xw_out_11;
	wire [47:0] Xw_out_12;
	wire [47:0] Xw_out_13;
	wire [47:0] Xw_out_14;
	wire [47:0] Xw_out_15;
	wire [47:0] Xw_out_16;
	wire [47:0] Xw_out_17;
	wire [47:0] Xw_out_18;
	wire [47:0] Xw_out_19;
	wire [47:0] Xw_out_20;
	wire [47:0] Xw_out_21;
	wire [47:0] Xw_out_22;
	wire [47:0] Xw_out_23;
	wire [47:0] Xw_out_24;
	wire [47:0] Xw_out_25;
	wire [47:0] Xw_out_26;
	wire [47:0] Xw_out_27;
	wire [47:0] Xw_out_28;
	wire [47:0] Xw_out_29;
	wire [47:0] Xw_out_30;
	wire [47:0] Xw_out_31;

	parameter time CLK_HI= 5 ;
	parameter time CLK_LO= 5 ;
	parameter time CLK_PERIOD= CLK_HI +CLK_LO; // 100 MHZ
	
	parameter converter = 2**10 ; // 10 fraction bits 
	// Instantiate the Unit Under Test (UUT)
	fft32 uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.start(start), 
		.clk_20(clk_20), 
		.Xn_0(Xn_0), 
		.Xn_1(Xn_1), 
		.Xn_2(Xn_2), 
		.Xn_3(Xn_3), 
		.Xn_4(Xn_4), 
		.Xn_5(Xn_5), 
		.Xn_6(Xn_6), 
		.Xn_7(Xn_7), 
		.Xn_8(Xn_8), 
		.Xn_9(Xn_9), 
		.Xn_10(Xn_10), 
		.Xn_11(Xn_11), 
		.Xn_12(Xn_12), 
		.Xn_13(Xn_13), 
		.Xn_14(Xn_14), 
		.Xn_15(Xn_15), 
		.Xn_16(Xn_16), 
		.Xn_17(Xn_17), 
		.Xn_18(Xn_18), 
		.Xn_19(Xn_19), 
		.Xn_20(Xn_20), 
		.Xn_21(Xn_21), 
		.Xn_22(Xn_22), 
		.Xn_23(Xn_23), 
		.Xn_24(Xn_24), 
		.Xn_25(Xn_25), 
		.Xn_26(Xn_26), 
		.Xn_27(Xn_27), 
		.Xn_28(Xn_28), 
		.Xn_29(Xn_29), 
		.Xn_30(Xn_30), 
		.Xn_31(Xn_31), 
		.Xw_out_0(Xw_out_0), 
		.Xw_out_1(Xw_out_1), 
		.Xw_out_2(Xw_out_2), 
		.Xw_out_3(Xw_out_3), 
		.Xw_out_4(Xw_out_4), 
		.Xw_out_5(Xw_out_5), 
		.Xw_out_6(Xw_out_6), 
		.Xw_out_7(Xw_out_7), 
		.Xw_out_8(Xw_out_8), 
		.Xw_out_9(Xw_out_9), 
		.Xw_out_10(Xw_out_10), 
		.Xw_out_11(Xw_out_11), 
		.Xw_out_12(Xw_out_12), 
		.Xw_out_13(Xw_out_13), 
		.Xw_out_14(Xw_out_14), 
		.Xw_out_15(Xw_out_15), 
		.Xw_out_16(Xw_out_16), 
		.Xw_out_17(Xw_out_17), 
		.Xw_out_18(Xw_out_18), 
		.Xw_out_19(Xw_out_19), 
		.Xw_out_20(Xw_out_20), 
		.Xw_out_21(Xw_out_21), 
		.Xw_out_22(Xw_out_22), 
		.Xw_out_23(Xw_out_23), 
		.Xw_out_24(Xw_out_24), 
		.Xw_out_25(Xw_out_25), 
		.Xw_out_26(Xw_out_26), 
		.Xw_out_27(Xw_out_27), 
		.Xw_out_28(Xw_out_28), 
		.Xw_out_29(Xw_out_29), 
		.Xw_out_30(Xw_out_30), 
		.Xw_out_31(Xw_out_31)
	);

	always 
		begin 
		#CLK_LO clk=~clk ;
		#CLK_HI clk=~clk ; 
		end 
	always 
		begin 
		#25 clk_20=~clk_20 ; 
		end 
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		start = 0;
		clk_20 = 0;
		Xn_0 = 0;
		Xn_1 = 0;
		Xn_2 = 0;
		Xn_3 = 0;
		Xn_4 = 0;
		Xn_5 = 0;
		Xn_6 = 0;
		Xn_7 = 0;
		Xn_8 = 0;
		Xn_9 = 0;
		Xn_10 = 0;
		Xn_11 = 0;
		Xn_12 = 0;
		Xn_13 = 0;
		Xn_14 = 0;
		Xn_15 = 0;
		Xn_16 = 0;
		Xn_17 = 0;
		Xn_18 = 0;
		Xn_19 = 0;
		Xn_20 = 0;
		Xn_21 = 0;
		Xn_22 = 0;
		Xn_23 = 0;
		Xn_24 = 0;
		Xn_25 = 0;
		Xn_26 = 0;
		Xn_27 = 0;
		Xn_28 = 0;
		Xn_29 = 0;
		Xn_30 = 0;
		Xn_31 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
      // RESET  
		rst_n= 1'b1 ;
		#CLK_PERIOD ; 
		rst_n= 1'b0 ;
		
		//--------------------------xn= [2,2,2,0,0,etc] ------------------------//
		#10 ;
		start=1'b1 ;
		Xn_0 = 24'b 0_0000000000010_0000000000 ;
		Xn_1 = 24'b 0_0000000000010_0000000000 ;
		Xn_2 = 24'b 0_0000000000010_0000000000 ;
		Xn_3 = 0;
		Xn_4 = 0;
		Xn_5 = 0;
		Xn_6 = 0;
		Xn_7 = 0;
		Xn_8 = 0;
		Xn_9 = 0;
		Xn_10 = 0;
		Xn_11 = 0;
		Xn_12 = 0;
		Xn_13 = 0;
		Xn_14 = 0;
		Xn_15 = 0;
		Xn_16 = 0;
		Xn_17 = 0;
		Xn_18 = 0;
		Xn_19 = 0;
		Xn_20 = 0;
		Xn_21 = 0;
		Xn_22 = 0;
		Xn_23 = 0;
		Xn_24 = 0;
		Xn_25 = 0;
		Xn_26 = 0;
		Xn_27 = 0;
		Xn_28 = 0;
		Xn_29 = 0;
		Xn_30 = 0;
		Xn_31 = 0;
		
		//------------------CHECK RESULTS -----------------------------//
		repeat(6) @(posedge clk) // 5 clk cycles + 1 to change idle state 
		#1; 
		$display($time);
		$display("---------X[k]-----------");
		
		$write("X[0]=");
		if (Xw_out_0[47]) 
			$write("-");
		else 
			$write(" ");
		
		$write("%f", $itor(Xw_out_0[46:24]/converter));
		if (Xw_out_0[23]) 
			$write(" - ");
		else 
			$write(" + ");
		$write("j %f \n",$itor(Xw_out_0[22:0]/converter)); 
		
		//---------------------------------------------------------------------------//
		$write("X[1]=");
		if (Xw_out_1[47]) 
			$write("-");
		else 
			$write(" ");
		
		$write("%f", $itor(Xw_out_1[46:24]/converter));
		if (Xw_out_1[23]) 
			$write(" - ");
		else 
			$write(" + ");
		$write("j %f \n",$itor(Xw_out_1[22:0]/converter)); 
		//-----------------------------------------------------------------------------------//
		$write("X[2]=");
		if (Xw_out_2[47]) 
			$write("-");
		else 
			$write(" ");
		
		$write("%f", $itor(Xw_out_2[46:24]/converter));
		if (Xw_out_2[23]) 
			$write(" - ");
		else 
			$write(" + ");
		$write("j %f \n",$itor(Xw_out_2[22:0]/converter)); 
		
		//-----------------------------------------------------------------------//
		$write("X[3]=");
		if (Xw_out_3[47]) 
			$write("-");
		else 
			$write(" ");
		
		$write("%f", $itor(Xw_out_3[46:24]/converter));
		if (Xw_out_3[23]) 
			$write(" - ");
		else 
			$write(" + ");
		$write("j %f \n",$itor(Xw_out_3[22:0]/converter)); 
		//-----------------------------------------------------------------------------------//
		$write("X[4]=");
		if (Xw_out_4[47]) 
			$write("-");
		else 
			$write(" ");
		
		$write("%f", $itor(Xw_out_4[46:24]/converter));
		if (Xw_out_4[23]) 
			$write(" - ");
		else 
			$write(" + ");
		$write("j %f \n",$itor(Xw_out_4[22:0]/converter)); 
		
		//---------------------------------------------------------------------------//
		$write("X[5]=");
		if (Xw_out_5[47]) 
			$write("-");
		else 
			$write(" ");
		
		$write("%f", $itor(Xw_out_5[46:24]/converter));
		if (Xw_out_5[23]) 
			$write(" - ");
		else 
			$write(" + ");
		$write("j %f \n",$itor(Xw_out_5[22:0]/converter)); 
		//-----------------------------------------------------------------------------------//
		$write("X[6]=");
		if (Xw_out_6[47]) 
			$write("-");
		else 
			$write(" ");
		
		$write("%f", $itor(Xw_out_6[46:24]/converter));
		if (Xw_out_6[23]) 
			$write(" - ");
		else 
			$write(" + ");
		$write("j %f \n",$itor(Xw_out_6[22:0]/converter)); 
		
		//-----------------------------------------------------------------------//
		$write("X[7]=");
		if (Xw_out_7[47]) 
			$write("-");
		else 
			$write(" ");
		
		$write("%f", $itor(Xw_out_7[46:24]/converter));
		if (Xw_out_7[23]) 
			$write(" - ");
		else 
			$write(" + ");
		$write("j %f \n",$itor(Xw_out_7[22:0]/converter)); 
		//-----------------------------------------------------------------------------------//
		//--------------------------xn= [2,0,0, etc] ------------------------//
		start=1'b1 ;
		Xn_0 = 24'b 0_0000000000010_0000000000 ;
		Xn_1 = 0;
		Xn_2 = 0 ;
		Xn_3 = 0;
		Xn_4 = 0;
		Xn_5 = 0;
		Xn_6 = 0;
		Xn_7 = 0;
		Xn_8 = 0;
		Xn_9 = 0;
		Xn_10 = 0;
		Xn_11 = 0;
		Xn_12 = 0;
		Xn_13 = 0;
		Xn_14 = 0;
		Xn_15 = 0;
		Xn_16 = 0;
		Xn_17 = 0;
		Xn_18 = 0;
		Xn_19 = 0;
		Xn_20 = 0;
		Xn_21 = 0;
		Xn_22 = 0;
		Xn_23 = 0;
		Xn_24 = 0;
		Xn_25 = 0;
		Xn_26 = 0;
		Xn_27 = 0;
		Xn_28 = 0;
		Xn_29 = 0;
		Xn_30 = 0;
		Xn_31 = 0;

		/*
		//------------------------- SIN (wn) --------------------------// 
		//---w = pi/16
		start=1'b1 ;
		Xn_0 = 24'b 0_0000000000000_0000000000 ;
		Xn_1 = 24'b 0_0000000000000_0011001000 ;
		Xn_2 = 24'b 0_0000000000000_0110001000 ;
		Xn_3 = 24'b 0_0000000000000_1000111001 ;
		Xn_4 = 24'b 0_0000000000000_1011010100 ;
		Xn_5 = 24'b 0_0000000000000_1101010011 ;
		Xn_6 = 24'b 0_0000000000000_1110110010 ;
		Xn_7 = 24'b 0_0000000000000_1111101100 ;
		
		Xn_8 = 24'b 0_0000000000001_0000000000 ;
		
		Xn_9 = 24'b 0_0000000000000_1111101100 ;
		Xn_10 =24'b 0_0000000000000_1110110010 ;
		Xn_11 =24'b 0_0000000000000_1101010011 ;
		Xn_12 =24'b 0_0000000000000_1011010100 ;
		Xn_13 =24'b 0_0000000000000_1000111001 ;
		Xn_14 = 24'b 0_0000000000000_0110001000 ;
		Xn_15 = 24'b 0_0000000000000_0011001000 ;
		Xn_16 = 24'b 0_0000000000000_0000000000 ;
		
		Xn_17 = 24'b 1_0000000000000_0110001000 ;
		Xn_18 = 24'b 1_0000000000000_1000111001 ;
		Xn_19 = 24'b 1_0000000000000_1011010100 ;
		Xn_20 = 24'b 1_0000000000000_1101010011 ;
		Xn_21 = 24'b 1_0000000000000_1110110010 ;
		Xn_22 = 24'b 1_0000000000000_1111101100 ;
		
		Xn_23 = 24'b 1_0000000000001_0000000000 ;
		
		Xn_24 = 24'b 1_0000000000000_1111101100 ;
		Xn_25 =24'b 1_0000000000000_1110110010 ;
		Xn_26 =24'b 1_0000000000000_1101010011 ;
		Xn_27 =24'b 1_0000000000000_1011010100 ;
		Xn_28 =24'b 1_0000000000000_1000111001 ;
		Xn_29 = 24'b 1_0000000000000_0110001000 ;
		Xn_30 = 24'b 1_0000000000000_0011001000 ;
		Xn_31 = 24'b 0_0000000000000_0000000000 ;
		*/
		//--------------------------------------------------------------//
	end
      
endmodule

