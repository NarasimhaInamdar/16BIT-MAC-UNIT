module mac_unit_tb;

reg [15:0]a,b;
reg clk,en,clr;
wire [63:0]c;
  
mac_unit dut(clk,en,clr,a,b,c);

initial 
 begin
  a = 16'h1234;
  b = 16'h5678;
  en = 0;
  clr = 0;
  clk = 1;
#10 clr = 1;
#5 clr = 0;
   en = 1;
#50 $display("Output: %h",c);
    $finish;
 end
  
always 
 #5 clk = ~clk;
  
endmodule
