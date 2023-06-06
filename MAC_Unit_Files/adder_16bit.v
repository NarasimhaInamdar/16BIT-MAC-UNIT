module adder_16bit(input [15:0] a,b,
                   input cin,
                   output [15:0] sum,
                   output co);
wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11a,s12,s13,s14,s15,s16;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11a,c12,c13,c14,c15,c16;
wire s11,s22,s33,s44,s55,s66,s77,s88,s99,s1010,s1111,s1212,s1313,s14s14,s1515,s1616;
wire c11,c22,c33,c44,c55,c66,c77,c88,c99,c1010,c1111,c1212,c1313,c1414,c1515,c1616;

//assuming carry in 0
full_adder f10(a[0],b[0],1'b0,s1,c1);
full_adder f20(a[1],b[1],c1,s2,c2);
full_adder f30(a[2],b[2],c2,s3,c3);
full_adder f40(a[3],b[3],c3,s4,c4);
full_adder f50(a[4],b[4],c4,s5,c5);
full_adder f60(a[5],b[5],c5,s6,c6);
full_adder f70(a[6],b[6],c6,s7,c7);
full_adder f80(a[7],b[7],c7,s8,c8);
full_adder f90(a[8],b[8],c8,s9,c9);
full_adder f100(a[9],b[9],c9,s10,c10);
full_adder f110(a[10],b[10],c10,s11a,c11a);
full_adder f120(a[11],b[11],c11a,s12,c12);
full_adder f130(a[12],b[12],c12,s13,c13);
full_adder f140(a[13],b[13],c13,s14,c14);
full_adder f150(a[14],b[14],c14,s15,c15);
full_adder f160(a[15],b[15],c15,s16,c16);

//assuming carry in 1
full_adder f11(a[0],b[0],1'b1,s11,c11);
full_adder f22(a[1],b[1],c11,s22,c22);
full_adder f33(a[2],b[2],c22,s33,c33);
full_adder f44(a[3],b[3],c33,s44,c44);
full_adder f55(a[4],b[4],c44,s55,c55);
full_adder f66(a[5],b[5],c55,s66,c66);
full_adder f77(a[6],b[6],c66,s77,c77);
full_adder f88(a[7],b[7],c77,s88,c88);
full_adder f99(a[8],b[8],c88,s99,c99);
full_adder f1010(a[9],b[9],c99,s1010,c1010);
full_adder f1111(a[10],b[10],c1010,s1111,c1111);
full_adder f1212(a[11],b[11],c1111,s1212,c1212);
full_adder f1313(a[12],b[12],c1212,s1313,c1313);
full_adder f1414(a[13],b[13],c1313,s1414,c1414);
full_adder f1515(a[14],b[14],c1414,s1515,c1515);
full_adder f1616(a[15],b[15],c1515,s1616,c1616);


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
mux2_1 m9(s9,s99,cin,sum[8]);
mux2_1 m10(s10,s1010,cin,sum[9]);
mux2_1 m11(s11a,s1111,cin,sum[10]);
mux2_1 m12(s12,s1212,cin,sum[11]);
mux2_1 m13(s13,s1313,cin,sum[12]);
mux2_1 m14(s14,s1414,cin,sum[13]);
mux2_1 m15(s15,s1515,cin,sum[14]);
mux2_1 m16(s16,s1616,cin,sum[15]);

//mux for carry select
mux2_1 m17(c16,c1616,cin,co);

endmodule
