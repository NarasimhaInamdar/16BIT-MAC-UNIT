module full_adder(input a,b,cin,
                  output sum,co);
                  
assign sum=a^b^cin;
assign co=((a&b)||(b&cin)||(cin&a));                 
endmodule
