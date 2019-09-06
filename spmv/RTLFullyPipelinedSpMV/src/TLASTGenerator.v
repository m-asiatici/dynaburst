module ElasticBufferRegExportTLASTGenerator( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output        io_in_ready, // @[:@6.4]
  input         io_in_valid, // @[:@6.4]
  input  [31:0] io_in_bits, // @[:@6.4]
  input         io_out_ready, // @[:@6.4]
  output        io_out_valid, // @[:@6.4]
  output [31:0] io_out_bits // @[:@6.4]
);
  reg [31:0] outerRegData; // @[TLASTGenerator.scala 40:27:@8.4]
  reg [31:0] _RAND_0;
  reg  outerRegValid; // @[TLASTGenerator.scala 41:32:@9.4]
  reg [31:0] _RAND_1;
  reg [31:0] innerRegData; // @[TLASTGenerator.scala 42:27:@10.4]
  reg [31:0] _RAND_2;
  reg  innerRegValid; // @[TLASTGenerator.scala 43:32:@11.4]
  reg [31:0] _RAND_3;
  reg  readyReg; // @[TLASTGenerator.scala 44:23:@12.4]
  reg [31:0] _RAND_4;
  wire  _T_40; // @[TLASTGenerator.scala 51:59:@18.6]
  wire  _T_41; // @[TLASTGenerator.scala 51:57:@19.6]
  wire  _T_42; // @[TLASTGenerator.scala 51:42:@20.6]
  wire  _T_43; // @[TLASTGenerator.scala 51:40:@21.6]
  wire  _GEN_2; // @[TLASTGenerator.scala 47:5:@14.4]
  wire  _GEN_3; // @[TLASTGenerator.scala 47:5:@14.4]
  assign _T_40 = ~ io_out_valid; // @[TLASTGenerator.scala 51:59:@18.6]
  assign _T_41 = io_out_ready | _T_40; // @[TLASTGenerator.scala 51:57:@19.6]
  assign _T_42 = ~ _T_41; // @[TLASTGenerator.scala 51:42:@20.6]
  assign _T_43 = outerRegValid & _T_42; // @[TLASTGenerator.scala 51:40:@21.6]
  assign _GEN_2 = readyReg ? io_in_valid : outerRegValid; // @[TLASTGenerator.scala 47:5:@14.4]
  assign _GEN_3 = readyReg ? _T_43 : innerRegValid; // @[TLASTGenerator.scala 47:5:@14.4]
  assign io_in_ready = readyReg; // @[TLASTGenerator.scala 56:17:@33.4]
  assign io_out_valid = readyReg ? outerRegValid : innerRegValid; // @[TLASTGenerator.scala 54:18:@29.4]
  assign io_out_bits = readyReg ? outerRegData : innerRegData; // @[TLASTGenerator.scala 53:17:@26.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  outerRegData = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  outerRegValid = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  innerRegData = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  innerRegValid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  readyReg = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (readyReg) begin
      outerRegData <= io_in_bits;
    end
    if (reset) begin
      outerRegValid <= 1'h0;
    end else begin
      if (readyReg) begin
        outerRegValid <= io_in_valid;
      end
    end
    if (readyReg) begin
      innerRegData <= outerRegData;
    end
    if (reset) begin
      innerRegValid <= 1'h0;
    end else begin
      if (readyReg) begin
        innerRegValid <= _T_43;
      end
    end
    readyReg <= io_out_ready | _T_40;
  end
