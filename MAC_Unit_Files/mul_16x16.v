module mul_16x16(input clk,
		         input [15:0]a,
                 input [15:0]b,
                 output [31:0]c);

reg [15:0]clk_a,clk_b;
wire [15:0]q0,q1,q2,q3,q4;	
wire [15:0]temp1;
wire [23:0]temp2,temp3,temp4;
wire [23:0]q5,q6;

always @(posedge clk)
 begin
  clk_a=a;
  clk_b=b;
 end

// using 4 8x8 multipliers
mul_8x8 m1(clk,clk_a[7:0],clk_b[7:0],q0[15:0]);
mul_8x8 m2(clk,clk_a[15:8],clk_b[7:0],q1[15:0]);
mul_8x8 m3(clk,clk_a[7:0],clk_b[15:8],q2[15:0]);
mul_8x8 m4(clk,clk_a[15:8],clk_b[15:8],q3[15:0]);

// stage 1 adders 
assign temp1 ={8'b0,q0[15:8]};
adder_16bit a1(q1[15:0],temp1,1'b0,q4,);

assign temp2 ={8'b0,q2[15:0]};
assign temp3 ={q3[15:0],8'b0};
adder_24bit a2(temp2,temp3,1'b0,q5,);

assign temp4={8'b0,q4[15:0]};

//stage 2 adder
adder_24bit a3(temp4,q5,1'b0,q6,);

// fnal output assignment 
assign c[7:0]=q0[7:0];
assign c[31:8]=q6[23:0];


endmodule
