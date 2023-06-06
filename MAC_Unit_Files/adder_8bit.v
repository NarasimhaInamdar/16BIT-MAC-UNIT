module adder_8bit(input [7:0] a,b,
                   input cin,
                   output [7:0] sum,
                   output co);
wire s1,s2,s3,s4,s5,s6,s7,s8,c1,c2,c3,c4,c5,c6,c7,c8;
wire s11,s22,s33,s44,s55,s66,s77,s88,c11,c22,c33,c44,c55,c66,c77,c88;

//assuming carry in 0
full_adder f10(a[0],b[0],1'b0,s1,c1);
full_adder f20(a[1],b[1],c1,s2,c2);
full_adder f30(a[2],b[2],c2,s3,c3);
full_adder f40(a[3],b[3],c3,s4,c4);
full_adder f50(a[4],b[4],c4,s5,c5);
full_adder f60(a[5],b[5],c5,s6,c6);
full_adder f70(a[6],b[6],c6,s7,c7);
full_adder f80(a[7],b[7],c7,s8,c8);

//assuming carry in 1
full_adder f11(a[0],b[0],1'b1,s11,c11);
full_adder f22(a[1],b[1],c11,s22,c22);
full_adder f33(a[2],b[2],c22,s33,c33);
full_adder f44(a[3],b[3],c33,s44,c44);
full_adder f55(a[4],b[4],c44,s55,c55);
full_adder f66(a[5],b[5],c55,s66,c66);
full_adder f77(a[6],b[6],c66,s77,c77);
full_adder f88(a[7],b[7],c77,s88,c88);


/*select either carry 1 or 0 using carry out of FA
mux for sum select*/
mux2_1 m1(s1,s11,cin,sum[0]);
mux2_1 m2(s2,s22,cin,sum[1]);
mux2_1 m3(s3,s33,cin,sum[2]);
mux2_1 m4(s4,s44,cin,sum[3]);
mux2_1 m5(s5,s55,cin,sum[4]);
mux2_1 m6(s6,s66,cin,sum[5]);
mux2_1 m7(s7,s77,cin,sum[6]);
mux2_1 m8(s8,s88,cin,sum[7]);

//mux for carry select
mux2_1 m9(c8,c88,cin,co);

endmodule
