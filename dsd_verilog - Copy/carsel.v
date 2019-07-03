module carselec (sum,carry,a,b,c_in);
  output [15:0] sum;
output carry;
input wire [15:0] a,b;
input wire c_in;
parameter one = 1'b1;
parameter zero = 1'b0;
wire [2:0] d_car;
wire [2:0] d_car0;
wire [2:0] d_car1;
wire [11:0] d_sum0;
wire [11:0] d_sum1;
/*wire [15:0] sum;
wire carry;*/


fourbit_ripple f1(sum[3:0],d_car[0],a[3:0],b[3:0],c_in);

fourbit_ripple f2(d_sum0[3:0],d_car0[0],a[7:4],b[7:4],zero);
fourbit_ripple f3(d_sum1[3:0],d_car1[0],a[7:4],b[7:4],one);

muxfour m41(sum[7:4],d_sum0[3:0],d_sum1[3:0],d_car[0]);
mux m21(d_car[1],d_car0[0],d_car1[0],d_car[0]);

fourbit_ripple f4(d_sum0[7:4],d_car0[1],a[11:8],b[11:8],zero);
fourbit_ripple f5(d_sum1[7:4],d_car1[1],a[11:8],b[11:8],one);

muxfour m42(sum[11:8],d_sum0[7:4],d_sum1[7:4],d_car[1]);
mux m22(d_car[2],d_car0[1],d_car1[1],d_car[1]);

fourbit_ripple f6(d_sum0[11:8],d_car0[2],a[15:12],b[15:12],zero);
fourbit_ripple f7(d_sum1[11:8],d_car1[2],a[15:12],b[15:12],one);

muxfour m43(sum[15:12],d_sum0[11:8],d_sum1[11:8],d_car[2]);
mux m23(carry,d_car0[2],d_car1[2],d_car[2]);


/*always@(posedge clk)
begin
  o_sum <= sum;
  o_carry <= carry;
end
*/
endmodule