endmodule
module ElasticBufferTLASTGenerator( // @[:@40.2]
  input         clock, // @[:@41.4]
  input         reset, // @[:@42.4]
  output        io_in_ready, // @[:@43.4]
  input         io_in_valid, // @[:@43.4]
  input  [31:0] io_in_bits, // @[:@43.4]
  input         io_out_ready, // @[:@43.4]
  output        io_out_valid, // @[:@43.4]
  output [31:0] io_out_bits // @[:@43.4]
);
  wire  fullBuffer_clock; // @[TLASTGenerator.scala 27:28:@45.4]
  wire  fullBuffer_reset; // @[TLASTGenerator.scala 27:28:@45.4]
  wire  fullBuffer_io_in_ready; // @[TLASTGenerator.scala 27:28:@45.4]
  wire  fullBuffer_io_in_valid; // @[TLASTGenerator.scala 27:28:@45.4]
  wire [31:0] fullBuffer_io_in_bits; // @[TLASTGenerator.scala 27:28:@45.4]
  wire  fullBuffer_io_out_ready; // @[TLASTGenerator.scala 27:28:@45.4]
  wire  fullBuffer_io_out_valid; // @[TLASTGenerator.scala 27:28:@45.4]
  wire [31:0] fullBuffer_io_out_bits; // @[TLASTGenerator.scala 27:28:@45.4]
  ElasticBufferRegExportTLASTGenerator fullBuffer ( // @[TLASTGenerator.scala 27:28:@45.4]
    .clock(fullBuffer_clock),
    .reset(fullBuffer_reset),
    .io_in_ready(fullBuffer_io_in_ready),
    .io_in_valid(fullBuffer_io_in_valid),
    .io_in_bits(fullBuffer_io_in_bits),
    .io_out_ready(fullBuffer_io_out_ready),
    .io_out_valid(fullBuffer_io_out_valid),
    .io_out_bits(fullBuffer_io_out_bits)
  );
  assign io_in_ready = fullBuffer_io_in_ready; // @[TLASTGenerator.scala 28:22:@50.4]
  assign io_out_valid = fullBuffer_io_out_valid; // @[TLASTGenerator.scala 29:12:@52.4]
  assign io_out_bits = fullBuffer_io_out_bits; // @[TLASTGenerator.scala 29:12:@51.4]
  assign fullBuffer_clock = clock; // @[:@46.4]
  assign fullBuffer_reset = reset; // @[:@47.4]
  assign fullBuffer_io_in_valid = io_in_valid; // @[TLASTGenerator.scala 28:22:@49.4]
  assign fullBuffer_io_in_bits = io_in_bits; // @[TLASTGenerator.scala 28:22:@48.4]
  assign fullBuffer_io_out_ready = io_out_ready; // @[TLASTGenerator.scala 29:12:@53.4]
