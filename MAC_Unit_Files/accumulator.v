module accumulator(input clk,en,clr,
                   input [31:0]a,
                   output [63:0]c);

reg [63:0]acc;
 
always @(posedge clk)
 begin
  if (clr)
   acc <= 64'b0;
  else if (en)
  begin 
   acc <= acc + a;
  end
 end
  
assign c = acc;

endmodule
