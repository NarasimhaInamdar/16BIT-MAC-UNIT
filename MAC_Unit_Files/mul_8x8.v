module mul_8x8(input clk,
               input [7:0] a,b,
               output [15:0]c);
               
wire [7:0]q0,q1,q2,q3,q4;
wire [11:0]q5,q6;	
wire [7:0]temp1;
wire [11:0]temp2,temp3,temp4;
reg [7:0]clk_a,clk_b;

always @(posedge clk)
begin
 clk_a=a;
 clk_b=b;
end
// using 4 4x4 multipliers
mul_4x4 mu1(clk,clk_a[3:0],clk_b[3:0],q0[7:0]);
mul_4x4 mu2(clk,clk_a[7:4],clk_b[3:0],q1[7:0]);
mul_4x4 mu3(clk,clk_a[3:0],clk_b[7:4],q2[7:0]);
mul_4x4 mu4(clk,clk_a[7:4],clk_b[7:4],q3[7:0]);

// stage 1 adders 
assign temp1 ={4'b0000,q0[7:4]};
adder_8bit a1(q1[7:0],temp1,1'b0,q4,);

assign temp2 ={4'b0000,q2[7:0]};
assign temp3 ={q3[7:0],4'b0000};
adder_12bit a2(temp2,temp3,1'b0,q5,);

assign temp4={4'b0000,q4[7:0]};
// stage 2 adder
adder_12bit a3(temp4,q5,1'b0,q6,);

// fnal output assignment 
assign c[3:0]=q0[3:0];
assign c[15:4]=q6[11:0];

endmodule    

