module mux2_1(input a,b,sel,
              output y);
              
assign y=sel?b:a;
endmodule
