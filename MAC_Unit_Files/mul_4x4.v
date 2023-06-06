module mul_4x4(input clk,
               input [3:0]a,
               input [3:0]b,
               output [7:0]c);
wire [3:0]q0,q1,q2,q3,q4;
wire [5:0]q5,q6;		
wire [3:0]temp1;
wire [5:0]temp2,temp3,temp4;
reg [3:0]clk_a,clk_b;

always @(posedge clk)
begin
 clk_a=a;
 clk_b=b;
end
// using 4 2x2 multipliers
mul_2x2 m1(clk,clk_a[1:0],clk_b[1:0],q0[3:0]);
mul_2x2 m2(clk,clk_a[3:2],clk_b[1:0],q1[3:0]);
mul_2x2 m3(clk,clk_a[1:0],clk_b[3:2],q2[3:0]);
mul_2x2 m4(clk,clk_a[3:2],clk_b[3:2],q3[3:0]);

// stage 1 adders 
assign temp1 ={2'b00,q0[3:2]};
adder_4bit a1(q1[3:0],temp1,1'b0,q4,);

assign temp2 ={2'b00,q2[3:0]};
assign temp3 ={q3[3:0],2'b00};

adder_6bit a2(temp2,temp3,1'b0,q5,);
assign temp4={2'b00,q4[3:0]};

// stage 2 adder 
adder_6bit a3(temp4,q5,1'b0,q6,);

// fnal output assignment 
assign c[1:0]=q0[1:0];
assign c[7:2]=q6[5:0];

endmodule