endmodule
module TLASTGenerator( // @[:@55.2]
  input         clock, // @[:@56.4]
  input         reset, // @[:@57.4]
  output        io_mult_res_ready, // @[:@58.4]
  input         io_mult_res_valid, // @[:@58.4]
  input  [31:0] io_mult_res_bits, // @[:@58.4]
  output        io_row_len_ready, // @[:@58.4]
  input         io_row_len_valid, // @[:@58.4]
  input  [31:0] io_row_len_bits, // @[:@58.4]
  input         io_out_ready, // @[:@58.4]
  output        io_out_valid, // @[:@58.4]
  output [31:0] io_out_bits_data, // @[:@58.4]
  output        io_out_bits_last // @[:@58.4]
);
  wire  ElasticBufferTLASTGenerator_clock; // @[TLASTGenerator.scala 14:23:@60.4]
  wire  ElasticBufferTLASTGenerator_reset; // @[TLASTGenerator.scala 14:23:@60.4]
  wire  ElasticBufferTLASTGenerator_io_in_ready; // @[TLASTGenerator.scala 14:23:@60.4]
  wire  ElasticBufferTLASTGenerator_io_in_valid; // @[TLASTGenerator.scala 14:23:@60.4]
  wire [31:0] ElasticBufferTLASTGenerator_io_in_bits; // @[TLASTGenerator.scala 14:23:@60.4]
  wire  ElasticBufferTLASTGenerator_io_out_ready; // @[TLASTGenerator.scala 14:23:@60.4]
  wire  ElasticBufferTLASTGenerator_io_out_valid; // @[TLASTGenerator.scala 14:23:@60.4]
  wire [31:0] ElasticBufferTLASTGenerator_io_out_bits; // @[TLASTGenerator.scala 14:23:@60.4]
  reg  state; // @[TLASTGenerator.scala 75:24:@66.4]
  reg [31:0] _RAND_0;
  reg [31:0] count; // @[TLASTGenerator.scala 77:20:@67.4]
  reg [31:0] _RAND_1;
  wire  _T_38; // @[Conditional.scala 37:30:@68.4]
  wire  _T_40; // @[TLASTGenerator.scala 80:52:@70.6]
  wire  _T_41; // @[TLASTGenerator.scala 80:35:@71.6]
  wire  _T_42; // @[TLASTGenerator.scala 80:61:@72.6]
  wire  _T_43; // @[TLASTGenerator.scala 80:82:@73.6]
  wire  _T_45; // @[TLASTGenerator.scala 80:115:@74.6]
  wire  _T_46; // @[TLASTGenerator.scala 80:98:@75.6]
  wire  _GEN_0; // @[TLASTGenerator.scala 80:125:@76.6]
  wire  _T_48; // @[TLASTGenerator.scala 85:31:@83.8]
  wire [32:0] _T_50; // @[TLASTGenerator.scala 85:79:@84.8]
  wire [32:0] _T_51; // @[TLASTGenerator.scala 85:79:@85.8]
  wire [31:0] _T_52; // @[TLASTGenerator.scala 85:79:@86.8]
  wire  _T_53; // @[TLASTGenerator.scala 85:62:@87.8]
  wire  _T_54; // @[TLASTGenerator.scala 85:52:@88.8]
  wire  _GEN_1; // @[TLASTGenerator.scala 85:87:@89.8]
  wire  _GEN_2; // @[Conditional.scala 39:67:@82.6]
  wire  _GEN_3; // @[Conditional.scala 40:58:@69.4]
  wire  _T_62; // @[TLASTGenerator.scala 101:35:@102.8]
  wire  _T_68; // @[TLASTGenerator.scala 109:54:@113.12]
  wire [32:0] _T_74; // @[TLASTGenerator.scala 115:42:@122.16]
  wire [31:0] _T_75; // @[TLASTGenerator.scala 115:42:@123.16]
  wire [31:0] _GEN_5; // @[TLASTGenerator.scala 112:52:@118.14]
  wire  _GEN_7; // @[TLASTGenerator.scala 110:40:@115.12]
  wire [31:0] _GEN_8; // @[TLASTGenerator.scala 110:40:@115.12]
  wire  _GEN_11; // @[TLASTGenerator.scala 106:48:@110.10]
  wire  _GEN_12; // @[TLASTGenerator.scala 106:48:@110.10]
  wire  _GEN_13; // @[TLASTGenerator.scala 106:48:@110.10]
  wire [31:0] _GEN_14; // @[TLASTGenerator.scala 106:48:@110.10]
  wire [31:0] _GEN_15; // @[TLASTGenerator.scala 101:44:@103.8]
  wire  _GEN_16; // @[TLASTGenerator.scala 101:44:@103.8]
  wire  _GEN_17; // @[TLASTGenerator.scala 101:44:@103.8]
  wire  _GEN_18; // @[TLASTGenerator.scala 101:44:@103.8]
  wire  _GEN_19; // @[TLASTGenerator.scala 101:44:@103.8]
  wire [31:0] _GEN_20; // @[TLASTGenerator.scala 101:44:@103.8]
  wire [31:0] _GEN_21; // @[TLASTGenerator.scala 100:33:@101.6]
  wire  _GEN_22; // @[TLASTGenerator.scala 100:33:@101.6]
  wire  _GEN_23; // @[TLASTGenerator.scala 100:33:@101.6]
  wire  _GEN_24; // @[TLASTGenerator.scala 100:33:@101.6]
  wire  _GEN_25; // @[TLASTGenerator.scala 100:33:@101.6]
  wire [31:0] _GEN_26; // @[TLASTGenerator.scala 100:33:@101.6]
  wire [31:0] _GEN_28; // @[TLASTGenerator.scala 127:52:@145.10]
  wire [31:0] _GEN_31; // @[TLASTGenerator.scala 122:53:@134.8]
  wire  _GEN_32; // @[TLASTGenerator.scala 122:53:@134.8]
  wire  _GEN_34; // @[Conditional.scala 39:67:@132.6]
  wire [31:0] _GEN_35; // @[Conditional.scala 39:67:@132.6]
  wire  _GEN_36; // @[Conditional.scala 39:67:@132.6]
  ElasticBufferTLASTGenerator ElasticBufferTLASTGenerator ( // @[TLASTGenerator.scala 14:23:@60.4]
    .clock(ElasticBufferTLASTGenerator_clock),
    .reset(ElasticBufferTLASTGenerator_reset),
    .io_in_ready(ElasticBufferTLASTGenerator_io_in_ready),
    .io_in_valid(ElasticBufferTLASTGenerator_io_in_valid),
    .io_in_bits(ElasticBufferTLASTGenerator_io_in_bits),
    .io_out_ready(ElasticBufferTLASTGenerator_io_out_ready),
    .io_out_valid(ElasticBufferTLASTGenerator_io_out_valid),
    .io_out_bits(ElasticBufferTLASTGenerator_io_out_bits)
  );
  assign _T_38 = 1'h0 == state; // @[Conditional.scala 37:30:@68.4]
  assign _T_40 = ElasticBufferTLASTGenerator_io_out_bits != 32'h0; // @[TLASTGenerator.scala 80:52:@70.6]
  assign _T_41 = io_row_len_valid & _T_40; // @[TLASTGenerator.scala 80:35:@71.6]
  assign _T_42 = _T_41 & io_mult_res_valid; // @[TLASTGenerator.scala 80:61:@72.6]
  assign _T_43 = _T_42 & io_out_ready; // @[TLASTGenerator.scala 80:82:@73.6]
  assign _T_45 = ElasticBufferTLASTGenerator_io_out_bits != 32'h1; // @[TLASTGenerator.scala 80:115:@74.6]
  assign _T_46 = _T_43 & _T_45; // @[TLASTGenerator.scala 80:98:@75.6]
  assign _GEN_0 = _T_46 ? 1'h1 : state; // @[TLASTGenerator.scala 80:125:@76.6]
  assign _T_48 = io_out_ready & io_mult_res_valid; // @[TLASTGenerator.scala 85:31:@83.8]
  assign _T_50 = ElasticBufferTLASTGenerator_io_out_bits - 32'h1; // @[TLASTGenerator.scala 85:79:@84.8]
  assign _T_51 = $unsigned(_T_50); // @[TLASTGenerator.scala 85:79:@85.8]
  assign _T_52 = _T_51[31:0]; // @[TLASTGenerator.scala 85:79:@86.8]
  assign _T_53 = count == _T_52; // @[TLASTGenerator.scala 85:62:@87.8]
  assign _T_54 = _T_48 & _T_53; // @[TLASTGenerator.scala 85:52:@88.8]
  assign _GEN_1 = _T_54 ? 1'h0 : state; // @[TLASTGenerator.scala 85:87:@89.8]
  assign _GEN_2 = state ? _GEN_1 : state; // @[Conditional.scala 39:67:@82.6]
  assign _GEN_3 = _T_38 ? _GEN_0 : _GEN_2; // @[Conditional.scala 40:58:@69.4]
  assign _T_62 = ElasticBufferTLASTGenerator_io_out_bits == 32'h0; // @[TLASTGenerator.scala 101:35:@102.8]
  assign _T_68 = ElasticBufferTLASTGenerator_io_out_bits == 32'h1; // @[TLASTGenerator.scala 109:54:@113.12]
  assign _T_74 = count + 32'h1; // @[TLASTGenerator.scala 115:42:@122.16]
  assign _T_75 = count + 32'h1; // @[TLASTGenerator.scala 115:42:@123.16]
  assign _GEN_5 = _T_68 ? 32'h0 : _T_75; // @[TLASTGenerator.scala 112:52:@118.14]
  assign _GEN_7 = io_out_ready ? _T_68 : 1'h0; // @[TLASTGenerator.scala 110:40:@115.12]
  assign _GEN_8 = io_out_ready ? _GEN_5 : 32'h0; // @[TLASTGenerator.scala 110:40:@115.12]
  assign _GEN_11 = io_mult_res_valid ? _T_68 : 1'h0; // @[TLASTGenerator.scala 106:48:@110.10]
  assign _GEN_12 = io_mult_res_valid ? io_out_ready : 1'h0; // @[TLASTGenerator.scala 106:48:@110.10]
  assign _GEN_13 = io_mult_res_valid ? _GEN_7 : 1'h0; // @[TLASTGenerator.scala 106:48:@110.10]
  assign _GEN_14 = io_mult_res_valid ? _GEN_8 : 32'h0; // @[TLASTGenerator.scala 106:48:@110.10]
  assign _GEN_15 = _T_62 ? 32'h0 : io_mult_res_bits; // @[TLASTGenerator.scala 101:44:@103.8]
  assign _GEN_16 = _T_62 ? 1'h1 : _GEN_11; // @[TLASTGenerator.scala 101:44:@103.8]
  assign _GEN_17 = _T_62 ? 1'h1 : io_mult_res_valid; // @[TLASTGenerator.scala 101:44:@103.8]
  assign _GEN_18 = _T_62 ? io_out_ready : _GEN_13; // @[TLASTGenerator.scala 101:44:@103.8]
  assign _GEN_19 = _T_62 ? 1'h0 : _GEN_12; // @[TLASTGenerator.scala 101:44:@103.8]
  assign _GEN_20 = _T_62 ? 32'h0 : _GEN_14; // @[TLASTGenerator.scala 101:44:@103.8]
  assign _GEN_21 = ElasticBufferTLASTGenerator_io_out_valid ? _GEN_15 : io_mult_res_bits; // @[TLASTGenerator.scala 100:33:@101.6]
  assign _GEN_22 = ElasticBufferTLASTGenerator_io_out_valid ? _GEN_16 : 1'h0; // @[TLASTGenerator.scala 100:33:@101.6]
  assign _GEN_23 = ElasticBufferTLASTGenerator_io_out_valid ? _GEN_17 : 1'h0; // @[TLASTGenerator.scala 100:33:@101.6]
  assign _GEN_24 = ElasticBufferTLASTGenerator_io_out_valid ? _GEN_18 : 1'h0; // @[TLASTGenerator.scala 100:33:@101.6]
  assign _GEN_25 = ElasticBufferTLASTGenerator_io_out_valid ? _GEN_19 : 1'h0; // @[TLASTGenerator.scala 100:33:@101.6]
  assign _GEN_26 = ElasticBufferTLASTGenerator_io_out_valid ? _GEN_20 : 32'h0; // @[TLASTGenerator.scala 100:33:@101.6]
  assign _GEN_28 = _T_53 ? 32'h0 : _T_75; // @[TLASTGenerator.scala 127:52:@145.10]
  assign _GEN_31 = _T_48 ? _GEN_28 : count; // @[TLASTGenerator.scala 122:53:@134.8]
  assign _GEN_32 = _T_48 ? _T_53 : 1'h0; // @[TLASTGenerator.scala 122:53:@134.8]
  assign _GEN_34 = state ? _T_48 : 1'h0; // @[Conditional.scala 39:67:@132.6]
  assign _GEN_35 = state ? _GEN_31 : count; // @[Conditional.scala 39:67:@132.6]
  assign _GEN_36 = state ? _GEN_32 : 1'h0; // @[Conditional.scala 39:67:@132.6]
  assign io_mult_res_ready = _T_38 ? _GEN_25 : _GEN_34; // @[TLASTGenerator.scala 96:23:@97.4 TLASTGenerator.scala 111:43:@116.14 TLASTGenerator.scala 126:35:@140.10]
  assign io_row_len_ready = ElasticBufferTLASTGenerator_io_in_ready; // @[TLASTGenerator.scala 15:17:@65.4]
  assign io_out_valid = _T_38 ? _GEN_23 : _GEN_34; // @[TLASTGenerator.scala 94:18:@95.4 TLASTGenerator.scala 104:34:@106.10 TLASTGenerator.scala 108:34:@112.12 TLASTGenerator.scala 124:30:@136.10]
  assign io_out_bits_data = _T_38 ? _GEN_21 : io_mult_res_bits; // @[TLASTGenerator.scala 92:22:@93.4 TLASTGenerator.scala 102:38:@104.10 TLASTGenerator.scala 107:38:@111.12 TLASTGenerator.scala 123:34:@135.10]
  assign io_out_bits_last = _T_38 ? _GEN_22 : _GEN_36; // @[TLASTGenerator.scala 93:22:@94.4 TLASTGenerator.scala 103:38:@105.10 TLASTGenerator.scala 109:38:@114.12 TLASTGenerator.scala 128:38:@146.12]
  assign ElasticBufferTLASTGenerator_clock = clock; // @[:@61.4]
  assign ElasticBufferTLASTGenerator_reset = reset; // @[:@62.4]
  assign ElasticBufferTLASTGenerator_io_in_valid = io_row_len_valid; // @[TLASTGenerator.scala 15:17:@64.4]
  assign ElasticBufferTLASTGenerator_io_in_bits = io_row_len_bits; // @[TLASTGenerator.scala 15:17:@63.4]
  assign ElasticBufferTLASTGenerator_io_out_ready = _T_38 ? _GEN_24 : _GEN_36; // @[TLASTGenerator.scala 95:19:@96.4 TLASTGenerator.scala 105:35:@107.10 TLASTGenerator.scala 113:41:@119.16 TLASTGenerator.scala 129:35:@147.12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  count = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 1'h0;
    end else begin
      if (_T_38) begin
        if (_T_46) begin
          state <= 1'h1;
        end
      end else begin
        if (state) begin
          if (_T_54) begin
            state <= 1'h0;
          end
        end
      end
    end
    if (_T_38) begin
      if (ElasticBufferTLASTGenerator_io_out_valid) begin
        if (_T_62) begin
          count <= 32'h0;
        end else begin
          if (io_mult_res_valid) begin
            if (io_out_ready) begin
              if (_T_68) begin
                count <= 32'h0;
              end else begin
                count <= _T_75;
              end
            end else begin
              count <= 32'h0;
            end
          end else begin
            count <= 32'h0;
          end
        end
      end else begin
        count <= 32'h0;
      end
    end else begin
      if (state) begin
        if (_T_48) begin
          if (_T_53) begin
            count <= 32'h0;
          end else begin
            count <= _T_75;
          end
        end
      end
    end
  end
endmodule
