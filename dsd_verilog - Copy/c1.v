
module carry_select (sum,carry,a,b,c_in);

output wire [15:0] sum;
output wire carry;
input wire [15:0] a,b;
input wire c_in;
wire [23:0] d_sum;
wire [29:0] d_car;
parameter one = 1'b1;
parameter zero = 1'b0;
full_adder f0 (sum[0],d_car[0],a[0],b[0],c_in);
full_adder f1 (sum[1],d_car[1],a[1],b[1],d_car[0]);
full_adder f2 (sum[2],d_car[2],a[2],b[2],d_car[1]);
full_adder f3 (sum[3],d_car[3],a[3],b[3],d_car[2]);
// 2nd four bits with carry 0 
full_adder f200 (d_sum[0],d_car[4],a[4],b[4],zero);
full_adder f201 (d_sum[1],d_car[5],a[5],b[5],d_car[4]);
full_adder f202 (d_sum[2],d_car[6],a[6],b[6],d_car[5]);
full_adder f203 (d_sum[3],d_car[7],a[7],b[7],d_car[6]);
// with carry 1
full_adder f210 (d_sum[4],d_car[8],a[4],b[4],one);
full_adder f211 (d_sum[5],d_car[9],a[5],b[5],d_car[8]);
full_adder f212 (d_sum[6],d_car[10],a[6],b[6],d_car[9]);
full_adder f213 (d_sum[7],d_car[11],a[7],b[7],d_car[10]);

// mux selection for succeding carry
mux m0 (.c(d_car[12]),.a(d_car[7]),.b(d_car[11]),.sel(d_car[3]));
mux m1 (.c(sum[4]),.a(d_sum[0]),.b(d_sum[4]),.sel(d_car[3]));
mux m2 (.c(sum[5]),.a(d_sum[1]),.b(d_sum[5]),.sel(d_car[3]));
mux m3 (.c(sum[6]),.a(d_sum[2]),.b(d_sum[6]),.sel(d_car[3]));
mux m4 (.c(sum[7]),.a(d_sum[3]),.b(d_sum[7]),.sel(d_car[3]));

// 3rd four bits with carry 0
full_adder f300 (d_sum[8],d_car[13],a[8],b[8],zero);
full_adder f301 (d_sum[9],d_car[14],a[9],b[9],d_car[13]);
full_adder f302 (d_sum[10],d_car[15],a[10],b[10],d_car[14]);
full_adder f303 (d_sum[11],d_car[16],a[11],b[11],d_car[15]);
// with carry 1
full_adder f310 (d_sum[12],d_car[17],a[8],b[8],one);
full_adder f311 (d_sum[13],d_car[18],a[9],b[9],d_car[17]);
full_adder f312 (d_sum[14],d_car[19],a[10],b[10],d_car[18]);
full_adder f313 (d_sum[15],d_car[20],a[11],b[11],d_car[19]);

// mux selection for succeding carry
mux m10 (.c(d_car[21]),.a(d_car[16]),.b(d_car[20]),.sel(d_car[12]));
mux m11 (.c(sum[8]),.a(d_sum[8]),.b(d_sum[12]),.sel(d_car[12]));
mux m12 (.c(sum[9]),.a(d_sum[9]),.b(d_sum[13]),.sel(d_car[12]));
mux m13 (.c(sum[10]),.a(d_sum[10]),.b(d_sum[14]),.sel(d_car[12]));
mux m14 (.c(sum[11]),.a(d_sum[11]),.b(d_sum[15]),.sel(d_car[12]));

//4th four bits with carry 0
full_adder f400 (d_sum[16],d_car[22],a[12],b[12],zero);
full_adder f401 (d_sum[17],d_car[23],a[13],b[13],d_car[22]);
full_adder f402 (d_sum[18],d_car[24],a[14],b[14],d_car[23]);
full_adder f403 (d_sum[19],d_car[25],a[15],b[15],d_car[24]);
//4th four bits with carry 1
full_adder f410 (d_sum[20],d_car[26],a[12],b[12],one);
full_adder f411 (d_sum[21],d_car[27],a[13],b[13],d_car[26]);
full_adder f412 (d_sum[22],d_car[28],a[14],b[14],d_car[27]);
full_adder f413 (d_sum[23],d_car[29],a[15],b[15],d_car[28]);
// mux selection for succeding carry
mux m20 (.c(carry),.a(d_car[25]),.b(d_car[29]),.sel(d_car[21]));
mux m21 (.c(sum[12]),.a(d_sum[16]),.b(d_sum[20]),.sel(d_car[21]));
mux m22 (.c(sum[13]),.a(d_sum[17]),.b(d_sum[21]),.sel(d_car[21]));
mux m23 (.c(sum[14]),.a(d_sum[18]),.b(d_sum[22]),.sel(d_car[21]));
mux m24 (.c(sum[15]),.a(d_sum[19]),.b(d_sum[23]),.sel(d_car[21]));

endmodule
