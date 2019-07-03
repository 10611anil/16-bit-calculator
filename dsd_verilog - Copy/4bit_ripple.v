module fourbit_ripple(sum,carry,a,b,c_in);
  input wire [3:0] a,b;
  input wire c_in;
  output wire [3:0] sum;
  output wire carry;
  wire [2:0] d_car;
  
  full_adder f0 (sum[0],d_car[0],a[0],b[0],c_in);
  full_adder f1 (sum[1],d_car[1],a[1],b[1],d_car[0]);
  full_adder f2 (sum[2],d_car[2],a[2],b[2],d_car[1]);
  full_adder f3 (sum[3],carry,a[3],b[3],d_car[2]);
  
endmodule