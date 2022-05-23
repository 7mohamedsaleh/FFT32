module controller (start , clk_2 , rst , sel , w_1_real , w_1_imag , w_2_real , w_2_imag , w_3_real , w_3_imag , w_4_real , w_4_imag , w_5_real , w_5_imag , w_6_real , w_6_imag , w_7_real , w_7_imag , w_8_real , w_8_imag , w_9_real , w_9_imag , w_10_real , w_10_imag , w_11_real , w_11_imag , w_12_real , w_12_imag , w_13_real , w_13_imag , w_14_real , w_14_imag , w_15_real , w_15_imag , w_16_real , w_16_imag);
input start , clk_2 , rst;
output reg [2:0]sel;
output reg [23:0]w_1_real , w_1_imag , w_2_real , w_2_imag , w_3_real , w_3_imag , w_4_real , w_4_imag , w_5_real , w_5_imag , w_6_real , w_6_imag , w_7_real , w_7_imag , w_8_real , w_8_imag , w_9_real , w_9_imag , w_10_real , w_10_imag , w_11_real , w_11_imag , w_12_real , w_12_imag , w_13_real , w_13_imag , w_14_real , w_14_imag , w_15_real , w_15_imag , w_16_real , w_16_imag;
//internal signals
reg [2:0]current_state , next_state;
//parameters of twiddle factors
parameter w_0_2_real = 24'b 0_0000000000001_0000000000;
parameter w_0_2_imag = 24'b 0_0000000000000_0000000000;

parameter w_0_4_real = 24'b 0_0000000000001_0000000000;
parameter w_0_4_imag = 24'b 0_0000000000000_0000000000;

parameter w_1_4_real = 24'b 0_0000000000000_0000000000;
parameter w_1_4_imag = 24'b 1_0000000000001_0000000000;

parameter w_0_8_real = 24'b 0_0000000000001_0000000000;
parameter w_0_8_imag = 24'b 0_0000000000000_0000000000;

parameter w_1_8_real = 24'b 0_0000000000000_1011010100;
parameter w_1_8_imag = 24'b 1_0000000000000_1011010100;

parameter w_2_8_real = 24'b 0_0000000000000_0000000000;
parameter w_2_8_imag = 24'b 1_0000000000001_0000000000;

parameter w_3_8_real = 24'b 1_0000000000000_1011010100;
parameter w_3_8_imag = 24'b 1_0000000000000_1011010100;

parameter w_0_16_real = 24'b 0_0000000000001_0000000000;
parameter w_0_16_imag = 24'b 0_0000000000000_0000000000;

parameter w_1_16_real = 24'b 0_0000000000000_1110110010;
parameter w_1_16_imag = 24'b 1_0000000000000_0110000111;

parameter w_2_16_real = 24'b 0_0000000000000_1011010100;
parameter w_2_16_imag = 24'b 1_0000000000000_1011010100;

parameter w_3_16_real = 24'b 0_0000000000000_0110000111;
parameter w_3_16_imag = 24'b 1_0000000000000_1110110010;

parameter w_4_16_real = 24'b 0_0000000000000_0000000000;
parameter w_4_16_imag = 24'b 1_0000000000001_0000000000;

parameter w_5_16_real = 24'b 1_0000000000000_0110000111;
parameter w_5_16_imag = 24'b 1_0000000000000_1110110010;

parameter w_6_16_real = 24'b 1_0000000000000_1011010100;
parameter w_6_16_imag = 24'b 1_0000000000000_1011010100;

parameter w_7_16_real = 24'b 1_0000000000000_1110110010;
parameter w_7_16_imag = 24'b 1_0000000000000_0110000111;

parameter w_0_32_real = 24'b 0_0000000000001_0000000000;
parameter w_0_32_imag = 24'b 0_0000000000000_0000000000;

parameter w_1_32_real = 24'b 0_0000000000000_1111101100;
parameter w_1_32_imag = 24'b 1_0000000000000_0011000111;

parameter w_2_32_real = 24'b 0_0000000000000_1110110010;
parameter w_2_32_imag = 24'b 1_0000000000000_0110000111;

parameter w_3_32_real = 24'b 0_0000000000000_1101010011;
parameter w_3_32_imag = 24'b 1_0000000000000_1000111000;

parameter w_4_32_real = 24'b 0_0000000000000_1011010100;
parameter w_4_32_imag = 24'b 1_0000000000000_1011010100;

parameter w_5_32_real = 24'b 0_0000000000000_1000111000;
parameter w_5_32_imag = 24'b 1_0000000000000_1101010011;

parameter w_6_32_real = 24'b 0_0000000000000_0110000111;
parameter w_6_32_imag = 24'b 1_0000000000000_1110110010;

parameter w_7_32_real = 24'b 0_0000000000000_0011000111;
parameter w_7_32_imag = 24'b 1_0000000000000_1111101100;

parameter w_8_32_real = 24'b 0_0000000000000_0000000000;
parameter w_8_32_imag = 24'b 1_0000000000001_0000000000;

