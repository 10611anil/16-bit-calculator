
module boothinput (ip1,ip2,ip3,ip4, a);
  output wire [8:0] ip1,ip2,ip3,ip4;
  input wire [7:0] a;
  boothdcdr dc1 (ip1,a,{a[1:0],1'b0});
  boothdcdr dc2 (ip2,a,a[3:1]);
  boothdcdr dc3 (ip3,a,a[5:3]);
  boothdcdr dc4 (ip4,a,a[7:5]);
endmodule