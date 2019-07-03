module carry_select (sum,carry,a,b,c_in);

output wire [15:0] sum;
output wire carry;
input wire [15:0] a,b;
input wire c_in;
parameter one = 1'b1;
parameter zero = 1'b0;

wire [3:0] d_car;
wire [23:0] A1,B1;
wire cout1,cout2;

full_adder f0 (sum[0],d_car[0],a[0],b[0],c_in);
full_adder f1 (sum[1],d_car[1],a[1],b[1],d_car[0]);
full_adder f2 (sum[2],d_car[2],a[2],b[2],d_car[1]);
full_adder f3 (sum[3],d_car[3],a[3],b[3],d_car[2]);
// 2nd four bits with carry 0 
full_adder f200 (A1[0],B1[0],a[4],b[4],zero);
full_adder f201 (A1[1],B1[1],a[5],b[5],B1[0]);
full_adder f202 (A1[2],B1[2],a[6],b[6],B1[1]);
full_adder f203 (A1[3],B1[3],a[7],b[7],B1[2]);
// with carry 1
full_adder f210 (A1[4],B1[4],a[4],b[4],one);
full_adder f211 (A1[5],B1[5],a[5],b[5],B1[4]);
full_adder f212 (A1[6],B1[6],a[6],b[6],B1[5]);
full_adder f213 (A1[7],B1[7],a[7],b[7],B1[6]);

// mux selection for succeding carry
mux m0 (cout1,B1[3],B1[7],d_car[3]);
mux m1 (sum[4],A1[0],A1[4],d_car[3]);
mux m2 (sum[5],A1[1],A1[5],d_car[3]);
mux m3 (sum[6],A1[2],A1[6],d_car[3]);
mux m4 (sum[7],A1[3],A1[7],d_car[3]);

// 3rd four bits with carry 0
full_adder f300 (A1[8],B1[8],a[8],b[8],zero);
full_adder f301 (A1[9],B1[9],a[9],b[9],B1[8]);
full_adder f302 (A1[10],B1[10],a[10],b[10],B1[9]);
full_adder f303 (A1[11],B1[11],a[11],b[11],B1[10]);
// with carry 1
full_adder f310 (A1[12],B1[12],a[8],b[8],one);
full_adder f311 (A1[13],B1[13],a[9],b[9],B1[12]);
full_adder f312 (A1[14],B1[14],a[10],b[10],B1[13]);
full_adder f313 (A1[15],B1[15],a[11],b[11],B1[14]);

// mux selection for succeding carry
mux m10 (cout2,B1[11],B1[15],cout1);
mux m11 (sum[8],A1[8],A1[12],cout1);
mux m12 (sum[9],A1[9],A1[13],cout1);
mux m13 (sum[10],A1[10],A1[14],cout1);
mux m14 (sum[11],A1[11],A1[15],cout1);

//4th four bits with carry 0
full_adder f400 (A1[16],B1[16],a[12],b[12],zero);
full_adder f401 (A1[17],B1[17],a[13],b[13],B1[16]);
full_adder f402 (A1[18],B1[18],a[14],b[14],B1[17]);
full_adder f403 (A1[19],B1[19],a[15],b[15],B1[18]);
//4th four bits with carry 1
full_adder f410 (A1[20],B1[20],a[12],b[12],one);
full_adder f411 (A1[21],B1[21],a[13],b[13],B1[20]);
full_adder f412 (A1[22],B1[22],a[14],b[14],B1[21]);
full_adder f413 (A1[23],B1[23],a[15],b[15],B1[22]);
// mux selection for succeding carry
mux m20 (carry,B1[19],B1[23],cout2);
mux m21 (sum[12],A1[16],A1[20],cout2);
mux m22 (sum[13],A1[17],A1[21],cout2);
mux m23 (sum[14],A1[18],A1[22],cout2);
mux m24 (sum[15],A1[19],A1[23],cout2);
endmodule