parameter w_9_32_real = 24'b 1_0000000000000_0011000111;
parameter w_9_32_imag = 24'b 1_0000000000000_1111101100;

parameter w_10_32_real = 24'b 1_0000000000000_0110000111;
parameter w_10_32_imag = 24'b 1_0000000000000_1110110010;

parameter w_11_32_real = 24'b 1_0000000000000_1000111000;
parameter w_11_32_imag = 24'b 1_0000000000000_1101010011;

parameter w_12_32_real = 24'b 1_0000000000000_1011010100;
parameter w_12_32_imag = 24'b 1_0000000000000_1011010100;

parameter w_13_32_real = 24'b 1_0000000000000_1101010011;
parameter w_13_32_imag = 24'b 1_0000000000000_1000111000;

parameter w_14_32_real = 24'b 1_0000000000000_1110110010;
parameter w_14_32_imag = 24'b 1_0000000000000_0110000111;

parameter w_15_32_real = 24'b 1_0000000000000_1111101100;
parameter w_15_32_imag = 24'b 1_0000000000000_0011000111;

always @(posedge clk_2 or posedge rst) 
begin
    if(rst)
        current_state <= 3'b000;
    else
        current_state <= next_state;   
end
always@(*)
begin
    case(current_state)
        3'b000 : //initial case
            begin
                sel = 3'b000;
                w_1_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_1_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_2_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_2_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_3_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_3_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_4_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_4_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_5_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_5_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_6_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_6_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_7_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_7_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_8_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_8_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_9_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_9_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_10_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_10_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_11_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_11_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_12_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_12_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_13_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_13_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_14_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_14_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_15_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_15_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_16_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_16_imag = 24'b 0000_0000_0000_0000_0000_0000;
                if(start)
                    next_state = 3'b001;
                else
                    next_state = 3'b000;
            end
        3'b001 : //start first operation
            begin
                sel = 3'b000;

                w_1_real = w_0_2_real;
                w_1_imag = w_0_2_imag;

                w_2_real = w_0_2_real;
                w_2_imag = w_0_2_imag;

                w_3_real = w_0_2_real;
                w_3_imag = w_0_2_imag;

                w_4_real = w_0_2_real;
                w_4_imag = w_0_2_imag;

                w_5_real = w_0_2_real;
                w_5_imag = w_0_2_imag;

                w_6_real = w_0_2_real;
                w_6_imag = w_0_2_imag;

                w_7_real = w_0_2_real;
                w_7_imag = w_0_2_imag;

                w_8_real = w_0_2_real;
                w_8_imag = w_0_2_imag;

                w_9_real = w_0_2_real;
                w_9_imag = w_0_2_imag;

                w_10_real = w_0_2_real;
                w_10_imag = w_0_2_imag;

                w_11_real = w_0_2_real;
                w_11_imag = w_0_2_imag;

                w_12_real = w_0_2_real;
                w_12_imag = w_0_2_imag;

                w_13_real = w_0_2_real;
                w_13_imag = w_0_2_imag;

                w_14_real = w_0_2_real;
                w_14_imag = w_0_2_imag;

                w_15_real = w_0_2_real;
                w_15_imag = w_0_2_imag;

                w_16_real = w_0_2_real;
                w_16_imag = w_0_2_imag;

                next_state = 3'b010;
            end
        3'b010 : //start second operation
            begin
                sel = 3'b001;

                w_1_real = w_0_4_real;
                w_1_imag = w_0_4_imag;

                w_2_real = w_1_4_real;
                w_2_imag = w_1_4_imag;

                w_3_real = w_0_4_real;
                w_3_imag = w_0_4_imag;

                w_4_real = w_1_4_real;
                w_4_imag = w_1_4_imag;

                w_5_real = w_0_4_real;
                w_5_imag = w_0_4_imag;

                w_6_real = w_1_4_real;
                w_6_imag = w_1_4_imag;

                w_7_real = w_0_4_real;
                w_7_imag = w_0_4_imag;

                w_8_real = w_1_4_real;
                w_8_imag = w_1_4_imag;

                w_9_real = w_0_4_real;
                w_9_imag = w_0_4_imag;

                w_10_real = w_1_4_real;
                w_10_imag = w_1_4_imag;

                w_11_real = w_0_4_real;
                w_11_imag = w_0_4_imag;

                w_12_real = w_1_4_real;
                w_12_imag = w_1_4_imag;

                w_13_real = w_0_4_real;
                w_13_imag = w_0_4_imag;

                w_14_real = w_1_4_real;
                w_14_imag = w_1_4_imag;

                w_15_real = w_0_4_real;
                w_15_imag = w_0_4_imag;

                w_16_real = w_1_4_real;
                w_16_imag = w_1_4_imag;

                next_state = 3'b011;
            end
        3'b011 : //start third operation
            begin
                sel = 3'b010;

                w_1_real = w_0_8_real;
                w_1_imag = w_0_8_imag;

                w_2_real = w_1_8_real;
                w_2_imag = w_1_8_imag;

                w_3_real = w_2_8_real;
                w_3_imag = w_2_8_imag;

                w_4_real = w_3_8_real;
                w_4_imag = w_3_8_imag;

                w_5_real = w_0_8_real;
                w_5_imag = w_0_8_imag;

                w_6_real = w_1_8_real;
                w_6_imag = w_1_8_imag;

                w_7_real = w_2_8_real;
                w_7_imag = w_2_8_imag;

                w_8_real = w_3_8_real;
                w_8_imag = w_3_8_imag;

                w_9_real = w_0_8_real;
                w_9_imag = w_0_8_imag;

                w_10_real = w_1_8_real;
                w_10_imag = w_1_8_imag;

                w_11_real = w_2_8_real;
                w_11_imag = w_2_8_imag;

                w_12_real = w_3_8_real;
                w_12_imag = w_3_8_imag;

                w_13_real = w_0_8_real;
                w_13_imag = w_0_8_imag;

                w_14_real = w_1_8_real;
                w_14_imag = w_1_8_imag;

                w_15_real = w_2_8_real;
                w_15_imag = w_2_8_imag;

                w_16_real = w_3_8_real;
                w_16_imag = w_3_8_imag;

                next_state = 3'b100;
            end 
        3'b100 : //start fourth operation
            begin
                sel = 3'b011;

                w_1_real = w_0_16_real;
                w_1_imag = w_0_16_imag;

                w_2_real = w_1_16_real;
                w_2_imag = w_1_16_imag;

                w_3_real = w_2_16_real;
                w_3_imag = w_2_16_imag;

                w_4_real = w_3_16_real;
                w_4_imag = w_3_16_imag;

                w_5_real = w_4_16_real;
                w_5_imag = w_4_16_imag;

                w_6_real = w_5_16_real;
                w_6_imag = w_5_16_imag;

                w_7_real = w_6_16_real;
                w_7_imag = w_6_16_imag;

                w_8_real = w_7_16_real;
                w_8_imag = w_7_16_imag;

                w_9_real = w_0_16_real;
                w_9_imag = w_0_16_imag;

                w_10_real = w_1_16_real;
                w_10_imag = w_1_16_imag;

                w_11_real = w_2_16_real;
                w_11_imag = w_2_16_imag;

                w_12_real = w_3_16_real;
                w_12_imag = w_3_16_imag;

                w_13_real = w_4_16_real;
                w_13_imag = w_4_16_imag;

                w_14_real = w_5_16_real;
                w_14_imag = w_5_16_imag;

                w_15_real = w_6_16_real;
                w_15_imag = w_6_16_imag;

                w_16_real = w_7_16_real;
                w_16_imag = w_7_16_imag;

                next_state = 3'b101;
            end 
        3'b101 : 
            begin
                sel = 3'b100;

                w_1_real = w_0_32_real;
                w_1_imag = w_0_32_imag;

                w_2_real = w_1_32_real;
                w_2_imag = w_1_32_imag;

                w_3_real = w_2_32_real;
                w_3_imag = w_2_32_imag;

                w_4_real = w_3_32_real;
                w_4_imag = w_3_32_imag;

                w_5_real = w_4_32_real;
                w_5_imag = w_4_32_imag;

                w_6_real = w_5_32_real;
                w_6_imag = w_5_32_imag;

                w_7_real = w_6_32_real;
                w_7_imag = w_6_32_imag;

                w_8_real = w_7_32_real;
                w_8_imag = w_7_32_imag;

                w_9_real = w_8_32_real;
                w_9_imag = w_8_32_imag;

                w_10_real = w_9_32_real;
                w_10_imag = w_9_32_imag;

                w_11_real = w_10_32_real;
                w_11_imag = w_10_32_imag;

                w_12_real = w_11_32_real;
                w_12_imag = w_11_32_imag;

                w_13_real = w_12_32_real;
                w_13_imag = w_12_32_imag;

                w_14_real = w_13_32_real;
                w_14_imag = w_13_32_imag;

                w_15_real = w_14_32_real;
                w_15_imag = w_14_32_imag;

                w_16_real = w_15_32_real;
                w_16_imag = w_15_32_imag;

                next_state = 3'b001;
            end
			 default : //initial case
            begin
                sel = 3'b000;
                w_1_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_1_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_2_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_2_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_3_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_3_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_4_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_4_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_5_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_5_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_6_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_6_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_7_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_7_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_8_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_8_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_9_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_9_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_10_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_10_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_11_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_11_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_12_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_12_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_13_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_13_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_14_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_14_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_15_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_15_imag = 24'b 0000_0000_0000_0000_0000_0000;

                w_16_real = 24'b 0000_0000_0000_0000_0000_0000;
                w_16_imag = 24'b 0000_0000_0000_0000_0000_0000;
                next_state = 3'b000;
            end
    endcase
end
endmodule 