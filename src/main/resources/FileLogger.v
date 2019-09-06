
module FileLogger #(
  parameter FILE_NAME = "",
  parameter IN0_WIDTH = 1,
  parameter IN1_WIDTH = 1
) (
  input clock,                          // Clock
  input trigger,
  input [IN0_WIDTH-1:0] in0,
  input [IN1_WIDTH-1:0] in1
);
  integer file_id, r;
  initial begin
    file_id = $fopen(FILE_NAME, "w");
    if (!file_id) begin
      $display("Could not open %s", FILE_NAME);
      $finish;
    end
  end

  always @ (posedge clock) begin
    if (trigger) begin
      $fdisplay(file_id, "0x%h 0x%h %t", in0, in1, $time);
      // $fflush(file_id);
    end
  end
endmodule
