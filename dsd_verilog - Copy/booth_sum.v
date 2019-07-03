
module booth_sum (a,b,c,d,out);
input wire [8:0] a,b,c,d;
output wire [15:0] out;
wire [30:0] d_car;
wire [17:0] d_sum;
wire car;
assign out[0]=a[0];
assign out[1]=a[1];
half_add h1(out[2],d_car[0],a[2],b[0]); 

full_adder f1(out[3],d_car[1],a[3],b[1],d_car[0]);

full_adder f2(d_sum[0],d_car[2],a[4],b[2],c[0]);
half_add h2(out[4],d_car[3],d_sum[0],d_car[1]); 

full_adder f3(d_sum[1],d_car[4],a[5],b[3],c[1]);
full_adder f4(out[5],d_car[5],d_sum[1],d_car[3],d_car[2]);

full_adder f5(d_sum[2],d_car[6],a[6],b[4],c[2]);
full_adder f6(d_sum[3],d_car[7],d_sum[2],d[0],d_car[4]);
half_add h3(out[6],d_car[8],d_sum[3],d_car[5]); 

full_adder f7(d_sum[4],d_car[9],a[7],b[5],c[3]);
full_adder f8(d_sum[5],d_car[10],d_sum[4],d[1],d_car[6]);
full_adder f9(out[7],d_car[11],d_sum[5],d_car[8],d_car[7]);

full_adder f10(d_sum[6],d_car[12],a[8],b[6],c[4]);
full_adder f11(d_sum[7],d_car[13],d_sum[6],d[2],d_car[9]);
full_adder f12(out[8],d_car[14],d_sum[7],d_car[11],d_car[10]);

full_adder f13(d_sum[8],d_car[15],a[8],b[7],c[5]);
full_adder f14(d_sum[9],d_car[16],d_sum[8],d[3],d_car[12]);
full_adder f15(out[9],d_car[17],d_sum[9],d_car[14],d_car[13]);

full_adder f16(d_sum[10],d_car[18],a[8],b[8],c[6]);
full_adder f17(d_sum[11],d_car[19],d_sum[10],d[4],d_car[15]);
full_adder f18(out[10],d_car[20],d_sum[11],d_car[17],d_car[16]);

full_adder f19(d_sum[12],d_car[21],~a[8],~b[8],c[7]);
full_adder f20(d_sum[13],d_car[22],d_sum[12],d[5],d_car[18]);
full_adder f21(out[11],d_car[23],d_sum[13],d_car[20],d_car[19]);

full_adder f22(d_sum[14],d_car[24],1'b1,c[8],d[6]);
full_adder f23(d_sum[15],d_car[25],d_sum[14],d_car[21],d_car[22]);
half_add h4(out[12],d_car[26],d_sum[15],d_car[23]); 

full_adder f24(d_sum[16],d_car[27],~c[8],d[7],d_car[24]);
full_adder f25(out[13],d_car[28],d_sum[16],d_car[26],d_car[25]);

full_adder f26(d_sum[17],d_car[29],1'b1,d[8],d_car[27]);
half_add h5(out[14],d_car[30],d_sum[17],d_car[28]); 

full_adder f27(out[15],car,~d[8],d_car[30],d_car[29]); 
endmodule

