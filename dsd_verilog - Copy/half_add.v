module half_add (output reg sum, carry, input a,b);
 always@(a,b)
begin
 sum = a^b;
 carry = a&b;
end
endmodule
