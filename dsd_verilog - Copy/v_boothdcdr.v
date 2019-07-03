module boothdcdr (output reg signed[8:0] updated_a, input wire[7:0] a, input wire [2:0]selc);
  localparam zero = 1'b0;

  always@(selc,a)
  begin
    case (selc)
      0: updated_a = 0;
      1: updated_a = {a[7],a};
      2: updated_a = {a[7],a};
      3: updated_a = ({a,zero});
      4: updated_a = (-{a,zero});
      5: updated_a = (-{a[7],a});
      6: updated_a = (-{a[7],a});
      7: updated_a = 0; 
      default: $display ("unknown inputformat");
    endcase
  end
  endmodule
