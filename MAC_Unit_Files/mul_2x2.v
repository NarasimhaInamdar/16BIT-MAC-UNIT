module mul_2x2(input clk,
               input [1:0]a,b,
               output [3:0]out);           
reg [1:0]clk_a,clk_b;
wire [3:0]temp;

always @(posedge clk)
 begin
  clk_a=a;
  clk_b=b;
 end

assign out[0]=clk_a[0]&clk_b[0];
assign temp[0]=clk_a[0]&clk_b[1];
assign temp[1]=clk_a[1]&clk_b[0];
assign temp[2]=clk_a[1]&clk_b[1];

half_adder h1(temp[0],temp[1],out[1],temp[3]);
half_adder h2(temp[3],temp[2],out[2],out[3]);
 
endmodule
