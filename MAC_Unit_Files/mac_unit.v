module mac_unit(input clk,en,clr,
                input [15:0]a,b,
                output [63:0]c);

wire [31:0]temp1;

mul_16x16 m1(clk,a,b,temp1);

accumulator a1(clk,en,clr,temp1,c);

endmodule
