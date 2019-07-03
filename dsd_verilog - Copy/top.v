// Author : Anil Kumar	
// Date : 07/01/2019
// Design : Design of A^2-1 calculator
// In the top level module all the sub modules are instantiated.
// This design works based on "Booth Algorithm" and calculate signed A^2-1 value 
// The complete description of the project is explained in project report.


module top (output reg [15:0] sum, output reg carry, input [7:0] A,input [15:0] B, input in_car, input clk,reset);
wire [15:0] d_sum;
wire d_car;
wire [8:0] ip1,ip2,ip3,ip4;
wire [15:0] in1;
boothinput B1(ip1,ip2,ip3,ip4, A);
booth_sum BS1(ip1,ip2,ip3,ip4,in1);
carselec C1(d_sum,d_car,in1,B,in_car);

always @(posedge clk)
begin
if(reset)
begin
sum = 0;
carry = 0;
end
else
begin
sum = d_sum;
carry = d_car;
end

end
endmodule

