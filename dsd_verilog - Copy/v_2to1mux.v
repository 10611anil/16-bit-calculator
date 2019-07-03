module mux (output reg c,input a,b,sel);
  always@(sel,a,b)
  begin
  if(sel)
  c = b;
else
c=a;
end
endmodule  
