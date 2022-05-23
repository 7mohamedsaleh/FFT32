`timescale 1ns / 1ps

module fft32(
	 input clk,clk_20,rst_n,start,
//--------------------INPUTS --------------//
	 input [23:0] Xn_0,
	 input [23:0] Xn_1,
	 input [23:0] Xn_2,
	 input [23:0] Xn_3,
	 input [23:0] Xn_4,
	 input [23:0] Xn_5,
	 input [23:0] Xn_6,
	 input [23:0] Xn_7,
	 input [23:0] Xn_8,
	 input [23:0] Xn_9,
	 
	 input [23:0] Xn_10,
	 input [23:0] Xn_11,
	 input [23:0] Xn_12,
	 input [23:0] Xn_13,
	 input [23:0] Xn_14,
	 input [23:0] Xn_15,
	 input [23:0] Xn_16,
	 input [23:0] Xn_17,
	 input [23:0] Xn_18,
	 input [23:0] Xn_19,
	 input [23:0] Xn_20,
	 
	 input [23:0] Xn_21,
	 input [23:0] Xn_22,
	 input [23:0] Xn_23,
	 input [23:0] Xn_24,
	 input [23:0] Xn_25,
	 input [23:0] Xn_26,
	 input [23:0] Xn_27,
	 input [23:0] Xn_28,
	 input [23:0] Xn_29,
	 input [23:0] Xn_30,
	 
	 input [23:0] Xn_31,
//--------------------OUTPUTS ------------------------//
	 output [47:0] Xw_out_0,
	 output [47:0] Xw_out_1,
	 output [47:0] Xw_out_2,
	 output [47:0] Xw_out_3,
	 output [47:0] Xw_out_4,
	 output [47:0] Xw_out_5,
	 output [47:0] Xw_out_6,
	 output [47:0] Xw_out_7,
	 output [47:0] Xw_out_8,
	 output [47:0] Xw_out_9,
	 
	 output [47:0] Xw_out_10,
	 output [47:0] Xw_out_11,
	 output [47:0] Xw_out_12,
	 output [47:0] Xw_out_13,
	 output [47:0] Xw_out_14,
	 output [47:0] Xw_out_15,
	 output [47:0] Xw_out_16,
	 output [47:0] Xw_out_17,
	 output [47:0] Xw_out_18,
	 output [47:0] Xw_out_19,
	 output [47:0] Xw_out_20,
	 
	 output [47:0] Xw_out_21,
	 output [47:0] Xw_out_22,
	 output [47:0] Xw_out_23,
	 output [47:0] Xw_out_24,
	 output [47:0] Xw_out_25,
	 output [47:0] Xw_out_26,
	 output [47:0] Xw_out_27,
	 output [47:0] Xw_out_28,
	 output [47:0] Xw_out_29,
	 output [47:0] Xw_out_30,
	 
	 output [47:0] Xw_out_31
    );

//--------------------MAC_output_regs --------------//
//wire 	[47:0]	mac1_out1,mac2_out1,mac3_out1,mac4_out1,mac5_out1,mac6_out1,mac7_out1,mac8_out1,
				//mac9_out1,mac10_out1,mac11_out1,mac12_out1,mac13_out1,mac14_out1,mac15_out1,mac16_out1;

//wire 	[47:0]	mac1_out2,mac2_out2,mac3_out2,mac4_out2,mac5_out2,mac6_out2,mac7_out2,mac8_out2,
				//mac9_out2,mac10_out2,mac11_out2,mac12_out2,mac13_out2,mac14_out2,mac15_out2,mac16_out2;
	
//--------------------internal signal --------------//
	 wire [47:0] Xw_0;
	 wire [47:0] Xw_1;
	 wire [47:0] Xw_2;
	 wire [47:0] Xw_3;
	 wire [47:0] Xw_4;
	 wire [47:0] Xw_5;
	 wire [47:0] Xw_6;
	 wire [47:0] Xw_7;
	 wire [47:0] Xw_8;
	 wire [47:0] Xw_9;
	 
	 wire [47:0] Xw_10;
	 wire [47:0] Xw_11;
	 wire [47:0] Xw_12;
	 wire [47:0] Xw_13;
	 wire [47:0] Xw_14;
	 wire [47:0] Xw_15;
	 wire [47:0] Xw_16;
	 wire [47:0] Xw_17;
	 wire [47:0] Xw_18;
	 wire [47:0] Xw_19;
	 wire [47:0] Xw_20;
	 
	 wire [47:0] Xw_21;
	 wire [47:0] Xw_22;
	 wire [47:0] Xw_23;
	 wire [47:0] Xw_24;
	 wire [47:0] Xw_25;
	 wire [47:0] Xw_26;
	 wire [47:0] Xw_27;
	 wire [47:0] Xw_28;
	 wire [47:0] Xw_29;
	 wire [47:0] Xw_30;
	 
	 wire [47:0] Xw_31;
////////controller
wire [2:0] sel_line;
wire [23:0] w_1_real , w_1_imag , w_2_real , w_2_imag , w_3_real , w_3_imag , w_4_real , w_4_imag , w_5_real , w_5_imag , w_6_real , w_6_imag , w_7_real , w_7_imag , w_8_real , w_8_imag , w_9_real , w_9_imag , w_10_real , w_10_imag , w_11_real , w_11_imag , w_12_real , w_12_imag , w_13_real , w_13_imag , w_14_real , w_14_imag , w_15_real , w_15_imag , w_16_real , w_16_imag;

controller controller_inst 
(start,clk,rst_n,sel_line,
w_1_real , w_1_imag , w_2_real ,w_2_imag ,
w_3_real , w_3_imag ,w_4_real , w_4_imag ,
w_5_real ,w_5_imag , w_6_real , w_6_imag ,
w_7_real , w_7_imag , w_8_real , w_8_imag ,
w_9_real , w_9_imag , w_10_real , w_10_imag ,
w_11_real , w_11_imag , w_12_real , w_12_imag ,
w_13_real , w_13_imag , w_14_real , w_14_imag ,
w_15_real , w_15_imag , w_16_real , w_16_imag
);


//----------------------( row 1 )--------------------//
mux_mac_regs inst_1 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{Xn_0,24'b 0}		), 
		.sample_1_1(Xw_0), 
		.sample_1_2(Xw_0), 
		.sample_1_3(Xw_0), 
		.sample_1_4(Xw_0), 
		.sample_2_0(	{Xn_16,24'b 0}		), 
		.sample_2_1(Xw_1), 
		.sample_2_2(Xw_2), 
		.sample_2_3(Xw_4), 
		.sample_2_4(Xw_8), 
		.twiddle_real(w_1_real), 
		.twiddle_imaj(w_1_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_0), 
		.output_sub(Xw_16),
		
		.output_add_20MHZ(Xw_out_0),
		.output_sub_20MHZ(Xw_out_16)
	);
//----------------------( row 2 )--------------------//
mux_mac_regs inst_2 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{Xn_8,24'b 0}		), 
		.sample_1_1(Xw_16), 
		.sample_1_2(Xw_1), 
		.sample_1_3(Xw_1), 
		.sample_1_4(Xw_1), 
		.sample_2_0(	{Xn_24,24'b 0}		), 
		.sample_2_1(Xw_17), 
		.sample_2_2(Xw_3), 
		.sample_2_3(Xw_5), 
		.sample_2_4(Xw_9), 
		.twiddle_real(w_2_real), 
		.twiddle_imaj(w_2_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_1), 
		.output_sub(Xw_17),
		
		.output_add_20MHZ(Xw_out_1),
		.output_sub_20MHZ(Xw_out_17)
	);
//----------------------( row 3 )--------------------//
mux_mac_regs inst_3 (
		.clk(clk),
		.clk_20(clk_20) ,		
		.rst_n(rst_n), 
		.sample_1_0({Xn_4,24'b 0}), 
		.sample_1_1(Xw_2), 
		.sample_1_2(Xw_16), 
		.sample_1_3(Xw_2), 
		.sample_1_4(Xw_2), 
		.sample_2_0({Xn_20,24'b 0}), 
		.sample_2_1(Xw_3), 
		.sample_2_2(Xw_18), 
		.sample_2_3(Xw_6), 
		.sample_2_4(Xw_10), 
		.twiddle_real(w_3_real), 
		.twiddle_imaj(w_3_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_2), 
		.output_sub(Xw_18),
		
		.output_add_20MHZ(Xw_out_2),
		.output_sub_20MHZ(Xw_out_18)
	);
//----------------------( row 4 )--------------------//
mux_mac_regs inst_4 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_12,24'b 0}	), 
		.sample_1_1(Xw_18), 
		.sample_1_2(Xw_17), 
		.sample_1_3(Xw_3), 
		.sample_1_4(Xw_3),
		
		.sample_2_0(	{	Xn_28,	24'b 0}	), 
		.sample_2_1(Xw_19), 
		.sample_2_2(Xw_19), 
		.sample_2_3(Xw_7), 
		.sample_2_4(Xw_11), 
		.twiddle_real(w_4_real), 
		.twiddle_imaj(w_4_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_3), 
		.output_sub(Xw_19),
		
		.output_add_20MHZ(Xw_out_3),
		.output_sub_20MHZ(Xw_out_19)
	);
//----------------------( row 5 )--------------------//
mux_mac_regs inst_5 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_2,24'b 0}	), 
		.sample_1_1(Xw_4), 
		.sample_1_2(Xw_4), 
		.sample_1_3(Xw_16), 
		.sample_1_4(Xw_4),
		
		.sample_2_0(	{	Xn_18,24'b 0}	), 
		.sample_2_1(Xw_5), 
		.sample_2_2(Xw_6), 
		.sample_2_3(Xw_20), 
		.sample_2_4(Xw_12), 
		.twiddle_real(w_5_real), 
		.twiddle_imaj(w_5_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_4), 
		.output_sub(Xw_20),
		
		.output_add_20MHZ(Xw_out_4),
		.output_sub_20MHZ(Xw_out_20)
	);
//----------------------( row 6 )--------------------//
mux_mac_regs inst_6 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_10,24'b 0}	), 
		.sample_1_1(Xw_20), 
		.sample_1_2(Xw_5), 
		.sample_1_3(Xw_17), 
		.sample_1_4(Xw_5),
		
		.sample_2_0({	Xn_26,24'b 0}	), 
		.sample_2_1(Xw_21), 
		.sample_2_2(Xw_7), 
		.sample_2_3(Xw_21), 
		.sample_2_4(Xw_13), 
		.twiddle_real(w_6_real), 
		.twiddle_imaj(w_6_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_5), 
		.output_sub(Xw_21),
		
		.output_add_20MHZ(Xw_out_5),
		.output_sub_20MHZ(Xw_out_21)
	);
//----------------------( row 7 )--------------------//
mux_mac_regs inst_7 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0({	Xn_6,24'b 0}	), 
		.sample_1_1(Xw_6), 
		.sample_1_2(Xw_20), 
		.sample_1_3(Xw_18), 
		.sample_1_4(Xw_6),
		
		.sample_2_0(	{	Xn_22,24'b 0}	), 
		.sample_2_1(Xw_7), 
		.sample_2_2(Xw_22), 
		.sample_2_3(Xw_22), 
		.sample_2_4(Xw_14), 
		.twiddle_real(w_7_real), 
		.twiddle_imaj(w_7_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_6), 
		.output_sub(Xw_22),
		
		.output_add_20MHZ(Xw_out_6),
		.output_sub_20MHZ(Xw_out_22)
	);
//----------------------( row 8 )--------------------//
mux_mac_regs inst_8 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_4,24'b 0}	), 
		.sample_1_1(Xw_22), 
		.sample_1_2(Xw_21), 
		.sample_1_3(Xw_19), 
		.sample_1_4(Xw_7),
		
		.sample_2_0(	{	Xn_30,24'b 0}	), 
		.sample_2_1(Xw_23), 
		.sample_2_2(Xw_23), 
		.sample_2_3(Xw_23), 
		.sample_2_4(Xw_15), 
		.twiddle_real(w_8_real), 
		.twiddle_imaj(w_8_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_7), 
		.output_sub(Xw_23),
		
		.output_add_20MHZ(Xw_out_7),
		.output_sub_20MHZ(Xw_out_23)
	);
//----------------------( row 9 )--------------------//
mux_mac_regs inst_9 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_1,24'b 0}	), 
		.sample_1_1(Xw_8), 
		.sample_1_2(Xw_8 ), 
		.sample_1_3(Xw_8 ), 
		.sample_1_4(Xw_16),
		
		.sample_2_0(	{	Xn_17,24'b 0}	), 
		.sample_2_1(Xw_9), 
		.sample_2_2(Xw_10), 
		.sample_2_3(Xw_12), 
		.sample_2_4(Xw_24), 
		.twiddle_real(w_9_real), 
		.twiddle_imaj(w_9_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_8), 
		.output_sub(Xw_24),
		
		.output_add_20MHZ(Xw_out_8),
		.output_sub_20MHZ(Xw_out_24)
	);
//----------------------( row 10 )--------------------//
mux_mac_regs inst_10 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_9,24'b 0}	), 
		.sample_1_1(Xw_24), 
		.sample_1_2(Xw_9), 
		.sample_1_3(Xw_9), 
		.sample_1_4(Xw_17),
		
		.sample_2_0(	{	Xn_25,24'b 0}	), 
		.sample_2_1(Xw_25), 
		.sample_2_2(Xw_11), 
		.sample_2_3(Xw_13), 
		.sample_2_4(Xw_25), 
		.twiddle_real(w_10_real), 
		.twiddle_imaj(w_10_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_9), 
		.output_sub(Xw_25),
		
		.output_add_20MHZ(Xw_out_9),
		.output_sub_20MHZ(Xw_out_25)
	);
//----------------------( row 11 )--------------------//
mux_mac_regs inst_11 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_5,24'b 0}	), 
		.sample_1_1(Xw_10), 
		.sample_1_2(Xw_24), 
		.sample_1_3(Xw_10), 
		.sample_1_4(Xw_18),
		
		.sample_2_0({	Xn_21,24'b 0}	), 
		.sample_2_1(Xw_11), 
		.sample_2_2(Xw_26), 
		.sample_2_3(Xw_14), 
		.sample_2_4(Xw_26), 
		.twiddle_real(w_11_real), 
		.twiddle_imaj(w_11_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_10), 
		.output_sub(Xw_26),
		
		.output_add_20MHZ(Xw_out_10),
		.output_sub_20MHZ(Xw_out_26)
	);
//----------------------( row 12 )--------------------//
mux_mac_regs inst_12 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_13,24'b 0}	), 
		.sample_1_1(Xw_26), 
		.sample_1_2(Xw_25), 
		.sample_1_3(Xw_11), 
		.sample_1_4(Xw_19),
		
		.sample_2_0(	{	Xn_29,24'b 0}	), 
		.sample_2_1(Xw_27), 
		.sample_2_2(Xw_27), 
		.sample_2_3(Xw_15), 
		.sample_2_4(Xw_27), 
		.twiddle_real(w_12_real), 
		.twiddle_imaj(w_12_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_11), 
		.output_sub(Xw_27),
		
		.output_add_20MHZ(Xw_out_11),
		.output_sub_20MHZ(Xw_out_27)
	);
//----------------------( row 13 )--------------------//
mux_mac_regs inst_13 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0({	Xn_3,24'b 0}	), 
		.sample_1_1(Xw_12), 
		.sample_1_2(Xw_12), 
		.sample_1_3(Xw_24), 
		.sample_1_4(Xw_20),
		
		.sample_2_0({	Xn_19,24'b 0}	), 
		.sample_2_1(Xw_13), 
		.sample_2_2(Xw_14), 
		.sample_2_3(Xw_28), 
		.sample_2_4(Xw_28), 
		.twiddle_real(w_13_real), 
		.twiddle_imaj(w_13_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_12), 
		.output_sub(Xw_28),
		
		.output_add_20MHZ(Xw_out_12),
		.output_sub_20MHZ(Xw_out_28)	
	);
//----------------------( row 14 )--------------------//
mux_mac_regs inst_14 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_11,24'b 0}	), 
		.sample_1_1(Xw_28), 
		.sample_1_2(Xw_13), 
		.sample_1_3(Xw_25), 
		.sample_1_4(Xw_21),
		
		.sample_2_0({	Xn_27,24'b 0}	), 
		.sample_2_1(Xw_29), 
		.sample_2_2(Xw_15), 
		.sample_2_3(Xw_29), 
		.sample_2_4(Xw_29), 
		.twiddle_real(w_14_real), 
		.twiddle_imaj(w_14_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_13), 
		.output_sub(Xw_29),
		
		.output_add_20MHZ(Xw_out_13),
		.output_sub_20MHZ(Xw_out_29)
	);
//----------------------( row 15 )--------------------//
mux_mac_regs inst_15 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0(	{	Xn_7,24'b 0}	), 
		.sample_1_1(Xw_14), 
		.sample_1_2(Xw_28), 
		.sample_1_3(Xw_26), 
		.sample_1_4(Xw_22),
		
		.sample_2_0(	{	Xn_23,24'b 0}	), 
		.sample_2_1(Xw_15), 
		.sample_2_2(Xw_30), 
		.sample_2_3(Xw_30), 
		.sample_2_4(Xw_30), 
		.twiddle_real(w_15_real), 
		.twiddle_imaj(w_15_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_14), 
		.output_sub(Xw_30),
		
		.output_add_20MHZ(Xw_out_14),
		.output_sub_20MHZ(Xw_out_30)
	);
//----------------------( row 16 )--------------------//
mux_mac_regs inst_16 (
		.clk(clk), 
		.clk_20(clk_20) ,
		.rst_n(rst_n), 
		.sample_1_0({	Xn_15,24'b 0}	), 
		.sample_1_1(Xw_30), 
		.sample_1_2(Xw_29), 
		.sample_1_3(Xw_27), 
		.sample_1_4(Xw_23),
		
		.sample_2_0(	{Xn_31,24'b 0} 	), 
		.sample_2_1(Xw_31), 
		.sample_2_2(Xw_31), 
		.sample_2_3(Xw_31), 
		.sample_2_4(Xw_31), 
		.twiddle_real(w_16_real), 
		.twiddle_imaj(w_16_imag), 
		.sel_line(sel_line), 
		.output_add(Xw_15), 
		.output_sub(Xw_31),
		
		.output_add_20MHZ(Xw_out_15),
		.output_sub_20MHZ(Xw_out_31)
	);
endmodule
