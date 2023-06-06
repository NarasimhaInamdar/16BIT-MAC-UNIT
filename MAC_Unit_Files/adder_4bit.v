module adder_4bit(input [3:0]a,b,
                  input cin,
                  output [3:0]sum,
                  output co);

wire s1,c1,s2,c2,s3,c3,s4,s11,s44,c4,c11,s22,c22,s33,c33,c44;

//assuming carry in 0
full_adder f1(a[0],b[0],1'b0,s1,c1);
full_adder f2(a[1],b[1],c1,s2,c2);
full_adder f3(a[2],b[2],c2,s3,c3);
full_adder f4(a[3],b[3],c3,s4,c4);

//assuming carry in 1
full_adder f5(a[0],b[0],1'b1,s11,c11);
full_adder f6(a[1],b[1],c11,s22,c22);
full_adder f7(a[2],b[2],c22,s33,c33);
full_adder f8(a[3],b[3],c33,s44,c44);

/*select either carry 1 or 0 using carry out of FA
mux for sum select*/
mux2_1 m1(s1,s11,cin,sum[0]);
mux2_1 m2(s2,s22,cin,sum[1]);
mux2_1 m3(s3,s33,cin,sum[2]);
mux2_1 m4(s4,s44,cin,sum[3]);

//mux for carry select
mux2_1 m5(c4,c44,cin,co);

endmodule
