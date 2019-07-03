module full_adder (output reg  sum,output reg carry, input a,b,c_in);
  always@(a,b,c_in)
  begin 
    sum <= a^b^c_in;
    carry <= ((a&b)| ((a^b)&c_in));
  end
endmodule 