module muxfour (output reg [3:0] c,input [3:0]a,b, input sel);
  always@(sel,a,b)
  begin
  if(sel)
  c = b;
else
c=a;
end
endmodule 
