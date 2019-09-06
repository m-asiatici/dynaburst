// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Fri Aug 31 18:37:41 2018
// Host        : lap-laptop-3 running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ len_stream_0_sim_netlist.v
// Design      : len_stream_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Block_proc
   (ap_done_reg,
    offset_loopback_ap_vld,
    shiftReg_ce,
    \mOutPtr_reg[2] ,
    output_size_loopback,
    offset_loopback,
    in,
    ap_sync_reg_Loop_1_proc_U0_ap_ready_reg,
    ap_sync_reg_Block_proc_U0_ap_ready_reg,
    Q,
    ap_clk,
    Block_proc_U0_ap_continue,
    ap_rst_n,
    \int_offset_reg[31] ,
    ap_start,
    ap_sync_reg_Block_proc_U0_ap_ready,
    ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_0,
    Loop_1_proc_U0_ap_ready,
    ap_rst_n_inv,
    \int_output_size_reg[0] );
  output ap_done_reg;
  output offset_loopback_ap_vld;
  output shiftReg_ce;
  output \mOutPtr_reg[2] ;
  output [31:0]output_size_loopback;
  output [31:0]offset_loopback;
  output [31:0]in;
  output ap_sync_reg_Loop_1_proc_U0_ap_ready_reg;
  output ap_sync_reg_Block_proc_U0_ap_ready_reg;
  input [31:0]Q;
  input ap_clk;
  input Block_proc_U0_ap_continue;
  input ap_rst_n;
  input [31:0]\int_offset_reg[31] ;
  input ap_start;
  input ap_sync_reg_Block_proc_U0_ap_ready;
  input ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_0;
  input Loop_1_proc_U0_ap_ready;
  input ap_rst_n_inv;
  input [0:0]\int_output_size_reg[0] ;

  wire Block_proc_U0_ap_continue;
  wire Loop_1_proc_U0_ap_ready;
  wire [31:0]Q;
  wire ap_clk;
  wire ap_done_reg;
  wire ap_done_reg_i_1_n_0;
  wire [31:0]ap_return_preg;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ap_start;
  wire ap_sync_reg_Block_proc_U0_ap_ready;
  wire ap_sync_reg_Block_proc_U0_ap_ready_reg;
  wire ap_sync_reg_Loop_1_proc_U0_ap_ready_reg;
  wire ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_0;
  wire [31:0]in;
  wire [31:0]\int_offset_reg[31] ;
  wire [0:0]\int_output_size_reg[0] ;
  wire \mOutPtr_reg[2] ;
  wire [31:0]offset_loopback;
  wire offset_loopback_ap_vld;
  wire [31:0]offset_loopback_preg;
  wire [31:0]output_size_loopback;
  wire [31:0]output_size_loopback_preg;
  wire shiftReg_ce;
  wire [31:1]tmp_out_fu_42_p2;
  wire tmp_out_fu_42_p2_carry__0_n_0;
  wire tmp_out_fu_42_p2_carry__0_n_1;
  wire tmp_out_fu_42_p2_carry__0_n_2;
  wire tmp_out_fu_42_p2_carry__0_n_3;
  wire tmp_out_fu_42_p2_carry__1_n_0;
  wire tmp_out_fu_42_p2_carry__1_n_1;
  wire tmp_out_fu_42_p2_carry__1_n_2;
  wire tmp_out_fu_42_p2_carry__1_n_3;
  wire tmp_out_fu_42_p2_carry__2_n_0;
  wire tmp_out_fu_42_p2_carry__2_n_1;
  wire tmp_out_fu_42_p2_carry__2_n_2;
  wire tmp_out_fu_42_p2_carry__2_n_3;
  wire tmp_out_fu_42_p2_carry__3_n_0;
  wire tmp_out_fu_42_p2_carry__3_n_1;
  wire tmp_out_fu_42_p2_carry__3_n_2;
  wire tmp_out_fu_42_p2_carry__3_n_3;
  wire tmp_out_fu_42_p2_carry__4_n_0;
  wire tmp_out_fu_42_p2_carry__4_n_1;
  wire tmp_out_fu_42_p2_carry__4_n_2;
  wire tmp_out_fu_42_p2_carry__4_n_3;
  wire tmp_out_fu_42_p2_carry__5_n_0;
  wire tmp_out_fu_42_p2_carry__5_n_1;
  wire tmp_out_fu_42_p2_carry__5_n_2;
  wire tmp_out_fu_42_p2_carry__5_n_3;
  wire tmp_out_fu_42_p2_carry__6_n_2;
  wire tmp_out_fu_42_p2_carry__6_n_3;
  wire tmp_out_fu_42_p2_carry_n_0;
  wire tmp_out_fu_42_p2_carry_n_1;
  wire tmp_out_fu_42_p2_carry_n_2;
  wire tmp_out_fu_42_p2_carry_n_3;
  wire [3:2]NLW_tmp_out_fu_42_p2_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_tmp_out_fu_42_p2_carry__6_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \SRL_SIG_reg[2][0]_srl3_i_1 
       (.I0(Block_proc_U0_ap_continue),
        .I1(offset_loopback_ap_vld),
        .I2(ap_done_reg),
        .O(shiftReg_ce));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h74)) 
    \SRL_SIG_reg[2][0]_srl3_i_2 
       (.I0(Q[0]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[0]),
        .O(in[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][10]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[10]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[10]),
        .O(in[10]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][11]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[11]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[11]),
        .O(in[11]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][12]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[12]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[12]),
        .O(in[12]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][13]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[13]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[13]),
        .O(in[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][14]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[14]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[14]),
        .O(in[14]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][15]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[15]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[15]),
        .O(in[15]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][16]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[16]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[16]),
        .O(in[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][17]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[17]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[17]),
        .O(in[17]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][18]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[18]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[18]),
        .O(in[18]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][19]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[19]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[19]),
        .O(in[19]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][1]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[1]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[1]),
        .O(in[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][20]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[20]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[20]),
        .O(in[20]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][21]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[21]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[21]),
        .O(in[21]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][22]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[22]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[22]),
        .O(in[22]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][23]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[23]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[23]),
        .O(in[23]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][24]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[24]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[24]),
        .O(in[24]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][25]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[25]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[25]),
        .O(in[25]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][26]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[26]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[26]),
        .O(in[26]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][27]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[27]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[27]),
        .O(in[27]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][28]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[28]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[28]),
        .O(in[28]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][29]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[29]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[29]),
        .O(in[29]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][2]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[2]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[2]),
        .O(in[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][30]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[30]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[30]),
        .O(in[30]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][31]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[31]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[31]),
        .O(in[31]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][3]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[3]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[3]),
        .O(in[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][4]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[4]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[4]),
        .O(in[4]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][5]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[5]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[5]),
        .O(in[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][6]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[6]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[6]),
        .O(in[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][7]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[7]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[7]),
        .O(in[7]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][8]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[8]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[8]),
        .O(in[8]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SRL_SIG_reg[2][9]_srl3_i_1 
       (.I0(tmp_out_fu_42_p2[9]),
        .I1(offset_loopback_ap_vld),
        .I2(ap_return_preg[9]),
        .O(in[9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    ap_done_reg_i_1
       (.I0(Block_proc_U0_ap_continue),
        .I1(ap_rst_n),
        .I2(ap_done_reg),
        .I3(offset_loopback_ap_vld),
        .O(ap_done_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_reg_i_1_n_0),
        .Q(ap_done_reg),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[0] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_output_size_reg[0] ),
        .Q(ap_return_preg[0]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[10] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[10]),
        .Q(ap_return_preg[10]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[11] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[11]),
        .Q(ap_return_preg[11]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[12] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[12]),
        .Q(ap_return_preg[12]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[13] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[13]),
        .Q(ap_return_preg[13]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[14] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[14]),
        .Q(ap_return_preg[14]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[15] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[15]),
        .Q(ap_return_preg[15]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[16] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[16]),
        .Q(ap_return_preg[16]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[17] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[17]),
        .Q(ap_return_preg[17]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[18] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[18]),
        .Q(ap_return_preg[18]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[19] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[19]),
        .Q(ap_return_preg[19]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[1] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[1]),
        .Q(ap_return_preg[1]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[20] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[20]),
        .Q(ap_return_preg[20]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[21] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[21]),
        .Q(ap_return_preg[21]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[22] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[22]),
        .Q(ap_return_preg[22]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[23] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[23]),
        .Q(ap_return_preg[23]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[24] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[24]),
        .Q(ap_return_preg[24]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[25] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[25]),
        .Q(ap_return_preg[25]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[26] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[26]),
        .Q(ap_return_preg[26]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[27] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[27]),
        .Q(ap_return_preg[27]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[28] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[28]),
        .Q(ap_return_preg[28]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[29] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[29]),
        .Q(ap_return_preg[29]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[2] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[2]),
        .Q(ap_return_preg[2]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[30] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[30]),
        .Q(ap_return_preg[30]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[31] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[31]),
        .Q(ap_return_preg[31]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[3] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[3]),
        .Q(ap_return_preg[3]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[4] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[4]),
        .Q(ap_return_preg[4]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[5] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[5]),
        .Q(ap_return_preg[5]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[6] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[6]),
        .Q(ap_return_preg[6]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[7] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[7]),
        .Q(ap_return_preg[7]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[8] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[8]),
        .Q(ap_return_preg[8]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \ap_return_preg_reg[9] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(tmp_out_fu_42_p2[9]),
        .Q(ap_return_preg[9]),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'h000000A8A8A8A8A8)) 
    ap_sync_reg_Block_proc_U0_ap_ready_i_1
       (.I0(ap_rst_n),
        .I1(ap_sync_reg_Block_proc_U0_ap_ready),
        .I2(offset_loopback_ap_vld),
        .I3(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_0),
        .I4(Loop_1_proc_U0_ap_ready),
        .I5(ap_start),
        .O(ap_sync_reg_Block_proc_U0_ap_ready_reg));
  LUT6 #(
    .INIT(64'h02020200AAAAAA00)) 
    ap_sync_reg_Loop_1_proc_U0_ap_ready_i_1
       (.I0(ap_rst_n),
        .I1(ap_sync_reg_Block_proc_U0_ap_ready),
        .I2(offset_loopback_ap_vld),
        .I3(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_0),
        .I4(Loop_1_proc_U0_ap_ready),
        .I5(ap_start),
        .O(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h1F)) 
    \mOutPtr[2]_i_2 
       (.I0(ap_done_reg),
        .I1(offset_loopback_ap_vld),
        .I2(Block_proc_U0_ap_continue),
        .O(\mOutPtr_reg[2] ));
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[0]_INST_0 
       (.I0(\int_offset_reg[31] [0]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[0]),
        .O(offset_loopback[0]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[10]_INST_0 
       (.I0(\int_offset_reg[31] [10]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[10]),
        .O(offset_loopback[10]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[11]_INST_0 
       (.I0(\int_offset_reg[31] [11]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[11]),
        .O(offset_loopback[11]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[12]_INST_0 
       (.I0(\int_offset_reg[31] [12]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[12]),
        .O(offset_loopback[12]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[13]_INST_0 
       (.I0(\int_offset_reg[31] [13]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[13]),
        .O(offset_loopback[13]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[14]_INST_0 
       (.I0(\int_offset_reg[31] [14]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[14]),
        .O(offset_loopback[14]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[15]_INST_0 
       (.I0(\int_offset_reg[31] [15]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[15]),
        .O(offset_loopback[15]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[16]_INST_0 
       (.I0(\int_offset_reg[31] [16]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[16]),
        .O(offset_loopback[16]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[17]_INST_0 
       (.I0(\int_offset_reg[31] [17]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[17]),
        .O(offset_loopback[17]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[18]_INST_0 
       (.I0(\int_offset_reg[31] [18]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[18]),
        .O(offset_loopback[18]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[19]_INST_0 
       (.I0(\int_offset_reg[31] [19]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[19]),
        .O(offset_loopback[19]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[1]_INST_0 
       (.I0(\int_offset_reg[31] [1]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[1]),
        .O(offset_loopback[1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[20]_INST_0 
       (.I0(\int_offset_reg[31] [20]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[20]),
        .O(offset_loopback[20]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[21]_INST_0 
       (.I0(\int_offset_reg[31] [21]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[21]),
        .O(offset_loopback[21]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[22]_INST_0 
       (.I0(\int_offset_reg[31] [22]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[22]),
        .O(offset_loopback[22]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[23]_INST_0 
       (.I0(\int_offset_reg[31] [23]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[23]),
        .O(offset_loopback[23]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[24]_INST_0 
       (.I0(\int_offset_reg[31] [24]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[24]),
        .O(offset_loopback[24]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[25]_INST_0 
       (.I0(\int_offset_reg[31] [25]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[25]),
        .O(offset_loopback[25]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[26]_INST_0 
       (.I0(\int_offset_reg[31] [26]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[26]),
        .O(offset_loopback[26]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[27]_INST_0 
       (.I0(\int_offset_reg[31] [27]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[27]),
        .O(offset_loopback[27]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[28]_INST_0 
       (.I0(\int_offset_reg[31] [28]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[28]),
        .O(offset_loopback[28]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[29]_INST_0 
       (.I0(\int_offset_reg[31] [29]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[29]),
        .O(offset_loopback[29]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[2]_INST_0 
       (.I0(\int_offset_reg[31] [2]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[2]),
        .O(offset_loopback[2]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[30]_INST_0 
       (.I0(\int_offset_reg[31] [30]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[30]),
        .O(offset_loopback[30]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[31]_INST_0 
       (.I0(\int_offset_reg[31] [31]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[31]),
        .O(offset_loopback[31]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[3]_INST_0 
       (.I0(\int_offset_reg[31] [3]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[3]),
        .O(offset_loopback[3]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[4]_INST_0 
       (.I0(\int_offset_reg[31] [4]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[4]),
        .O(offset_loopback[4]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[5]_INST_0 
       (.I0(\int_offset_reg[31] [5]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[5]),
        .O(offset_loopback[5]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[6]_INST_0 
       (.I0(\int_offset_reg[31] [6]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[6]),
        .O(offset_loopback[6]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[7]_INST_0 
       (.I0(\int_offset_reg[31] [7]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[7]),
        .O(offset_loopback[7]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[8]_INST_0 
       (.I0(\int_offset_reg[31] [8]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[8]),
        .O(offset_loopback[8]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \offset_loopback[9]_INST_0 
       (.I0(\int_offset_reg[31] [9]),
        .I1(offset_loopback_ap_vld),
        .I2(offset_loopback_preg[9]),
        .O(offset_loopback[9]));
  LUT3 #(
    .INIT(8'h04)) 
    offset_loopback_ap_vld_INST_0
       (.I0(ap_done_reg),
        .I1(ap_start),
        .I2(ap_sync_reg_Block_proc_U0_ap_ready),
        .O(offset_loopback_ap_vld));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[0] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [0]),
        .Q(offset_loopback_preg[0]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[10] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [10]),
        .Q(offset_loopback_preg[10]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[11] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [11]),
        .Q(offset_loopback_preg[11]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[12] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [12]),
        .Q(offset_loopback_preg[12]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[13] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [13]),
        .Q(offset_loopback_preg[13]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[14] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [14]),
        .Q(offset_loopback_preg[14]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[15] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [15]),
        .Q(offset_loopback_preg[15]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[16] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [16]),
        .Q(offset_loopback_preg[16]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[17] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [17]),
        .Q(offset_loopback_preg[17]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[18] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [18]),
        .Q(offset_loopback_preg[18]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[19] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [19]),
        .Q(offset_loopback_preg[19]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[1] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [1]),
        .Q(offset_loopback_preg[1]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[20] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [20]),
        .Q(offset_loopback_preg[20]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[21] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [21]),
        .Q(offset_loopback_preg[21]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[22] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [22]),
        .Q(offset_loopback_preg[22]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[23] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [23]),
        .Q(offset_loopback_preg[23]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[24] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [24]),
        .Q(offset_loopback_preg[24]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[25] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [25]),
        .Q(offset_loopback_preg[25]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[26] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [26]),
        .Q(offset_loopback_preg[26]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[27] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [27]),
        .Q(offset_loopback_preg[27]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[28] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [28]),
        .Q(offset_loopback_preg[28]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[29] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [29]),
        .Q(offset_loopback_preg[29]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[2] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [2]),
        .Q(offset_loopback_preg[2]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[30] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [30]),
        .Q(offset_loopback_preg[30]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[31] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [31]),
        .Q(offset_loopback_preg[31]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[3] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [3]),
        .Q(offset_loopback_preg[3]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[4] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [4]),
        .Q(offset_loopback_preg[4]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[5] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [5]),
        .Q(offset_loopback_preg[5]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[6] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [6]),
        .Q(offset_loopback_preg[6]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[7] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [7]),
        .Q(offset_loopback_preg[7]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[8] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [8]),
        .Q(offset_loopback_preg[8]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \offset_loopback_preg_reg[9] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(\int_offset_reg[31] [9]),
        .Q(offset_loopback_preg[9]),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[0]_INST_0 
       (.I0(Q[0]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[0]),
        .O(output_size_loopback[0]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[10]_INST_0 
       (.I0(Q[10]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[10]),
        .O(output_size_loopback[10]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[11]_INST_0 
       (.I0(Q[11]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[11]),
        .O(output_size_loopback[11]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[12]_INST_0 
       (.I0(Q[12]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[12]),
        .O(output_size_loopback[12]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[13]_INST_0 
       (.I0(Q[13]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[13]),
        .O(output_size_loopback[13]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[14]_INST_0 
       (.I0(Q[14]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[14]),
        .O(output_size_loopback[14]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[15]_INST_0 
       (.I0(Q[15]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[15]),
        .O(output_size_loopback[15]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[16]_INST_0 
       (.I0(Q[16]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[16]),
        .O(output_size_loopback[16]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[17]_INST_0 
       (.I0(Q[17]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[17]),
        .O(output_size_loopback[17]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[18]_INST_0 
       (.I0(Q[18]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[18]),
        .O(output_size_loopback[18]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[19]_INST_0 
       (.I0(Q[19]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[19]),
        .O(output_size_loopback[19]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[1]_INST_0 
       (.I0(Q[1]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[1]),
        .O(output_size_loopback[1]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[20]_INST_0 
       (.I0(Q[20]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[20]),
        .O(output_size_loopback[20]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[21]_INST_0 
       (.I0(Q[21]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[21]),
        .O(output_size_loopback[21]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[22]_INST_0 
       (.I0(Q[22]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[22]),
        .O(output_size_loopback[22]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[23]_INST_0 
       (.I0(Q[23]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[23]),
        .O(output_size_loopback[23]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[24]_INST_0 
       (.I0(Q[24]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[24]),
        .O(output_size_loopback[24]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[25]_INST_0 
       (.I0(Q[25]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[25]),
        .O(output_size_loopback[25]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[26]_INST_0 
       (.I0(Q[26]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[26]),
        .O(output_size_loopback[26]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[27]_INST_0 
       (.I0(Q[27]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[27]),
        .O(output_size_loopback[27]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[28]_INST_0 
       (.I0(Q[28]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[28]),
        .O(output_size_loopback[28]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[29]_INST_0 
       (.I0(Q[29]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[29]),
        .O(output_size_loopback[29]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[2]_INST_0 
       (.I0(Q[2]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[2]),
        .O(output_size_loopback[2]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[30]_INST_0 
       (.I0(Q[30]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[30]),
        .O(output_size_loopback[30]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[31]_INST_0 
       (.I0(Q[31]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[31]),
        .O(output_size_loopback[31]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[3]_INST_0 
       (.I0(Q[3]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[3]),
        .O(output_size_loopback[3]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[4]_INST_0 
       (.I0(Q[4]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[4]),
        .O(output_size_loopback[4]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[5]_INST_0 
       (.I0(Q[5]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[5]),
        .O(output_size_loopback[5]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[6]_INST_0 
       (.I0(Q[6]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[6]),
        .O(output_size_loopback[6]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[7]_INST_0 
       (.I0(Q[7]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[7]),
        .O(output_size_loopback[7]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[8]_INST_0 
       (.I0(Q[8]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[8]),
        .O(output_size_loopback[8]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_size_loopback[9]_INST_0 
       (.I0(Q[9]),
        .I1(offset_loopback_ap_vld),
        .I2(output_size_loopback_preg[9]),
        .O(output_size_loopback[9]));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[0] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[0]),
        .Q(output_size_loopback_preg[0]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[10] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[10]),
        .Q(output_size_loopback_preg[10]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[11] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[11]),
        .Q(output_size_loopback_preg[11]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[12] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[12]),
        .Q(output_size_loopback_preg[12]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[13] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[13]),
        .Q(output_size_loopback_preg[13]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[14] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[14]),
        .Q(output_size_loopback_preg[14]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[15] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[15]),
        .Q(output_size_loopback_preg[15]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[16] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[16]),
        .Q(output_size_loopback_preg[16]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[17] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[17]),
        .Q(output_size_loopback_preg[17]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[18] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[18]),
        .Q(output_size_loopback_preg[18]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[19] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[19]),
        .Q(output_size_loopback_preg[19]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[1] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[1]),
        .Q(output_size_loopback_preg[1]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[20] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[20]),
        .Q(output_size_loopback_preg[20]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[21] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[21]),
        .Q(output_size_loopback_preg[21]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[22] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[22]),
        .Q(output_size_loopback_preg[22]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[23] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[23]),
        .Q(output_size_loopback_preg[23]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[24] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[24]),
        .Q(output_size_loopback_preg[24]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[25] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[25]),
        .Q(output_size_loopback_preg[25]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[26] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[26]),
        .Q(output_size_loopback_preg[26]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[27] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[27]),
        .Q(output_size_loopback_preg[27]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[28] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[28]),
        .Q(output_size_loopback_preg[28]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[29] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[29]),
        .Q(output_size_loopback_preg[29]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[2] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[2]),
        .Q(output_size_loopback_preg[2]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[30] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[30]),
        .Q(output_size_loopback_preg[30]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[31] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[31]),
        .Q(output_size_loopback_preg[31]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[3] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[3]),
        .Q(output_size_loopback_preg[3]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[4] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[4]),
        .Q(output_size_loopback_preg[4]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[5] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[5]),
        .Q(output_size_loopback_preg[5]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[6] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[6]),
        .Q(output_size_loopback_preg[6]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[7] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[7]),
        .Q(output_size_loopback_preg[7]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[8] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[8]),
        .Q(output_size_loopback_preg[8]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \output_size_loopback_preg_reg[9] 
       (.C(ap_clk),
        .CE(offset_loopback_ap_vld),
        .D(Q[9]),
        .Q(output_size_loopback_preg[9]),
        .R(ap_rst_n_inv));
  CARRY4 tmp_out_fu_42_p2_carry
       (.CI(1'b0),
        .CO({tmp_out_fu_42_p2_carry_n_0,tmp_out_fu_42_p2_carry_n_1,tmp_out_fu_42_p2_carry_n_2,tmp_out_fu_42_p2_carry_n_3}),
        .CYINIT(Q[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_out_fu_42_p2[4:1]),
        .S(Q[4:1]));
  CARRY4 tmp_out_fu_42_p2_carry__0
       (.CI(tmp_out_fu_42_p2_carry_n_0),
        .CO({tmp_out_fu_42_p2_carry__0_n_0,tmp_out_fu_42_p2_carry__0_n_1,tmp_out_fu_42_p2_carry__0_n_2,tmp_out_fu_42_p2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_out_fu_42_p2[8:5]),
        .S(Q[8:5]));
  CARRY4 tmp_out_fu_42_p2_carry__1
       (.CI(tmp_out_fu_42_p2_carry__0_n_0),
        .CO({tmp_out_fu_42_p2_carry__1_n_0,tmp_out_fu_42_p2_carry__1_n_1,tmp_out_fu_42_p2_carry__1_n_2,tmp_out_fu_42_p2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_out_fu_42_p2[12:9]),
        .S(Q[12:9]));
  CARRY4 tmp_out_fu_42_p2_carry__2
       (.CI(tmp_out_fu_42_p2_carry__1_n_0),
        .CO({tmp_out_fu_42_p2_carry__2_n_0,tmp_out_fu_42_p2_carry__2_n_1,tmp_out_fu_42_p2_carry__2_n_2,tmp_out_fu_42_p2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_out_fu_42_p2[16:13]),
        .S(Q[16:13]));
  CARRY4 tmp_out_fu_42_p2_carry__3
       (.CI(tmp_out_fu_42_p2_carry__2_n_0),
        .CO({tmp_out_fu_42_p2_carry__3_n_0,tmp_out_fu_42_p2_carry__3_n_1,tmp_out_fu_42_p2_carry__3_n_2,tmp_out_fu_42_p2_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_out_fu_42_p2[20:17]),
        .S(Q[20:17]));
  CARRY4 tmp_out_fu_42_p2_carry__4
       (.CI(tmp_out_fu_42_p2_carry__3_n_0),
        .CO({tmp_out_fu_42_p2_carry__4_n_0,tmp_out_fu_42_p2_carry__4_n_1,tmp_out_fu_42_p2_carry__4_n_2,tmp_out_fu_42_p2_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_out_fu_42_p2[24:21]),
        .S(Q[24:21]));
  CARRY4 tmp_out_fu_42_p2_carry__5
       (.CI(tmp_out_fu_42_p2_carry__4_n_0),
        .CO({tmp_out_fu_42_p2_carry__5_n_0,tmp_out_fu_42_p2_carry__5_n_1,tmp_out_fu_42_p2_carry__5_n_2,tmp_out_fu_42_p2_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(tmp_out_fu_42_p2[28:25]),
        .S(Q[28:25]));
  CARRY4 tmp_out_fu_42_p2_carry__6
       (.CI(tmp_out_fu_42_p2_carry__5_n_0),
        .CO({NLW_tmp_out_fu_42_p2_carry__6_CO_UNCONNECTED[3:2],tmp_out_fu_42_p2_carry__6_n_2,tmp_out_fu_42_p2_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_tmp_out_fu_42_p2_carry__6_O_UNCONNECTED[3],tmp_out_fu_42_p2[31:29]}),
        .S({1'b0,Q[31:29]}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Loop_1_proc
   (output_stream_V_1_ack_in,
    rowptr_stream_TREADY,
    output_stream_V_TVALID,
    int_isr,
    Q,
    ap_sync_ready,
    Loop_1_proc_U0_ap_ready,
    output_stream_V_TDATA,
    ap_rst_n_inv,
    ap_clk,
    ap_rst_n,
    ap_sync_reg_Block_proc_U0_ap_ready,
    ap_done_reg_reg,
    ap_sync_reg_Loop_1_proc_U0_ap_ready_reg,
    p_0_in,
    tmp_loc_channel_empty_n,
    ap_start,
    output_stream_V_TREADY,
    rowptr_stream_TVALID,
    out,
    rowptr_stream_TDATA);
  output output_stream_V_1_ack_in;
  output rowptr_stream_TREADY;
  output output_stream_V_TVALID;
  output int_isr;
  output [1:0]Q;
  output ap_sync_ready;
  output Loop_1_proc_U0_ap_ready;
  output [31:0]output_stream_V_TDATA;
  input ap_rst_n_inv;
  input ap_clk;
  input ap_rst_n;
  input ap_sync_reg_Block_proc_U0_ap_ready;
  input ap_done_reg_reg;
  input ap_sync_reg_Loop_1_proc_U0_ap_ready_reg;
  input p_0_in;
  input tmp_loc_channel_empty_n;
  input ap_start;
  input output_stream_V_TREADY;
  input rowptr_stream_TVALID;
  input [31:0]out;
  input [31:0]rowptr_stream_TDATA;

  wire Loop_1_proc_U0_ap_ready;
  wire [1:0]Q;
  wire \ap_CS_fsm[0]_i_1_n_0 ;
  wire \ap_CS_fsm[1]_i_1_n_0 ;
  wire \ap_CS_fsm[2]_i_1_n_0 ;
  wire \ap_CS_fsm[2]_i_2_n_0 ;
  wire ap_CS_fsm_pp0_stage0;
  wire ap_NS_fsm1;
  wire ap_block_pp0_stage0_subdone;
  wire ap_clk;
  wire ap_condition_pp0_exit_iter0_state2;
  wire ap_done_reg_reg;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_i_1_n_0;
  wire ap_enable_reg_pp0_iter1_i_1_n_0;
  wire ap_enable_reg_pp0_iter1_reg_n_0;
  wire ap_enable_reg_pp0_iter2_i_1_n_0;
  wire ap_enable_reg_pp0_iter2_reg_n_0;
  wire ap_reg_pp0_iter1_tmp_1_i_reg_132;
  wire \ap_reg_pp0_iter1_tmp_1_i_reg_132[0]_i_1_n_0 ;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ap_start;
  wire ap_sync_ready;
  wire ap_sync_reg_Block_proc_U0_ap_ready;
  wire ap_sync_reg_Loop_1_proc_U0_ap_ready_reg;
  wire [31:0]end_val_tmp_data_fu_38;
  wire exitcond_i_fu_76_p2_carry__0_i_1_n_0;
  wire exitcond_i_fu_76_p2_carry__0_i_2_n_0;
  wire exitcond_i_fu_76_p2_carry__0_i_3_n_0;
  wire exitcond_i_fu_76_p2_carry__0_i_4_n_0;
  wire exitcond_i_fu_76_p2_carry__0_n_0;
  wire exitcond_i_fu_76_p2_carry__0_n_1;
  wire exitcond_i_fu_76_p2_carry__0_n_2;
  wire exitcond_i_fu_76_p2_carry__0_n_3;
  wire exitcond_i_fu_76_p2_carry__1_i_1_n_0;
  wire exitcond_i_fu_76_p2_carry__1_i_2_n_0;
  wire exitcond_i_fu_76_p2_carry__1_i_3_n_0;
  wire exitcond_i_fu_76_p2_carry__1_n_2;
  wire exitcond_i_fu_76_p2_carry__1_n_3;
  wire exitcond_i_fu_76_p2_carry_i_1_n_0;
  wire exitcond_i_fu_76_p2_carry_i_2_n_0;
  wire exitcond_i_fu_76_p2_carry_i_3_n_0;
  wire exitcond_i_fu_76_p2_carry_i_4_n_0;
  wire exitcond_i_fu_76_p2_carry_n_0;
  wire exitcond_i_fu_76_p2_carry_n_1;
  wire exitcond_i_fu_76_p2_carry_n_2;
  wire exitcond_i_fu_76_p2_carry_n_3;
  wire i_i_reg_65;
  wire i_i_reg_650;
  wire \i_i_reg_65[0]_i_4_n_0 ;
  wire [31:0]i_i_reg_65_reg;
  wire \i_i_reg_65_reg[0]_i_3_n_0 ;
  wire \i_i_reg_65_reg[0]_i_3_n_1 ;
  wire \i_i_reg_65_reg[0]_i_3_n_2 ;
  wire \i_i_reg_65_reg[0]_i_3_n_3 ;
  wire \i_i_reg_65_reg[0]_i_3_n_4 ;
  wire \i_i_reg_65_reg[0]_i_3_n_5 ;
  wire \i_i_reg_65_reg[0]_i_3_n_6 ;
  wire \i_i_reg_65_reg[0]_i_3_n_7 ;
  wire \i_i_reg_65_reg[12]_i_1_n_0 ;
  wire \i_i_reg_65_reg[12]_i_1_n_1 ;
  wire \i_i_reg_65_reg[12]_i_1_n_2 ;
  wire \i_i_reg_65_reg[12]_i_1_n_3 ;
  wire \i_i_reg_65_reg[12]_i_1_n_4 ;
  wire \i_i_reg_65_reg[12]_i_1_n_5 ;
  wire \i_i_reg_65_reg[12]_i_1_n_6 ;
  wire \i_i_reg_65_reg[12]_i_1_n_7 ;
  wire \i_i_reg_65_reg[16]_i_1_n_0 ;
  wire \i_i_reg_65_reg[16]_i_1_n_1 ;
  wire \i_i_reg_65_reg[16]_i_1_n_2 ;
  wire \i_i_reg_65_reg[16]_i_1_n_3 ;
  wire \i_i_reg_65_reg[16]_i_1_n_4 ;
  wire \i_i_reg_65_reg[16]_i_1_n_5 ;
  wire \i_i_reg_65_reg[16]_i_1_n_6 ;
  wire \i_i_reg_65_reg[16]_i_1_n_7 ;
  wire \i_i_reg_65_reg[20]_i_1_n_0 ;
  wire \i_i_reg_65_reg[20]_i_1_n_1 ;
  wire \i_i_reg_65_reg[20]_i_1_n_2 ;
  wire \i_i_reg_65_reg[20]_i_1_n_3 ;
  wire \i_i_reg_65_reg[20]_i_1_n_4 ;
  wire \i_i_reg_65_reg[20]_i_1_n_5 ;
  wire \i_i_reg_65_reg[20]_i_1_n_6 ;
  wire \i_i_reg_65_reg[20]_i_1_n_7 ;
  wire \i_i_reg_65_reg[24]_i_1_n_0 ;
  wire \i_i_reg_65_reg[24]_i_1_n_1 ;
  wire \i_i_reg_65_reg[24]_i_1_n_2 ;
  wire \i_i_reg_65_reg[24]_i_1_n_3 ;
  wire \i_i_reg_65_reg[24]_i_1_n_4 ;
  wire \i_i_reg_65_reg[24]_i_1_n_5 ;
  wire \i_i_reg_65_reg[24]_i_1_n_6 ;
  wire \i_i_reg_65_reg[24]_i_1_n_7 ;
  wire \i_i_reg_65_reg[28]_i_1_n_1 ;
  wire \i_i_reg_65_reg[28]_i_1_n_2 ;
  wire \i_i_reg_65_reg[28]_i_1_n_3 ;
  wire \i_i_reg_65_reg[28]_i_1_n_4 ;
  wire \i_i_reg_65_reg[28]_i_1_n_5 ;
  wire \i_i_reg_65_reg[28]_i_1_n_6 ;
  wire \i_i_reg_65_reg[28]_i_1_n_7 ;
  wire \i_i_reg_65_reg[4]_i_1_n_0 ;
  wire \i_i_reg_65_reg[4]_i_1_n_1 ;
  wire \i_i_reg_65_reg[4]_i_1_n_2 ;
  wire \i_i_reg_65_reg[4]_i_1_n_3 ;
  wire \i_i_reg_65_reg[4]_i_1_n_4 ;
  wire \i_i_reg_65_reg[4]_i_1_n_5 ;
  wire \i_i_reg_65_reg[4]_i_1_n_6 ;
  wire \i_i_reg_65_reg[4]_i_1_n_7 ;
  wire \i_i_reg_65_reg[8]_i_1_n_0 ;
  wire \i_i_reg_65_reg[8]_i_1_n_1 ;
  wire \i_i_reg_65_reg[8]_i_1_n_2 ;
  wire \i_i_reg_65_reg[8]_i_1_n_3 ;
  wire \i_i_reg_65_reg[8]_i_1_n_4 ;
  wire \i_i_reg_65_reg[8]_i_1_n_5 ;
  wire \i_i_reg_65_reg[8]_i_1_n_6 ;
  wire \i_i_reg_65_reg[8]_i_1_n_7 ;
  wire int_isr;
  wire [31:0]out;
  wire output_stream_V_1_ack_in;
  wire output_stream_V_1_load_A;
  wire output_stream_V_1_load_B;
  wire [31:0]output_stream_V_1_payload_A;
  wire [31:0]output_stream_V_1_payload_B;
  wire output_stream_V_1_sel;
  wire output_stream_V_1_sel_rd_i_1_n_0;
  wire output_stream_V_1_sel_wr;
  wire output_stream_V_1_sel_wr_i_1_n_0;
  wire [1:1]output_stream_V_1_state;
  wire \output_stream_V_1_state[0]_i_1_n_0 ;
  wire [31:0]output_stream_V_TDATA;
  wire output_stream_V_TREADY;
  wire output_stream_V_TVALID;
  wire p_0_in;
  wire p_43_in;
  wire p_55_in;
  wire [31:0]rowptr_stream_TDATA;
  wire rowptr_stream_TREADY;
  wire rowptr_stream_TVALID;
  wire rowptr_stream_V_data_0_ack_in;
  wire [31:0]rowptr_stream_V_data_0_data_out;
  wire rowptr_stream_V_data_0_load_A;
  wire rowptr_stream_V_data_0_load_B;
  wire [31:0]rowptr_stream_V_data_0_payload_A;
  wire [31:0]rowptr_stream_V_data_0_payload_B;
  wire rowptr_stream_V_data_0_sel;
  wire rowptr_stream_V_data_0_sel_rd_i_1_n_0;
  wire rowptr_stream_V_data_0_sel_wr;
  wire rowptr_stream_V_data_0_sel_wr_i_1_n_0;
  wire [1:1]rowptr_stream_V_data_0_state;
  wire \rowptr_stream_V_data_0_state[0]_i_1_n_0 ;
  wire \rowptr_stream_V_data_0_state_reg_n_0_[0] ;
  wire [1:1]rowptr_stream_V_last_0_state;
  wire \rowptr_stream_V_last_0_state[0]_i_1_n_0 ;
  wire \rowptr_stream_V_last_0_state_reg_n_0_[0] ;
  wire \tmp_1_i_reg_132[0]_i_1_n_0 ;
  wire \tmp_1_i_reg_132[0]_i_2_n_0 ;
  wire \tmp_1_i_reg_132[0]_i_3_n_0 ;
  wire \tmp_1_i_reg_132[0]_i_4_n_0 ;
  wire \tmp_1_i_reg_132[0]_i_5_n_0 ;
  wire \tmp_1_i_reg_132[0]_i_6_n_0 ;
  wire \tmp_1_i_reg_132[0]_i_7_n_0 ;
  wire \tmp_1_i_reg_132[0]_i_8_n_0 ;
  wire \tmp_1_i_reg_132[0]_i_9_n_0 ;
  wire \tmp_1_i_reg_132_reg_n_0_[0] ;
  wire [31:0]tmp_fu_105_p2;
  wire tmp_fu_105_p2_carry__0_i_1_n_0;
  wire tmp_fu_105_p2_carry__0_i_2_n_0;
  wire tmp_fu_105_p2_carry__0_i_3_n_0;
  wire tmp_fu_105_p2_carry__0_i_4_n_0;
  wire tmp_fu_105_p2_carry__0_i_5_n_0;
  wire tmp_fu_105_p2_carry__0_i_6_n_0;
  wire tmp_fu_105_p2_carry__0_i_7_n_0;
  wire tmp_fu_105_p2_carry__0_i_8_n_0;
  wire tmp_fu_105_p2_carry__0_n_0;
  wire tmp_fu_105_p2_carry__0_n_1;
  wire tmp_fu_105_p2_carry__0_n_2;
  wire tmp_fu_105_p2_carry__0_n_3;
  wire tmp_fu_105_p2_carry__1_i_1_n_0;
  wire tmp_fu_105_p2_carry__1_i_2_n_0;
  wire tmp_fu_105_p2_carry__1_i_3_n_0;
  wire tmp_fu_105_p2_carry__1_i_4_n_0;
  wire tmp_fu_105_p2_carry__1_i_5_n_0;
  wire tmp_fu_105_p2_carry__1_i_6_n_0;
  wire tmp_fu_105_p2_carry__1_i_7_n_0;
  wire tmp_fu_105_p2_carry__1_i_8_n_0;
  wire tmp_fu_105_p2_carry__1_n_0;
  wire tmp_fu_105_p2_carry__1_n_1;
  wire tmp_fu_105_p2_carry__1_n_2;
  wire tmp_fu_105_p2_carry__1_n_3;
  wire tmp_fu_105_p2_carry__2_i_1_n_0;
  wire tmp_fu_105_p2_carry__2_i_2_n_0;
  wire tmp_fu_105_p2_carry__2_i_3_n_0;
  wire tmp_fu_105_p2_carry__2_i_4_n_0;
  wire tmp_fu_105_p2_carry__2_i_5_n_0;
  wire tmp_fu_105_p2_carry__2_i_6_n_0;
  wire tmp_fu_105_p2_carry__2_i_7_n_0;
  wire tmp_fu_105_p2_carry__2_i_8_n_0;
  wire tmp_fu_105_p2_carry__2_n_0;
  wire tmp_fu_105_p2_carry__2_n_1;
  wire tmp_fu_105_p2_carry__2_n_2;
  wire tmp_fu_105_p2_carry__2_n_3;
  wire tmp_fu_105_p2_carry__3_i_1_n_0;
  wire tmp_fu_105_p2_carry__3_i_2_n_0;
  wire tmp_fu_105_p2_carry__3_i_3_n_0;
  wire tmp_fu_105_p2_carry__3_i_4_n_0;
  wire tmp_fu_105_p2_carry__3_i_5_n_0;
  wire tmp_fu_105_p2_carry__3_i_6_n_0;
  wire tmp_fu_105_p2_carry__3_i_7_n_0;
  wire tmp_fu_105_p2_carry__3_i_8_n_0;
  wire tmp_fu_105_p2_carry__3_n_0;
  wire tmp_fu_105_p2_carry__3_n_1;
  wire tmp_fu_105_p2_carry__3_n_2;
  wire tmp_fu_105_p2_carry__3_n_3;
  wire tmp_fu_105_p2_carry__4_i_1_n_0;
  wire tmp_fu_105_p2_carry__4_i_2_n_0;
  wire tmp_fu_105_p2_carry__4_i_3_n_0;
  wire tmp_fu_105_p2_carry__4_i_4_n_0;
  wire tmp_fu_105_p2_carry__4_i_5_n_0;
  wire tmp_fu_105_p2_carry__4_i_6_n_0;
  wire tmp_fu_105_p2_carry__4_i_7_n_0;
  wire tmp_fu_105_p2_carry__4_i_8_n_0;
  wire tmp_fu_105_p2_carry__4_n_0;
  wire tmp_fu_105_p2_carry__4_n_1;
  wire tmp_fu_105_p2_carry__4_n_2;
  wire tmp_fu_105_p2_carry__4_n_3;
  wire tmp_fu_105_p2_carry__5_i_1_n_0;
  wire tmp_fu_105_p2_carry__5_i_2_n_0;
  wire tmp_fu_105_p2_carry__5_i_3_n_0;
  wire tmp_fu_105_p2_carry__5_i_4_n_0;
  wire tmp_fu_105_p2_carry__5_i_5_n_0;
  wire tmp_fu_105_p2_carry__5_i_6_n_0;
  wire tmp_fu_105_p2_carry__5_i_7_n_0;
  wire tmp_fu_105_p2_carry__5_i_8_n_0;
  wire tmp_fu_105_p2_carry__5_n_0;
  wire tmp_fu_105_p2_carry__5_n_1;
  wire tmp_fu_105_p2_carry__5_n_2;
  wire tmp_fu_105_p2_carry__5_n_3;
  wire tmp_fu_105_p2_carry__6_i_1_n_0;
  wire tmp_fu_105_p2_carry__6_i_2_n_0;
  wire tmp_fu_105_p2_carry__6_i_3_n_0;
  wire tmp_fu_105_p2_carry__6_i_4_n_0;
  wire tmp_fu_105_p2_carry__6_i_5_n_0;
  wire tmp_fu_105_p2_carry__6_i_6_n_0;
  wire tmp_fu_105_p2_carry__6_i_7_n_0;
  wire tmp_fu_105_p2_carry__6_n_1;
  wire tmp_fu_105_p2_carry__6_n_2;
  wire tmp_fu_105_p2_carry__6_n_3;
  wire tmp_fu_105_p2_carry_i_1_n_0;
  wire tmp_fu_105_p2_carry_i_2_n_0;
  wire tmp_fu_105_p2_carry_i_3_n_0;
  wire tmp_fu_105_p2_carry_i_4_n_0;
  wire tmp_fu_105_p2_carry_i_5_n_0;
  wire tmp_fu_105_p2_carry_i_6_n_0;
  wire tmp_fu_105_p2_carry_i_7_n_0;
  wire tmp_fu_105_p2_carry_i_8_n_0;
  wire tmp_fu_105_p2_carry_n_0;
  wire tmp_fu_105_p2_carry_n_1;
  wire tmp_fu_105_p2_carry_n_2;
  wire tmp_fu_105_p2_carry_n_3;
  wire tmp_loc_channel_empty_n;
  wire [3:0]NLW_exitcond_i_fu_76_p2_carry_O_UNCONNECTED;
  wire [3:0]NLW_exitcond_i_fu_76_p2_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_exitcond_i_fu_76_p2_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_exitcond_i_fu_76_p2_carry__1_O_UNCONNECTED;
  wire [3:3]\NLW_i_i_reg_65_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:3]NLW_tmp_fu_105_p2_carry__6_CO_UNCONNECTED;

  LUT6 #(
    .INIT(64'h00000000F7F7FF00)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(tmp_loc_channel_empty_n),
        .I1(ap_start),
        .I2(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg),
        .I3(Loop_1_proc_U0_ap_ready),
        .I4(Q[0]),
        .I5(ap_CS_fsm_pp0_stage0),
        .O(\ap_CS_fsm[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \ap_CS_fsm[0]_i_2 
       (.I0(output_stream_V_1_ack_in),
        .I1(Q[1]),
        .O(Loop_1_proc_U0_ap_ready));
  LUT6 #(
    .INIT(64'h8A88888888888888)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(\ap_CS_fsm[2]_i_2_n_0 ),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg),
        .I3(ap_start),
        .I4(tmp_loc_channel_empty_n),
        .I5(Q[0]),
        .O(\ap_CS_fsm[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h5500553F)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(\ap_CS_fsm[2]_i_2_n_0 ),
        .I1(output_stream_V_1_ack_in),
        .I2(Q[1]),
        .I3(ap_CS_fsm_pp0_stage0),
        .I4(Q[0]),
        .O(\ap_CS_fsm[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEEFFEEFFEFFFFF)) 
    \ap_CS_fsm[2]_i_2 
       (.I0(Q[0]),
        .I1(ap_enable_reg_pp0_iter1_reg_n_0),
        .I2(ap_enable_reg_pp0_iter0),
        .I3(ap_block_pp0_stage0_subdone),
        .I4(ap_condition_pp0_exit_iter0_state2),
        .I5(ap_enable_reg_pp0_iter2_reg_n_0),
        .O(\ap_CS_fsm[2]_i_2_n_0 ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm[0]_i_1_n_0 ),
        .Q(Q[0]),
        .S(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm[1]_i_1_n_0 ),
        .Q(ap_CS_fsm_pp0_stage0),
        .R(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm[2]_i_1_n_0 ),
        .Q(Q[1]),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'hE000E0E0E0E0E0E0)) 
    ap_enable_reg_pp0_iter0_i_1
       (.I0(ap_enable_reg_pp0_iter0),
        .I1(ap_NS_fsm1),
        .I2(ap_rst_n),
        .I3(ap_block_pp0_stage0_subdone),
        .I4(ap_condition_pp0_exit_iter0_state2),
        .I5(ap_CS_fsm_pp0_stage0),
        .O(ap_enable_reg_pp0_iter0_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    ap_enable_reg_pp0_iter0_i_2
       (.I0(Q[0]),
        .I1(tmp_loc_channel_empty_n),
        .I2(ap_start),
        .I3(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg),
        .O(ap_NS_fsm1));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter0_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter0_i_1_n_0),
        .Q(ap_enable_reg_pp0_iter0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h880088A0)) 
    ap_enable_reg_pp0_iter1_i_1
       (.I0(ap_rst_n),
        .I1(ap_enable_reg_pp0_iter1_reg_n_0),
        .I2(ap_enable_reg_pp0_iter0),
        .I3(ap_block_pp0_stage0_subdone),
        .I4(ap_condition_pp0_exit_iter0_state2),
        .O(ap_enable_reg_pp0_iter1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter1_i_1_n_0),
        .Q(ap_enable_reg_pp0_iter1_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00C0A0A0)) 
    ap_enable_reg_pp0_iter2_i_1
       (.I0(ap_enable_reg_pp0_iter1_reg_n_0),
        .I1(ap_enable_reg_pp0_iter2_reg_n_0),
        .I2(ap_rst_n),
        .I3(ap_NS_fsm1),
        .I4(ap_block_pp0_stage0_subdone),
        .O(ap_enable_reg_pp0_iter2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter2_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter2_i_1_n_0),
        .Q(ap_enable_reg_pp0_iter2_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \ap_reg_pp0_iter1_tmp_1_i_reg_132[0]_i_1 
       (.I0(\tmp_1_i_reg_132_reg_n_0_[0] ),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(ap_block_pp0_stage0_subdone),
        .I3(ap_reg_pp0_iter1_tmp_1_i_reg_132),
        .O(\ap_reg_pp0_iter1_tmp_1_i_reg_132[0]_i_1_n_0 ));
  FDRE \ap_reg_pp0_iter1_tmp_1_i_reg_132_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_reg_pp0_iter1_tmp_1_i_reg_132[0]_i_1_n_0 ),
        .Q(ap_reg_pp0_iter1_tmp_1_i_reg_132),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[0]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[0]),
        .I1(rowptr_stream_V_data_0_payload_A[0]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[10]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[10]),
        .I1(rowptr_stream_V_data_0_payload_A[10]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[11]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[11]),
        .I1(rowptr_stream_V_data_0_payload_A[11]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[12]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[12]),
        .I1(rowptr_stream_V_data_0_payload_A[12]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[13]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[13]),
        .I1(rowptr_stream_V_data_0_payload_A[13]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[14]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[14]),
        .I1(rowptr_stream_V_data_0_payload_A[14]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[15]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[15]),
        .I1(rowptr_stream_V_data_0_payload_A[15]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[16]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[16]),
        .I1(rowptr_stream_V_data_0_payload_A[16]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[17]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[17]),
        .I1(rowptr_stream_V_data_0_payload_A[17]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[18]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[18]),
        .I1(rowptr_stream_V_data_0_payload_A[18]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[19]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[19]),
        .I1(rowptr_stream_V_data_0_payload_A[19]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[1]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[1]),
        .I1(rowptr_stream_V_data_0_payload_A[1]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[20]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[20]),
        .I1(rowptr_stream_V_data_0_payload_A[20]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[21]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[21]),
        .I1(rowptr_stream_V_data_0_payload_A[21]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[22]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[22]),
        .I1(rowptr_stream_V_data_0_payload_A[22]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[23]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[23]),
        .I1(rowptr_stream_V_data_0_payload_A[23]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[24]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[24]),
        .I1(rowptr_stream_V_data_0_payload_A[24]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[25]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[25]),
        .I1(rowptr_stream_V_data_0_payload_A[25]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[26]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[26]),
        .I1(rowptr_stream_V_data_0_payload_A[26]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[26]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[27]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[27]),
        .I1(rowptr_stream_V_data_0_payload_A[27]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[27]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[28]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[28]),
        .I1(rowptr_stream_V_data_0_payload_A[28]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[28]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[29]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[29]),
        .I1(rowptr_stream_V_data_0_payload_A[29]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[29]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[2]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[2]),
        .I1(rowptr_stream_V_data_0_payload_A[2]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[30]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[30]),
        .I1(rowptr_stream_V_data_0_payload_A[30]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[30]));
  LUT3 #(
    .INIT(8'h20)) 
    \end_val_tmp_data_fu_38[31]_i_1 
       (.I0(ap_enable_reg_pp0_iter1_reg_n_0),
        .I1(ap_block_pp0_stage0_subdone),
        .I2(ap_CS_fsm_pp0_stage0),
        .O(p_43_in));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[31]_i_2 
       (.I0(rowptr_stream_V_data_0_payload_B[31]),
        .I1(rowptr_stream_V_data_0_payload_A[31]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[31]));
  LUT6 #(
    .INIT(64'h5575003055FF0030)) 
    \end_val_tmp_data_fu_38[31]_i_3 
       (.I0(\rowptr_stream_V_data_0_state_reg_n_0_[0] ),
        .I1(ap_reg_pp0_iter1_tmp_1_i_reg_132),
        .I2(ap_enable_reg_pp0_iter2_reg_n_0),
        .I3(output_stream_V_1_ack_in),
        .I4(ap_enable_reg_pp0_iter1_reg_n_0),
        .I5(\tmp_1_i_reg_132_reg_n_0_[0] ),
        .O(ap_block_pp0_stage0_subdone));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[3]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[3]),
        .I1(rowptr_stream_V_data_0_payload_A[3]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[4]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[4]),
        .I1(rowptr_stream_V_data_0_payload_A[4]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[5]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[5]),
        .I1(rowptr_stream_V_data_0_payload_A[5]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[6]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[6]),
        .I1(rowptr_stream_V_data_0_payload_A[6]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[7]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[7]),
        .I1(rowptr_stream_V_data_0_payload_A[7]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[8]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[8]),
        .I1(rowptr_stream_V_data_0_payload_A[8]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \end_val_tmp_data_fu_38[9]_i_1 
       (.I0(rowptr_stream_V_data_0_payload_B[9]),
        .I1(rowptr_stream_V_data_0_payload_A[9]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_data_out[9]));
  FDRE \end_val_tmp_data_fu_38_reg[0] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[0]),
        .Q(end_val_tmp_data_fu_38[0]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[10] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[10]),
        .Q(end_val_tmp_data_fu_38[10]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[11] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[11]),
        .Q(end_val_tmp_data_fu_38[11]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[12] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[12]),
        .Q(end_val_tmp_data_fu_38[12]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[13] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[13]),
        .Q(end_val_tmp_data_fu_38[13]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[14] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[14]),
        .Q(end_val_tmp_data_fu_38[14]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[15] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[15]),
        .Q(end_val_tmp_data_fu_38[15]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[16] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[16]),
        .Q(end_val_tmp_data_fu_38[16]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[17] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[17]),
        .Q(end_val_tmp_data_fu_38[17]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[18] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[18]),
        .Q(end_val_tmp_data_fu_38[18]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[19] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[19]),
        .Q(end_val_tmp_data_fu_38[19]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[1] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[1]),
        .Q(end_val_tmp_data_fu_38[1]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[20] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[20]),
        .Q(end_val_tmp_data_fu_38[20]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[21] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[21]),
        .Q(end_val_tmp_data_fu_38[21]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[22] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[22]),
        .Q(end_val_tmp_data_fu_38[22]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[23] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[23]),
        .Q(end_val_tmp_data_fu_38[23]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[24] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[24]),
        .Q(end_val_tmp_data_fu_38[24]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[25] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[25]),
        .Q(end_val_tmp_data_fu_38[25]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[26] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[26]),
        .Q(end_val_tmp_data_fu_38[26]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[27] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[27]),
        .Q(end_val_tmp_data_fu_38[27]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[28] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[28]),
        .Q(end_val_tmp_data_fu_38[28]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[29] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[29]),
        .Q(end_val_tmp_data_fu_38[29]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[2] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[2]),
        .Q(end_val_tmp_data_fu_38[2]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[30] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[30]),
        .Q(end_val_tmp_data_fu_38[30]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[31] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[31]),
        .Q(end_val_tmp_data_fu_38[31]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[3] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[3]),
        .Q(end_val_tmp_data_fu_38[3]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[4] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[4]),
        .Q(end_val_tmp_data_fu_38[4]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[5] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[5]),
        .Q(end_val_tmp_data_fu_38[5]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[6] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[6]),
        .Q(end_val_tmp_data_fu_38[6]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[7] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[7]),
        .Q(end_val_tmp_data_fu_38[7]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[8] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[8]),
        .Q(end_val_tmp_data_fu_38[8]),
        .R(1'b0));
  FDRE \end_val_tmp_data_fu_38_reg[9] 
       (.C(ap_clk),
        .CE(p_43_in),
        .D(rowptr_stream_V_data_0_data_out[9]),
        .Q(end_val_tmp_data_fu_38[9]),
        .R(1'b0));
  CARRY4 exitcond_i_fu_76_p2_carry
       (.CI(1'b0),
        .CO({exitcond_i_fu_76_p2_carry_n_0,exitcond_i_fu_76_p2_carry_n_1,exitcond_i_fu_76_p2_carry_n_2,exitcond_i_fu_76_p2_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_exitcond_i_fu_76_p2_carry_O_UNCONNECTED[3:0]),
        .S({exitcond_i_fu_76_p2_carry_i_1_n_0,exitcond_i_fu_76_p2_carry_i_2_n_0,exitcond_i_fu_76_p2_carry_i_3_n_0,exitcond_i_fu_76_p2_carry_i_4_n_0}));
  CARRY4 exitcond_i_fu_76_p2_carry__0
       (.CI(exitcond_i_fu_76_p2_carry_n_0),
        .CO({exitcond_i_fu_76_p2_carry__0_n_0,exitcond_i_fu_76_p2_carry__0_n_1,exitcond_i_fu_76_p2_carry__0_n_2,exitcond_i_fu_76_p2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_exitcond_i_fu_76_p2_carry__0_O_UNCONNECTED[3:0]),
        .S({exitcond_i_fu_76_p2_carry__0_i_1_n_0,exitcond_i_fu_76_p2_carry__0_i_2_n_0,exitcond_i_fu_76_p2_carry__0_i_3_n_0,exitcond_i_fu_76_p2_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry__0_i_1
       (.I0(i_i_reg_65_reg[22]),
        .I1(out[22]),
        .I2(i_i_reg_65_reg[21]),
        .I3(out[21]),
        .I4(out[23]),
        .I5(i_i_reg_65_reg[23]),
        .O(exitcond_i_fu_76_p2_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry__0_i_2
       (.I0(i_i_reg_65_reg[19]),
        .I1(out[19]),
        .I2(i_i_reg_65_reg[18]),
        .I3(out[18]),
        .I4(out[20]),
        .I5(i_i_reg_65_reg[20]),
        .O(exitcond_i_fu_76_p2_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry__0_i_3
       (.I0(i_i_reg_65_reg[16]),
        .I1(out[16]),
        .I2(i_i_reg_65_reg[15]),
        .I3(out[15]),
        .I4(out[17]),
        .I5(i_i_reg_65_reg[17]),
        .O(exitcond_i_fu_76_p2_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry__0_i_4
       (.I0(i_i_reg_65_reg[13]),
        .I1(out[13]),
        .I2(i_i_reg_65_reg[12]),
        .I3(out[12]),
        .I4(out[14]),
        .I5(i_i_reg_65_reg[14]),
        .O(exitcond_i_fu_76_p2_carry__0_i_4_n_0));
  CARRY4 exitcond_i_fu_76_p2_carry__1
       (.CI(exitcond_i_fu_76_p2_carry__0_n_0),
        .CO({NLW_exitcond_i_fu_76_p2_carry__1_CO_UNCONNECTED[3],ap_condition_pp0_exit_iter0_state2,exitcond_i_fu_76_p2_carry__1_n_2,exitcond_i_fu_76_p2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_exitcond_i_fu_76_p2_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,exitcond_i_fu_76_p2_carry__1_i_1_n_0,exitcond_i_fu_76_p2_carry__1_i_2_n_0,exitcond_i_fu_76_p2_carry__1_i_3_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    exitcond_i_fu_76_p2_carry__1_i_1
       (.I0(i_i_reg_65_reg[30]),
        .I1(out[30]),
        .I2(out[31]),
        .I3(i_i_reg_65_reg[31]),
        .O(exitcond_i_fu_76_p2_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry__1_i_2
       (.I0(i_i_reg_65_reg[28]),
        .I1(out[28]),
        .I2(i_i_reg_65_reg[27]),
        .I3(out[27]),
        .I4(out[29]),
        .I5(i_i_reg_65_reg[29]),
        .O(exitcond_i_fu_76_p2_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry__1_i_3
       (.I0(i_i_reg_65_reg[25]),
        .I1(out[25]),
        .I2(i_i_reg_65_reg[24]),
        .I3(out[24]),
        .I4(out[26]),
        .I5(i_i_reg_65_reg[26]),
        .O(exitcond_i_fu_76_p2_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry_i_1
       (.I0(i_i_reg_65_reg[10]),
        .I1(out[10]),
        .I2(i_i_reg_65_reg[9]),
        .I3(out[9]),
        .I4(out[11]),
        .I5(i_i_reg_65_reg[11]),
        .O(exitcond_i_fu_76_p2_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry_i_2
       (.I0(i_i_reg_65_reg[7]),
        .I1(out[7]),
        .I2(i_i_reg_65_reg[6]),
        .I3(out[6]),
        .I4(out[8]),
        .I5(i_i_reg_65_reg[8]),
        .O(exitcond_i_fu_76_p2_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry_i_3
       (.I0(i_i_reg_65_reg[4]),
        .I1(out[4]),
        .I2(i_i_reg_65_reg[3]),
        .I3(out[3]),
        .I4(out[5]),
        .I5(i_i_reg_65_reg[5]),
        .O(exitcond_i_fu_76_p2_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    exitcond_i_fu_76_p2_carry_i_4
       (.I0(i_i_reg_65_reg[1]),
        .I1(out[1]),
        .I2(i_i_reg_65_reg[0]),
        .I3(out[0]),
        .I4(out[2]),
        .I5(i_i_reg_65_reg[2]),
        .O(exitcond_i_fu_76_p2_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h00004000)) 
    \i_i_reg_65[0]_i_1 
       (.I0(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg),
        .I1(ap_start),
        .I2(tmp_loc_channel_empty_n),
        .I3(Q[0]),
        .I4(i_i_reg_650),
        .O(i_i_reg_65));
  LUT4 #(
    .INIT(16'h0008)) 
    \i_i_reg_65[0]_i_2 
       (.I0(ap_enable_reg_pp0_iter0),
        .I1(ap_CS_fsm_pp0_stage0),
        .I2(ap_condition_pp0_exit_iter0_state2),
        .I3(ap_block_pp0_stage0_subdone),
        .O(i_i_reg_650));
  LUT1 #(
    .INIT(2'h1)) 
    \i_i_reg_65[0]_i_4 
       (.I0(i_i_reg_65_reg[0]),
        .O(\i_i_reg_65[0]_i_4_n_0 ));
  FDRE \i_i_reg_65_reg[0] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[0]_i_3_n_7 ),
        .Q(i_i_reg_65_reg[0]),
        .R(i_i_reg_65));
  CARRY4 \i_i_reg_65_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\i_i_reg_65_reg[0]_i_3_n_0 ,\i_i_reg_65_reg[0]_i_3_n_1 ,\i_i_reg_65_reg[0]_i_3_n_2 ,\i_i_reg_65_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\i_i_reg_65_reg[0]_i_3_n_4 ,\i_i_reg_65_reg[0]_i_3_n_5 ,\i_i_reg_65_reg[0]_i_3_n_6 ,\i_i_reg_65_reg[0]_i_3_n_7 }),
        .S({i_i_reg_65_reg[3:1],\i_i_reg_65[0]_i_4_n_0 }));
  FDRE \i_i_reg_65_reg[10] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[8]_i_1_n_5 ),
        .Q(i_i_reg_65_reg[10]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[11] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[8]_i_1_n_4 ),
        .Q(i_i_reg_65_reg[11]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[12] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[12]_i_1_n_7 ),
        .Q(i_i_reg_65_reg[12]),
        .R(i_i_reg_65));
  CARRY4 \i_i_reg_65_reg[12]_i_1 
       (.CI(\i_i_reg_65_reg[8]_i_1_n_0 ),
        .CO({\i_i_reg_65_reg[12]_i_1_n_0 ,\i_i_reg_65_reg[12]_i_1_n_1 ,\i_i_reg_65_reg[12]_i_1_n_2 ,\i_i_reg_65_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_i_reg_65_reg[12]_i_1_n_4 ,\i_i_reg_65_reg[12]_i_1_n_5 ,\i_i_reg_65_reg[12]_i_1_n_6 ,\i_i_reg_65_reg[12]_i_1_n_7 }),
        .S(i_i_reg_65_reg[15:12]));
  FDRE \i_i_reg_65_reg[13] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[12]_i_1_n_6 ),
        .Q(i_i_reg_65_reg[13]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[14] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[12]_i_1_n_5 ),
        .Q(i_i_reg_65_reg[14]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[15] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[12]_i_1_n_4 ),
        .Q(i_i_reg_65_reg[15]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[16] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[16]_i_1_n_7 ),
        .Q(i_i_reg_65_reg[16]),
        .R(i_i_reg_65));
  CARRY4 \i_i_reg_65_reg[16]_i_1 
       (.CI(\i_i_reg_65_reg[12]_i_1_n_0 ),
        .CO({\i_i_reg_65_reg[16]_i_1_n_0 ,\i_i_reg_65_reg[16]_i_1_n_1 ,\i_i_reg_65_reg[16]_i_1_n_2 ,\i_i_reg_65_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_i_reg_65_reg[16]_i_1_n_4 ,\i_i_reg_65_reg[16]_i_1_n_5 ,\i_i_reg_65_reg[16]_i_1_n_6 ,\i_i_reg_65_reg[16]_i_1_n_7 }),
        .S(i_i_reg_65_reg[19:16]));
  FDRE \i_i_reg_65_reg[17] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[16]_i_1_n_6 ),
        .Q(i_i_reg_65_reg[17]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[18] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[16]_i_1_n_5 ),
        .Q(i_i_reg_65_reg[18]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[19] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[16]_i_1_n_4 ),
        .Q(i_i_reg_65_reg[19]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[1] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[0]_i_3_n_6 ),
        .Q(i_i_reg_65_reg[1]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[20] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[20]_i_1_n_7 ),
        .Q(i_i_reg_65_reg[20]),
        .R(i_i_reg_65));
  CARRY4 \i_i_reg_65_reg[20]_i_1 
       (.CI(\i_i_reg_65_reg[16]_i_1_n_0 ),
        .CO({\i_i_reg_65_reg[20]_i_1_n_0 ,\i_i_reg_65_reg[20]_i_1_n_1 ,\i_i_reg_65_reg[20]_i_1_n_2 ,\i_i_reg_65_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_i_reg_65_reg[20]_i_1_n_4 ,\i_i_reg_65_reg[20]_i_1_n_5 ,\i_i_reg_65_reg[20]_i_1_n_6 ,\i_i_reg_65_reg[20]_i_1_n_7 }),
        .S(i_i_reg_65_reg[23:20]));
  FDRE \i_i_reg_65_reg[21] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[20]_i_1_n_6 ),
        .Q(i_i_reg_65_reg[21]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[22] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[20]_i_1_n_5 ),
        .Q(i_i_reg_65_reg[22]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[23] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[20]_i_1_n_4 ),
        .Q(i_i_reg_65_reg[23]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[24] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[24]_i_1_n_7 ),
        .Q(i_i_reg_65_reg[24]),
        .R(i_i_reg_65));
  CARRY4 \i_i_reg_65_reg[24]_i_1 
       (.CI(\i_i_reg_65_reg[20]_i_1_n_0 ),
        .CO({\i_i_reg_65_reg[24]_i_1_n_0 ,\i_i_reg_65_reg[24]_i_1_n_1 ,\i_i_reg_65_reg[24]_i_1_n_2 ,\i_i_reg_65_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_i_reg_65_reg[24]_i_1_n_4 ,\i_i_reg_65_reg[24]_i_1_n_5 ,\i_i_reg_65_reg[24]_i_1_n_6 ,\i_i_reg_65_reg[24]_i_1_n_7 }),
        .S(i_i_reg_65_reg[27:24]));
  FDRE \i_i_reg_65_reg[25] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[24]_i_1_n_6 ),
        .Q(i_i_reg_65_reg[25]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[26] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[24]_i_1_n_5 ),
        .Q(i_i_reg_65_reg[26]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[27] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[24]_i_1_n_4 ),
        .Q(i_i_reg_65_reg[27]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[28] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[28]_i_1_n_7 ),
        .Q(i_i_reg_65_reg[28]),
        .R(i_i_reg_65));
  CARRY4 \i_i_reg_65_reg[28]_i_1 
       (.CI(\i_i_reg_65_reg[24]_i_1_n_0 ),
        .CO({\NLW_i_i_reg_65_reg[28]_i_1_CO_UNCONNECTED [3],\i_i_reg_65_reg[28]_i_1_n_1 ,\i_i_reg_65_reg[28]_i_1_n_2 ,\i_i_reg_65_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_i_reg_65_reg[28]_i_1_n_4 ,\i_i_reg_65_reg[28]_i_1_n_5 ,\i_i_reg_65_reg[28]_i_1_n_6 ,\i_i_reg_65_reg[28]_i_1_n_7 }),
        .S(i_i_reg_65_reg[31:28]));
  FDRE \i_i_reg_65_reg[29] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[28]_i_1_n_6 ),
        .Q(i_i_reg_65_reg[29]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[2] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[0]_i_3_n_5 ),
        .Q(i_i_reg_65_reg[2]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[30] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[28]_i_1_n_5 ),
        .Q(i_i_reg_65_reg[30]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[31] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[28]_i_1_n_4 ),
        .Q(i_i_reg_65_reg[31]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[3] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[0]_i_3_n_4 ),
        .Q(i_i_reg_65_reg[3]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[4] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[4]_i_1_n_7 ),
        .Q(i_i_reg_65_reg[4]),
        .R(i_i_reg_65));
  CARRY4 \i_i_reg_65_reg[4]_i_1 
       (.CI(\i_i_reg_65_reg[0]_i_3_n_0 ),
        .CO({\i_i_reg_65_reg[4]_i_1_n_0 ,\i_i_reg_65_reg[4]_i_1_n_1 ,\i_i_reg_65_reg[4]_i_1_n_2 ,\i_i_reg_65_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_i_reg_65_reg[4]_i_1_n_4 ,\i_i_reg_65_reg[4]_i_1_n_5 ,\i_i_reg_65_reg[4]_i_1_n_6 ,\i_i_reg_65_reg[4]_i_1_n_7 }),
        .S(i_i_reg_65_reg[7:4]));
  FDRE \i_i_reg_65_reg[5] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[4]_i_1_n_6 ),
        .Q(i_i_reg_65_reg[5]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[6] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[4]_i_1_n_5 ),
        .Q(i_i_reg_65_reg[6]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[7] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[4]_i_1_n_4 ),
        .Q(i_i_reg_65_reg[7]),
        .R(i_i_reg_65));
  FDRE \i_i_reg_65_reg[8] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[8]_i_1_n_7 ),
        .Q(i_i_reg_65_reg[8]),
        .R(i_i_reg_65));
  CARRY4 \i_i_reg_65_reg[8]_i_1 
       (.CI(\i_i_reg_65_reg[4]_i_1_n_0 ),
        .CO({\i_i_reg_65_reg[8]_i_1_n_0 ,\i_i_reg_65_reg[8]_i_1_n_1 ,\i_i_reg_65_reg[8]_i_1_n_2 ,\i_i_reg_65_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\i_i_reg_65_reg[8]_i_1_n_4 ,\i_i_reg_65_reg[8]_i_1_n_5 ,\i_i_reg_65_reg[8]_i_1_n_6 ,\i_i_reg_65_reg[8]_i_1_n_7 }),
        .S(i_i_reg_65_reg[11:8]));
  FDRE \i_i_reg_65_reg[9] 
       (.C(ap_clk),
        .CE(i_i_reg_650),
        .D(\i_i_reg_65_reg[8]_i_1_n_6 ),
        .Q(i_i_reg_65_reg[9]),
        .R(i_i_reg_65));
  LUT5 #(
    .INIT(32'hF8F8F800)) 
    int_ap_ready_i_1
       (.I0(output_stream_V_1_ack_in),
        .I1(Q[1]),
        .I2(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg),
        .I3(ap_done_reg_reg),
        .I4(ap_sync_reg_Block_proc_U0_ap_ready),
        .O(ap_sync_ready));
  LUT6 #(
    .INIT(64'hEEE0E0E000000000)) 
    \int_isr[1]_i_2 
       (.I0(ap_sync_reg_Block_proc_U0_ap_ready),
        .I1(ap_done_reg_reg),
        .I2(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg),
        .I3(Q[1]),
        .I4(output_stream_V_1_ack_in),
        .I5(p_0_in),
        .O(int_isr));
  LUT3 #(
    .INIT(8'h0D)) 
    \output_stream_V_1_payload_A[31]_i_1 
       (.I0(output_stream_V_TVALID),
        .I1(output_stream_V_1_ack_in),
        .I2(output_stream_V_1_sel_wr),
        .O(output_stream_V_1_load_A));
  FDRE \output_stream_V_1_payload_A_reg[0] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[0]),
        .Q(output_stream_V_1_payload_A[0]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[10] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[10]),
        .Q(output_stream_V_1_payload_A[10]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[11] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[11]),
        .Q(output_stream_V_1_payload_A[11]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[12] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[12]),
        .Q(output_stream_V_1_payload_A[12]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[13] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[13]),
        .Q(output_stream_V_1_payload_A[13]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[14] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[14]),
        .Q(output_stream_V_1_payload_A[14]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[15] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[15]),
        .Q(output_stream_V_1_payload_A[15]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[16] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[16]),
        .Q(output_stream_V_1_payload_A[16]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[17] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[17]),
        .Q(output_stream_V_1_payload_A[17]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[18] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[18]),
        .Q(output_stream_V_1_payload_A[18]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[19] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[19]),
        .Q(output_stream_V_1_payload_A[19]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[1] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[1]),
        .Q(output_stream_V_1_payload_A[1]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[20] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[20]),
        .Q(output_stream_V_1_payload_A[20]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[21] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[21]),
        .Q(output_stream_V_1_payload_A[21]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[22] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[22]),
        .Q(output_stream_V_1_payload_A[22]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[23] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[23]),
        .Q(output_stream_V_1_payload_A[23]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[24] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[24]),
        .Q(output_stream_V_1_payload_A[24]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[25] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[25]),
        .Q(output_stream_V_1_payload_A[25]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[26] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[26]),
        .Q(output_stream_V_1_payload_A[26]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[27] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[27]),
        .Q(output_stream_V_1_payload_A[27]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[28] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[28]),
        .Q(output_stream_V_1_payload_A[28]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[29] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[29]),
        .Q(output_stream_V_1_payload_A[29]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[2] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[2]),
        .Q(output_stream_V_1_payload_A[2]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[30] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[30]),
        .Q(output_stream_V_1_payload_A[30]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[31] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[31]),
        .Q(output_stream_V_1_payload_A[31]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[3] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[3]),
        .Q(output_stream_V_1_payload_A[3]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[4] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[4]),
        .Q(output_stream_V_1_payload_A[4]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[5] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[5]),
        .Q(output_stream_V_1_payload_A[5]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[6] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[6]),
        .Q(output_stream_V_1_payload_A[6]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[7] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[7]),
        .Q(output_stream_V_1_payload_A[7]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[8] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[8]),
        .Q(output_stream_V_1_payload_A[8]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_A_reg[9] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_A),
        .D(tmp_fu_105_p2[9]),
        .Q(output_stream_V_1_payload_A[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hA2)) 
    \output_stream_V_1_payload_B[31]_i_1 
       (.I0(output_stream_V_1_sel_wr),
        .I1(output_stream_V_TVALID),
        .I2(output_stream_V_1_ack_in),
        .O(output_stream_V_1_load_B));
  FDRE \output_stream_V_1_payload_B_reg[0] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[0]),
        .Q(output_stream_V_1_payload_B[0]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[10] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[10]),
        .Q(output_stream_V_1_payload_B[10]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[11] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[11]),
        .Q(output_stream_V_1_payload_B[11]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[12] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[12]),
        .Q(output_stream_V_1_payload_B[12]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[13] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[13]),
        .Q(output_stream_V_1_payload_B[13]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[14] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[14]),
        .Q(output_stream_V_1_payload_B[14]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[15] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[15]),
        .Q(output_stream_V_1_payload_B[15]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[16] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[16]),
        .Q(output_stream_V_1_payload_B[16]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[17] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[17]),
        .Q(output_stream_V_1_payload_B[17]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[18] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[18]),
        .Q(output_stream_V_1_payload_B[18]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[19] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[19]),
        .Q(output_stream_V_1_payload_B[19]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[1] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[1]),
        .Q(output_stream_V_1_payload_B[1]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[20] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[20]),
        .Q(output_stream_V_1_payload_B[20]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[21] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[21]),
        .Q(output_stream_V_1_payload_B[21]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[22] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[22]),
        .Q(output_stream_V_1_payload_B[22]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[23] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[23]),
        .Q(output_stream_V_1_payload_B[23]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[24] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[24]),
        .Q(output_stream_V_1_payload_B[24]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[25] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[25]),
        .Q(output_stream_V_1_payload_B[25]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[26] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[26]),
        .Q(output_stream_V_1_payload_B[26]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[27] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[27]),
        .Q(output_stream_V_1_payload_B[27]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[28] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[28]),
        .Q(output_stream_V_1_payload_B[28]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[29] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[29]),
        .Q(output_stream_V_1_payload_B[29]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[2] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[2]),
        .Q(output_stream_V_1_payload_B[2]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[30] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[30]),
        .Q(output_stream_V_1_payload_B[30]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[31] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[31]),
        .Q(output_stream_V_1_payload_B[31]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[3] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[3]),
        .Q(output_stream_V_1_payload_B[3]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[4] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[4]),
        .Q(output_stream_V_1_payload_B[4]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[5] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[5]),
        .Q(output_stream_V_1_payload_B[5]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[6] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[6]),
        .Q(output_stream_V_1_payload_B[6]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[7] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[7]),
        .Q(output_stream_V_1_payload_B[7]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[8] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[8]),
        .Q(output_stream_V_1_payload_B[8]),
        .R(1'b0));
  FDRE \output_stream_V_1_payload_B_reg[9] 
       (.C(ap_clk),
        .CE(output_stream_V_1_load_B),
        .D(tmp_fu_105_p2[9]),
        .Q(output_stream_V_1_payload_B[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h78)) 
    output_stream_V_1_sel_rd_i_1
       (.I0(output_stream_V_TVALID),
        .I1(output_stream_V_TREADY),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_1_sel_rd_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    output_stream_V_1_sel_rd_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(output_stream_V_1_sel_rd_i_1_n_0),
        .Q(output_stream_V_1_sel),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'hFBFFFFFF04000000)) 
    output_stream_V_1_sel_wr_i_1
       (.I0(\tmp_1_i_reg_132_reg_n_0_[0] ),
        .I1(ap_enable_reg_pp0_iter1_reg_n_0),
        .I2(ap_block_pp0_stage0_subdone),
        .I3(ap_CS_fsm_pp0_stage0),
        .I4(output_stream_V_1_ack_in),
        .I5(output_stream_V_1_sel_wr),
        .O(output_stream_V_1_sel_wr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    output_stream_V_1_sel_wr_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(output_stream_V_1_sel_wr_i_1_n_0),
        .Q(output_stream_V_1_sel_wr),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'h8AAA8800)) 
    \output_stream_V_1_state[0]_i_1 
       (.I0(ap_rst_n),
        .I1(p_55_in),
        .I2(output_stream_V_TREADY),
        .I3(output_stream_V_1_ack_in),
        .I4(output_stream_V_TVALID),
        .O(\output_stream_V_1_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \output_stream_V_1_state[0]_i_2 
       (.I0(\tmp_1_i_reg_132_reg_n_0_[0] ),
        .I1(ap_enable_reg_pp0_iter1_reg_n_0),
        .I2(ap_block_pp0_stage0_subdone),
        .I3(ap_CS_fsm_pp0_stage0),
        .O(p_55_in));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'hF5FD)) 
    \output_stream_V_1_state[1]_i_1 
       (.I0(output_stream_V_TVALID),
        .I1(output_stream_V_1_ack_in),
        .I2(output_stream_V_TREADY),
        .I3(p_55_in),
        .O(output_stream_V_1_state));
  FDRE #(
    .INIT(1'b0)) 
    \output_stream_V_1_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\output_stream_V_1_state[0]_i_1_n_0 ),
        .Q(output_stream_V_TVALID),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \output_stream_V_1_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(output_stream_V_1_state),
        .Q(output_stream_V_1_ack_in),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[0]_INST_0 
       (.I0(output_stream_V_1_payload_B[0]),
        .I1(output_stream_V_1_payload_A[0]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[0]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[10]_INST_0 
       (.I0(output_stream_V_1_payload_B[10]),
        .I1(output_stream_V_1_payload_A[10]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[10]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[11]_INST_0 
       (.I0(output_stream_V_1_payload_B[11]),
        .I1(output_stream_V_1_payload_A[11]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[11]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[12]_INST_0 
       (.I0(output_stream_V_1_payload_B[12]),
        .I1(output_stream_V_1_payload_A[12]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[12]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[13]_INST_0 
       (.I0(output_stream_V_1_payload_B[13]),
        .I1(output_stream_V_1_payload_A[13]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[13]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[14]_INST_0 
       (.I0(output_stream_V_1_payload_B[14]),
        .I1(output_stream_V_1_payload_A[14]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[14]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[15]_INST_0 
       (.I0(output_stream_V_1_payload_B[15]),
        .I1(output_stream_V_1_payload_A[15]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[15]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[16]_INST_0 
       (.I0(output_stream_V_1_payload_B[16]),
        .I1(output_stream_V_1_payload_A[16]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[16]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[17]_INST_0 
       (.I0(output_stream_V_1_payload_B[17]),
        .I1(output_stream_V_1_payload_A[17]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[17]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[18]_INST_0 
       (.I0(output_stream_V_1_payload_B[18]),
        .I1(output_stream_V_1_payload_A[18]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[18]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[19]_INST_0 
       (.I0(output_stream_V_1_payload_B[19]),
        .I1(output_stream_V_1_payload_A[19]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[19]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[1]_INST_0 
       (.I0(output_stream_V_1_payload_B[1]),
        .I1(output_stream_V_1_payload_A[1]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[1]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[20]_INST_0 
       (.I0(output_stream_V_1_payload_B[20]),
        .I1(output_stream_V_1_payload_A[20]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[20]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[21]_INST_0 
       (.I0(output_stream_V_1_payload_B[21]),
        .I1(output_stream_V_1_payload_A[21]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[21]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[22]_INST_0 
       (.I0(output_stream_V_1_payload_B[22]),
        .I1(output_stream_V_1_payload_A[22]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[22]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[23]_INST_0 
       (.I0(output_stream_V_1_payload_B[23]),
        .I1(output_stream_V_1_payload_A[23]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[23]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[24]_INST_0 
       (.I0(output_stream_V_1_payload_B[24]),
        .I1(output_stream_V_1_payload_A[24]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[24]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[25]_INST_0 
       (.I0(output_stream_V_1_payload_B[25]),
        .I1(output_stream_V_1_payload_A[25]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[25]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[26]_INST_0 
       (.I0(output_stream_V_1_payload_B[26]),
        .I1(output_stream_V_1_payload_A[26]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[26]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[27]_INST_0 
       (.I0(output_stream_V_1_payload_B[27]),
        .I1(output_stream_V_1_payload_A[27]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[27]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[28]_INST_0 
       (.I0(output_stream_V_1_payload_B[28]),
        .I1(output_stream_V_1_payload_A[28]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[28]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[29]_INST_0 
       (.I0(output_stream_V_1_payload_B[29]),
        .I1(output_stream_V_1_payload_A[29]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[29]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[2]_INST_0 
       (.I0(output_stream_V_1_payload_B[2]),
        .I1(output_stream_V_1_payload_A[2]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[2]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[30]_INST_0 
       (.I0(output_stream_V_1_payload_B[30]),
        .I1(output_stream_V_1_payload_A[30]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[30]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[31]_INST_0 
       (.I0(output_stream_V_1_payload_B[31]),
        .I1(output_stream_V_1_payload_A[31]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[31]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[3]_INST_0 
       (.I0(output_stream_V_1_payload_B[3]),
        .I1(output_stream_V_1_payload_A[3]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[3]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[4]_INST_0 
       (.I0(output_stream_V_1_payload_B[4]),
        .I1(output_stream_V_1_payload_A[4]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[4]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[5]_INST_0 
       (.I0(output_stream_V_1_payload_B[5]),
        .I1(output_stream_V_1_payload_A[5]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[5]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[6]_INST_0 
       (.I0(output_stream_V_1_payload_B[6]),
        .I1(output_stream_V_1_payload_A[6]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[6]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[7]_INST_0 
       (.I0(output_stream_V_1_payload_B[7]),
        .I1(output_stream_V_1_payload_A[7]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[7]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[8]_INST_0 
       (.I0(output_stream_V_1_payload_B[8]),
        .I1(output_stream_V_1_payload_A[8]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[8]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \output_stream_V_TDATA[9]_INST_0 
       (.I0(output_stream_V_1_payload_B[9]),
        .I1(output_stream_V_1_payload_A[9]),
        .I2(output_stream_V_1_sel),
        .O(output_stream_V_TDATA[9]));
  LUT3 #(
    .INIT(8'h0D)) 
    \rowptr_stream_V_data_0_payload_A[31]_i_1 
       (.I0(\rowptr_stream_V_data_0_state_reg_n_0_[0] ),
        .I1(rowptr_stream_V_data_0_ack_in),
        .I2(rowptr_stream_V_data_0_sel_wr),
        .O(rowptr_stream_V_data_0_load_A));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[0] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[0]),
        .Q(rowptr_stream_V_data_0_payload_A[0]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[10] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[10]),
        .Q(rowptr_stream_V_data_0_payload_A[10]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[11] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[11]),
        .Q(rowptr_stream_V_data_0_payload_A[11]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[12] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[12]),
        .Q(rowptr_stream_V_data_0_payload_A[12]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[13] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[13]),
        .Q(rowptr_stream_V_data_0_payload_A[13]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[14] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[14]),
        .Q(rowptr_stream_V_data_0_payload_A[14]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[15] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[15]),
        .Q(rowptr_stream_V_data_0_payload_A[15]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[16] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[16]),
        .Q(rowptr_stream_V_data_0_payload_A[16]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[17] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[17]),
        .Q(rowptr_stream_V_data_0_payload_A[17]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[18] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[18]),
        .Q(rowptr_stream_V_data_0_payload_A[18]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[19] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[19]),
        .Q(rowptr_stream_V_data_0_payload_A[19]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[1] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[1]),
        .Q(rowptr_stream_V_data_0_payload_A[1]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[20] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[20]),
        .Q(rowptr_stream_V_data_0_payload_A[20]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[21] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[21]),
        .Q(rowptr_stream_V_data_0_payload_A[21]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[22] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[22]),
        .Q(rowptr_stream_V_data_0_payload_A[22]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[23] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[23]),
        .Q(rowptr_stream_V_data_0_payload_A[23]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[24] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[24]),
        .Q(rowptr_stream_V_data_0_payload_A[24]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[25] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[25]),
        .Q(rowptr_stream_V_data_0_payload_A[25]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[26] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[26]),
        .Q(rowptr_stream_V_data_0_payload_A[26]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[27] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[27]),
        .Q(rowptr_stream_V_data_0_payload_A[27]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[28] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[28]),
        .Q(rowptr_stream_V_data_0_payload_A[28]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[29] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[29]),
        .Q(rowptr_stream_V_data_0_payload_A[29]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[2] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[2]),
        .Q(rowptr_stream_V_data_0_payload_A[2]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[30] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[30]),
        .Q(rowptr_stream_V_data_0_payload_A[30]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[31] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[31]),
        .Q(rowptr_stream_V_data_0_payload_A[31]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[3] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[3]),
        .Q(rowptr_stream_V_data_0_payload_A[3]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[4] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[4]),
        .Q(rowptr_stream_V_data_0_payload_A[4]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[5] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[5]),
        .Q(rowptr_stream_V_data_0_payload_A[5]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[6] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[6]),
        .Q(rowptr_stream_V_data_0_payload_A[6]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[7] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[7]),
        .Q(rowptr_stream_V_data_0_payload_A[7]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[8] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[8]),
        .Q(rowptr_stream_V_data_0_payload_A[8]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_A_reg[9] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_A),
        .D(rowptr_stream_TDATA[9]),
        .Q(rowptr_stream_V_data_0_payload_A[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hA2)) 
    \rowptr_stream_V_data_0_payload_B[31]_i_1 
       (.I0(rowptr_stream_V_data_0_sel_wr),
        .I1(\rowptr_stream_V_data_0_state_reg_n_0_[0] ),
        .I2(rowptr_stream_V_data_0_ack_in),
        .O(rowptr_stream_V_data_0_load_B));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[0] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[0]),
        .Q(rowptr_stream_V_data_0_payload_B[0]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[10] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[10]),
        .Q(rowptr_stream_V_data_0_payload_B[10]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[11] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[11]),
        .Q(rowptr_stream_V_data_0_payload_B[11]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[12] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[12]),
        .Q(rowptr_stream_V_data_0_payload_B[12]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[13] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[13]),
        .Q(rowptr_stream_V_data_0_payload_B[13]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[14] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[14]),
        .Q(rowptr_stream_V_data_0_payload_B[14]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[15] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[15]),
        .Q(rowptr_stream_V_data_0_payload_B[15]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[16] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[16]),
        .Q(rowptr_stream_V_data_0_payload_B[16]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[17] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[17]),
        .Q(rowptr_stream_V_data_0_payload_B[17]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[18] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[18]),
        .Q(rowptr_stream_V_data_0_payload_B[18]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[19] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[19]),
        .Q(rowptr_stream_V_data_0_payload_B[19]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[1] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[1]),
        .Q(rowptr_stream_V_data_0_payload_B[1]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[20] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[20]),
        .Q(rowptr_stream_V_data_0_payload_B[20]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[21] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[21]),
        .Q(rowptr_stream_V_data_0_payload_B[21]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[22] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[22]),
        .Q(rowptr_stream_V_data_0_payload_B[22]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[23] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[23]),
        .Q(rowptr_stream_V_data_0_payload_B[23]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[24] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[24]),
        .Q(rowptr_stream_V_data_0_payload_B[24]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[25] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[25]),
        .Q(rowptr_stream_V_data_0_payload_B[25]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[26] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[26]),
        .Q(rowptr_stream_V_data_0_payload_B[26]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[27] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[27]),
        .Q(rowptr_stream_V_data_0_payload_B[27]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[28] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[28]),
        .Q(rowptr_stream_V_data_0_payload_B[28]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[29] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[29]),
        .Q(rowptr_stream_V_data_0_payload_B[29]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[2] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[2]),
        .Q(rowptr_stream_V_data_0_payload_B[2]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[30] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[30]),
        .Q(rowptr_stream_V_data_0_payload_B[30]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[31] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[31]),
        .Q(rowptr_stream_V_data_0_payload_B[31]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[3] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[3]),
        .Q(rowptr_stream_V_data_0_payload_B[3]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[4] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[4]),
        .Q(rowptr_stream_V_data_0_payload_B[4]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[5] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[5]),
        .Q(rowptr_stream_V_data_0_payload_B[5]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[6] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[6]),
        .Q(rowptr_stream_V_data_0_payload_B[6]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[7] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[7]),
        .Q(rowptr_stream_V_data_0_payload_B[7]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[8] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[8]),
        .Q(rowptr_stream_V_data_0_payload_B[8]),
        .R(1'b0));
  FDRE \rowptr_stream_V_data_0_payload_B_reg[9] 
       (.C(ap_clk),
        .CE(rowptr_stream_V_data_0_load_B),
        .D(rowptr_stream_TDATA[9]),
        .Q(rowptr_stream_V_data_0_payload_B[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h78)) 
    rowptr_stream_V_data_0_sel_rd_i_1
       (.I0(p_43_in),
        .I1(\rowptr_stream_V_data_0_state_reg_n_0_[0] ),
        .I2(rowptr_stream_V_data_0_sel),
        .O(rowptr_stream_V_data_0_sel_rd_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rowptr_stream_V_data_0_sel_rd_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(rowptr_stream_V_data_0_sel_rd_i_1_n_0),
        .Q(rowptr_stream_V_data_0_sel),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h78)) 
    rowptr_stream_V_data_0_sel_wr_i_1
       (.I0(rowptr_stream_V_data_0_ack_in),
        .I1(rowptr_stream_TVALID),
        .I2(rowptr_stream_V_data_0_sel_wr),
        .O(rowptr_stream_V_data_0_sel_wr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rowptr_stream_V_data_0_sel_wr_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(rowptr_stream_V_data_0_sel_wr_i_1_n_0),
        .Q(rowptr_stream_V_data_0_sel_wr),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hA2AAA000)) 
    \rowptr_stream_V_data_0_state[0]_i_1 
       (.I0(ap_rst_n),
        .I1(p_43_in),
        .I2(rowptr_stream_TVALID),
        .I3(rowptr_stream_V_data_0_ack_in),
        .I4(\rowptr_stream_V_data_0_state_reg_n_0_[0] ),
        .O(\rowptr_stream_V_data_0_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hBAFF)) 
    \rowptr_stream_V_data_0_state[1]_i_1 
       (.I0(p_43_in),
        .I1(rowptr_stream_TVALID),
        .I2(rowptr_stream_V_data_0_ack_in),
        .I3(\rowptr_stream_V_data_0_state_reg_n_0_[0] ),
        .O(rowptr_stream_V_data_0_state));
  FDRE #(
    .INIT(1'b0)) 
    \rowptr_stream_V_data_0_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\rowptr_stream_V_data_0_state[0]_i_1_n_0 ),
        .Q(\rowptr_stream_V_data_0_state_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rowptr_stream_V_data_0_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rowptr_stream_V_data_0_state),
        .Q(rowptr_stream_V_data_0_ack_in),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hA2AAA000)) 
    \rowptr_stream_V_last_0_state[0]_i_1 
       (.I0(ap_rst_n),
        .I1(p_43_in),
        .I2(rowptr_stream_TVALID),
        .I3(rowptr_stream_TREADY),
        .I4(\rowptr_stream_V_last_0_state_reg_n_0_[0] ),
        .O(\rowptr_stream_V_last_0_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBAFF)) 
    \rowptr_stream_V_last_0_state[1]_i_2 
       (.I0(p_43_in),
        .I1(rowptr_stream_TVALID),
        .I2(rowptr_stream_TREADY),
        .I3(\rowptr_stream_V_last_0_state_reg_n_0_[0] ),
        .O(rowptr_stream_V_last_0_state));
  FDRE #(
    .INIT(1'b0)) 
    \rowptr_stream_V_last_0_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\rowptr_stream_V_last_0_state[0]_i_1_n_0 ),
        .Q(\rowptr_stream_V_last_0_state_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rowptr_stream_V_last_0_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rowptr_stream_V_last_0_state),
        .Q(rowptr_stream_TREADY),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'hFFFFF2FF00000200)) 
    \tmp_1_i_reg_132[0]_i_1 
       (.I0(\tmp_1_i_reg_132[0]_i_2_n_0 ),
        .I1(\tmp_1_i_reg_132[0]_i_3_n_0 ),
        .I2(ap_condition_pp0_exit_iter0_state2),
        .I3(ap_CS_fsm_pp0_stage0),
        .I4(ap_block_pp0_stage0_subdone),
        .I5(\tmp_1_i_reg_132_reg_n_0_[0] ),
        .O(\tmp_1_i_reg_132[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \tmp_1_i_reg_132[0]_i_2 
       (.I0(\tmp_1_i_reg_132[0]_i_4_n_0 ),
        .I1(i_i_reg_65_reg[1]),
        .I2(i_i_reg_65_reg[0]),
        .I3(i_i_reg_65_reg[3]),
        .I4(i_i_reg_65_reg[2]),
        .I5(\tmp_1_i_reg_132[0]_i_5_n_0 ),
        .O(\tmp_1_i_reg_132[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \tmp_1_i_reg_132[0]_i_3 
       (.I0(\tmp_1_i_reg_132[0]_i_6_n_0 ),
        .I1(i_i_reg_65_reg[16]),
        .I2(i_i_reg_65_reg[17]),
        .I3(i_i_reg_65_reg[18]),
        .I4(i_i_reg_65_reg[19]),
        .I5(\tmp_1_i_reg_132[0]_i_7_n_0 ),
        .O(\tmp_1_i_reg_132[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \tmp_1_i_reg_132[0]_i_4 
       (.I0(i_i_reg_65_reg[7]),
        .I1(i_i_reg_65_reg[6]),
        .I2(i_i_reg_65_reg[5]),
        .I3(i_i_reg_65_reg[4]),
        .O(\tmp_1_i_reg_132[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \tmp_1_i_reg_132[0]_i_5 
       (.I0(i_i_reg_65_reg[12]),
        .I1(i_i_reg_65_reg[13]),
        .I2(i_i_reg_65_reg[14]),
        .I3(i_i_reg_65_reg[15]),
        .I4(\tmp_1_i_reg_132[0]_i_8_n_0 ),
        .O(\tmp_1_i_reg_132[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tmp_1_i_reg_132[0]_i_6 
       (.I0(i_i_reg_65_reg[20]),
        .I1(i_i_reg_65_reg[21]),
        .I2(i_i_reg_65_reg[22]),
        .I3(i_i_reg_65_reg[23]),
        .O(\tmp_1_i_reg_132[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \tmp_1_i_reg_132[0]_i_7 
       (.I0(i_i_reg_65_reg[27]),
        .I1(i_i_reg_65_reg[26]),
        .I2(i_i_reg_65_reg[25]),
        .I3(i_i_reg_65_reg[24]),
        .I4(\tmp_1_i_reg_132[0]_i_9_n_0 ),
        .O(\tmp_1_i_reg_132[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \tmp_1_i_reg_132[0]_i_8 
       (.I0(i_i_reg_65_reg[11]),
        .I1(i_i_reg_65_reg[10]),
        .I2(i_i_reg_65_reg[9]),
        .I3(i_i_reg_65_reg[8]),
        .O(\tmp_1_i_reg_132[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tmp_1_i_reg_132[0]_i_9 
       (.I0(i_i_reg_65_reg[28]),
        .I1(i_i_reg_65_reg[29]),
        .I2(i_i_reg_65_reg[31]),
        .I3(i_i_reg_65_reg[30]),
        .O(\tmp_1_i_reg_132[0]_i_9_n_0 ));
  FDRE \tmp_1_i_reg_132_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\tmp_1_i_reg_132[0]_i_1_n_0 ),
        .Q(\tmp_1_i_reg_132_reg_n_0_[0] ),
        .R(1'b0));
  CARRY4 tmp_fu_105_p2_carry
       (.CI(1'b0),
        .CO({tmp_fu_105_p2_carry_n_0,tmp_fu_105_p2_carry_n_1,tmp_fu_105_p2_carry_n_2,tmp_fu_105_p2_carry_n_3}),
        .CYINIT(1'b1),
        .DI({tmp_fu_105_p2_carry_i_1_n_0,tmp_fu_105_p2_carry_i_2_n_0,tmp_fu_105_p2_carry_i_3_n_0,tmp_fu_105_p2_carry_i_4_n_0}),
        .O(tmp_fu_105_p2[3:0]),
        .S({tmp_fu_105_p2_carry_i_5_n_0,tmp_fu_105_p2_carry_i_6_n_0,tmp_fu_105_p2_carry_i_7_n_0,tmp_fu_105_p2_carry_i_8_n_0}));
  CARRY4 tmp_fu_105_p2_carry__0
       (.CI(tmp_fu_105_p2_carry_n_0),
        .CO({tmp_fu_105_p2_carry__0_n_0,tmp_fu_105_p2_carry__0_n_1,tmp_fu_105_p2_carry__0_n_2,tmp_fu_105_p2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({tmp_fu_105_p2_carry__0_i_1_n_0,tmp_fu_105_p2_carry__0_i_2_n_0,tmp_fu_105_p2_carry__0_i_3_n_0,tmp_fu_105_p2_carry__0_i_4_n_0}),
        .O(tmp_fu_105_p2[7:4]),
        .S({tmp_fu_105_p2_carry__0_i_5_n_0,tmp_fu_105_p2_carry__0_i_6_n_0,tmp_fu_105_p2_carry__0_i_7_n_0,tmp_fu_105_p2_carry__0_i_8_n_0}));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__0_i_1
       (.I0(rowptr_stream_V_data_0_payload_B[7]),
        .I1(rowptr_stream_V_data_0_payload_A[7]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__0_i_2
       (.I0(rowptr_stream_V_data_0_payload_B[6]),
        .I1(rowptr_stream_V_data_0_payload_A[6]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__0_i_3
       (.I0(rowptr_stream_V_data_0_payload_B[5]),
        .I1(rowptr_stream_V_data_0_payload_A[5]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__0_i_4
       (.I0(rowptr_stream_V_data_0_payload_B[4]),
        .I1(rowptr_stream_V_data_0_payload_A[4]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__0_i_5
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[7]),
        .I2(rowptr_stream_V_data_0_payload_B[7]),
        .I3(end_val_tmp_data_fu_38[7]),
        .O(tmp_fu_105_p2_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__0_i_6
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[6]),
        .I2(rowptr_stream_V_data_0_payload_B[6]),
        .I3(end_val_tmp_data_fu_38[6]),
        .O(tmp_fu_105_p2_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__0_i_7
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[5]),
        .I2(rowptr_stream_V_data_0_payload_B[5]),
        .I3(end_val_tmp_data_fu_38[5]),
        .O(tmp_fu_105_p2_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__0_i_8
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[4]),
        .I2(rowptr_stream_V_data_0_payload_B[4]),
        .I3(end_val_tmp_data_fu_38[4]),
        .O(tmp_fu_105_p2_carry__0_i_8_n_0));
  CARRY4 tmp_fu_105_p2_carry__1
       (.CI(tmp_fu_105_p2_carry__0_n_0),
        .CO({tmp_fu_105_p2_carry__1_n_0,tmp_fu_105_p2_carry__1_n_1,tmp_fu_105_p2_carry__1_n_2,tmp_fu_105_p2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({tmp_fu_105_p2_carry__1_i_1_n_0,tmp_fu_105_p2_carry__1_i_2_n_0,tmp_fu_105_p2_carry__1_i_3_n_0,tmp_fu_105_p2_carry__1_i_4_n_0}),
        .O(tmp_fu_105_p2[11:8]),
        .S({tmp_fu_105_p2_carry__1_i_5_n_0,tmp_fu_105_p2_carry__1_i_6_n_0,tmp_fu_105_p2_carry__1_i_7_n_0,tmp_fu_105_p2_carry__1_i_8_n_0}));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__1_i_1
       (.I0(rowptr_stream_V_data_0_payload_B[11]),
        .I1(rowptr_stream_V_data_0_payload_A[11]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__1_i_2
       (.I0(rowptr_stream_V_data_0_payload_B[10]),
        .I1(rowptr_stream_V_data_0_payload_A[10]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__1_i_3
       (.I0(rowptr_stream_V_data_0_payload_B[9]),
        .I1(rowptr_stream_V_data_0_payload_A[9]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__1_i_4
       (.I0(rowptr_stream_V_data_0_payload_B[8]),
        .I1(rowptr_stream_V_data_0_payload_A[8]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__1_i_5
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[11]),
        .I2(rowptr_stream_V_data_0_payload_B[11]),
        .I3(end_val_tmp_data_fu_38[11]),
        .O(tmp_fu_105_p2_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__1_i_6
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[10]),
        .I2(rowptr_stream_V_data_0_payload_B[10]),
        .I3(end_val_tmp_data_fu_38[10]),
        .O(tmp_fu_105_p2_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__1_i_7
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[9]),
        .I2(rowptr_stream_V_data_0_payload_B[9]),
        .I3(end_val_tmp_data_fu_38[9]),
        .O(tmp_fu_105_p2_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__1_i_8
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[8]),
        .I2(rowptr_stream_V_data_0_payload_B[8]),
        .I3(end_val_tmp_data_fu_38[8]),
        .O(tmp_fu_105_p2_carry__1_i_8_n_0));
  CARRY4 tmp_fu_105_p2_carry__2
       (.CI(tmp_fu_105_p2_carry__1_n_0),
        .CO({tmp_fu_105_p2_carry__2_n_0,tmp_fu_105_p2_carry__2_n_1,tmp_fu_105_p2_carry__2_n_2,tmp_fu_105_p2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({tmp_fu_105_p2_carry__2_i_1_n_0,tmp_fu_105_p2_carry__2_i_2_n_0,tmp_fu_105_p2_carry__2_i_3_n_0,tmp_fu_105_p2_carry__2_i_4_n_0}),
        .O(tmp_fu_105_p2[15:12]),
        .S({tmp_fu_105_p2_carry__2_i_5_n_0,tmp_fu_105_p2_carry__2_i_6_n_0,tmp_fu_105_p2_carry__2_i_7_n_0,tmp_fu_105_p2_carry__2_i_8_n_0}));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__2_i_1
       (.I0(rowptr_stream_V_data_0_payload_B[15]),
        .I1(rowptr_stream_V_data_0_payload_A[15]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__2_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__2_i_2
       (.I0(rowptr_stream_V_data_0_payload_B[14]),
        .I1(rowptr_stream_V_data_0_payload_A[14]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__2_i_2_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__2_i_3
       (.I0(rowptr_stream_V_data_0_payload_B[13]),
        .I1(rowptr_stream_V_data_0_payload_A[13]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__2_i_3_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__2_i_4
       (.I0(rowptr_stream_V_data_0_payload_B[12]),
        .I1(rowptr_stream_V_data_0_payload_A[12]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__2_i_5
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[15]),
        .I2(rowptr_stream_V_data_0_payload_B[15]),
        .I3(end_val_tmp_data_fu_38[15]),
        .O(tmp_fu_105_p2_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__2_i_6
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[14]),
        .I2(rowptr_stream_V_data_0_payload_B[14]),
        .I3(end_val_tmp_data_fu_38[14]),
        .O(tmp_fu_105_p2_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__2_i_7
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[13]),
        .I2(rowptr_stream_V_data_0_payload_B[13]),
        .I3(end_val_tmp_data_fu_38[13]),
        .O(tmp_fu_105_p2_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__2_i_8
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[12]),
        .I2(rowptr_stream_V_data_0_payload_B[12]),
        .I3(end_val_tmp_data_fu_38[12]),
        .O(tmp_fu_105_p2_carry__2_i_8_n_0));
  CARRY4 tmp_fu_105_p2_carry__3
       (.CI(tmp_fu_105_p2_carry__2_n_0),
        .CO({tmp_fu_105_p2_carry__3_n_0,tmp_fu_105_p2_carry__3_n_1,tmp_fu_105_p2_carry__3_n_2,tmp_fu_105_p2_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({tmp_fu_105_p2_carry__3_i_1_n_0,tmp_fu_105_p2_carry__3_i_2_n_0,tmp_fu_105_p2_carry__3_i_3_n_0,tmp_fu_105_p2_carry__3_i_4_n_0}),
        .O(tmp_fu_105_p2[19:16]),
        .S({tmp_fu_105_p2_carry__3_i_5_n_0,tmp_fu_105_p2_carry__3_i_6_n_0,tmp_fu_105_p2_carry__3_i_7_n_0,tmp_fu_105_p2_carry__3_i_8_n_0}));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__3_i_1
       (.I0(rowptr_stream_V_data_0_payload_B[19]),
        .I1(rowptr_stream_V_data_0_payload_A[19]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__3_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__3_i_2
       (.I0(rowptr_stream_V_data_0_payload_B[18]),
        .I1(rowptr_stream_V_data_0_payload_A[18]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__3_i_2_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__3_i_3
       (.I0(rowptr_stream_V_data_0_payload_B[17]),
        .I1(rowptr_stream_V_data_0_payload_A[17]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__3_i_3_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__3_i_4
       (.I0(rowptr_stream_V_data_0_payload_B[16]),
        .I1(rowptr_stream_V_data_0_payload_A[16]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__3_i_4_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__3_i_5
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[19]),
        .I2(rowptr_stream_V_data_0_payload_B[19]),
        .I3(end_val_tmp_data_fu_38[19]),
        .O(tmp_fu_105_p2_carry__3_i_5_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__3_i_6
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[18]),
        .I2(rowptr_stream_V_data_0_payload_B[18]),
        .I3(end_val_tmp_data_fu_38[18]),
        .O(tmp_fu_105_p2_carry__3_i_6_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__3_i_7
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[17]),
        .I2(rowptr_stream_V_data_0_payload_B[17]),
        .I3(end_val_tmp_data_fu_38[17]),
        .O(tmp_fu_105_p2_carry__3_i_7_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__3_i_8
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[16]),
        .I2(rowptr_stream_V_data_0_payload_B[16]),
        .I3(end_val_tmp_data_fu_38[16]),
        .O(tmp_fu_105_p2_carry__3_i_8_n_0));
  CARRY4 tmp_fu_105_p2_carry__4
       (.CI(tmp_fu_105_p2_carry__3_n_0),
        .CO({tmp_fu_105_p2_carry__4_n_0,tmp_fu_105_p2_carry__4_n_1,tmp_fu_105_p2_carry__4_n_2,tmp_fu_105_p2_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({tmp_fu_105_p2_carry__4_i_1_n_0,tmp_fu_105_p2_carry__4_i_2_n_0,tmp_fu_105_p2_carry__4_i_3_n_0,tmp_fu_105_p2_carry__4_i_4_n_0}),
        .O(tmp_fu_105_p2[23:20]),
        .S({tmp_fu_105_p2_carry__4_i_5_n_0,tmp_fu_105_p2_carry__4_i_6_n_0,tmp_fu_105_p2_carry__4_i_7_n_0,tmp_fu_105_p2_carry__4_i_8_n_0}));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__4_i_1
       (.I0(rowptr_stream_V_data_0_payload_B[23]),
        .I1(rowptr_stream_V_data_0_payload_A[23]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__4_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__4_i_2
       (.I0(rowptr_stream_V_data_0_payload_B[22]),
        .I1(rowptr_stream_V_data_0_payload_A[22]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__4_i_2_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__4_i_3
       (.I0(rowptr_stream_V_data_0_payload_B[21]),
        .I1(rowptr_stream_V_data_0_payload_A[21]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__4_i_3_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__4_i_4
       (.I0(rowptr_stream_V_data_0_payload_B[20]),
        .I1(rowptr_stream_V_data_0_payload_A[20]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__4_i_4_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__4_i_5
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[23]),
        .I2(rowptr_stream_V_data_0_payload_B[23]),
        .I3(end_val_tmp_data_fu_38[23]),
        .O(tmp_fu_105_p2_carry__4_i_5_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__4_i_6
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[22]),
        .I2(rowptr_stream_V_data_0_payload_B[22]),
        .I3(end_val_tmp_data_fu_38[22]),
        .O(tmp_fu_105_p2_carry__4_i_6_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__4_i_7
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[21]),
        .I2(rowptr_stream_V_data_0_payload_B[21]),
        .I3(end_val_tmp_data_fu_38[21]),
        .O(tmp_fu_105_p2_carry__4_i_7_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__4_i_8
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[20]),
        .I2(rowptr_stream_V_data_0_payload_B[20]),
        .I3(end_val_tmp_data_fu_38[20]),
        .O(tmp_fu_105_p2_carry__4_i_8_n_0));
  CARRY4 tmp_fu_105_p2_carry__5
       (.CI(tmp_fu_105_p2_carry__4_n_0),
        .CO({tmp_fu_105_p2_carry__5_n_0,tmp_fu_105_p2_carry__5_n_1,tmp_fu_105_p2_carry__5_n_2,tmp_fu_105_p2_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({tmp_fu_105_p2_carry__5_i_1_n_0,tmp_fu_105_p2_carry__5_i_2_n_0,tmp_fu_105_p2_carry__5_i_3_n_0,tmp_fu_105_p2_carry__5_i_4_n_0}),
        .O(tmp_fu_105_p2[27:24]),
        .S({tmp_fu_105_p2_carry__5_i_5_n_0,tmp_fu_105_p2_carry__5_i_6_n_0,tmp_fu_105_p2_carry__5_i_7_n_0,tmp_fu_105_p2_carry__5_i_8_n_0}));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__5_i_1
       (.I0(rowptr_stream_V_data_0_payload_B[27]),
        .I1(rowptr_stream_V_data_0_payload_A[27]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__5_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__5_i_2
       (.I0(rowptr_stream_V_data_0_payload_B[26]),
        .I1(rowptr_stream_V_data_0_payload_A[26]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__5_i_2_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__5_i_3
       (.I0(rowptr_stream_V_data_0_payload_B[25]),
        .I1(rowptr_stream_V_data_0_payload_A[25]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__5_i_3_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__5_i_4
       (.I0(rowptr_stream_V_data_0_payload_B[24]),
        .I1(rowptr_stream_V_data_0_payload_A[24]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__5_i_4_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__5_i_5
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[27]),
        .I2(rowptr_stream_V_data_0_payload_B[27]),
        .I3(end_val_tmp_data_fu_38[27]),
        .O(tmp_fu_105_p2_carry__5_i_5_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__5_i_6
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[26]),
        .I2(rowptr_stream_V_data_0_payload_B[26]),
        .I3(end_val_tmp_data_fu_38[26]),
        .O(tmp_fu_105_p2_carry__5_i_6_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__5_i_7
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[25]),
        .I2(rowptr_stream_V_data_0_payload_B[25]),
        .I3(end_val_tmp_data_fu_38[25]),
        .O(tmp_fu_105_p2_carry__5_i_7_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__5_i_8
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[24]),
        .I2(rowptr_stream_V_data_0_payload_B[24]),
        .I3(end_val_tmp_data_fu_38[24]),
        .O(tmp_fu_105_p2_carry__5_i_8_n_0));
  CARRY4 tmp_fu_105_p2_carry__6
       (.CI(tmp_fu_105_p2_carry__5_n_0),
        .CO({NLW_tmp_fu_105_p2_carry__6_CO_UNCONNECTED[3],tmp_fu_105_p2_carry__6_n_1,tmp_fu_105_p2_carry__6_n_2,tmp_fu_105_p2_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,tmp_fu_105_p2_carry__6_i_1_n_0,tmp_fu_105_p2_carry__6_i_2_n_0,tmp_fu_105_p2_carry__6_i_3_n_0}),
        .O(tmp_fu_105_p2[31:28]),
        .S({tmp_fu_105_p2_carry__6_i_4_n_0,tmp_fu_105_p2_carry__6_i_5_n_0,tmp_fu_105_p2_carry__6_i_6_n_0,tmp_fu_105_p2_carry__6_i_7_n_0}));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__6_i_1
       (.I0(rowptr_stream_V_data_0_payload_B[30]),
        .I1(rowptr_stream_V_data_0_payload_A[30]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__6_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__6_i_2
       (.I0(rowptr_stream_V_data_0_payload_B[29]),
        .I1(rowptr_stream_V_data_0_payload_A[29]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__6_i_2_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry__6_i_3
       (.I0(rowptr_stream_V_data_0_payload_B[28]),
        .I1(rowptr_stream_V_data_0_payload_A[28]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry__6_i_3_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__6_i_4
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[31]),
        .I2(rowptr_stream_V_data_0_payload_B[31]),
        .I3(end_val_tmp_data_fu_38[31]),
        .O(tmp_fu_105_p2_carry__6_i_4_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__6_i_5
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[30]),
        .I2(rowptr_stream_V_data_0_payload_B[30]),
        .I3(end_val_tmp_data_fu_38[30]),
        .O(tmp_fu_105_p2_carry__6_i_5_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__6_i_6
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[29]),
        .I2(rowptr_stream_V_data_0_payload_B[29]),
        .I3(end_val_tmp_data_fu_38[29]),
        .O(tmp_fu_105_p2_carry__6_i_6_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry__6_i_7
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[28]),
        .I2(rowptr_stream_V_data_0_payload_B[28]),
        .I3(end_val_tmp_data_fu_38[28]),
        .O(tmp_fu_105_p2_carry__6_i_7_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry_i_1
       (.I0(rowptr_stream_V_data_0_payload_B[3]),
        .I1(rowptr_stream_V_data_0_payload_A[3]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry_i_2
       (.I0(rowptr_stream_V_data_0_payload_B[2]),
        .I1(rowptr_stream_V_data_0_payload_A[2]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry_i_3
       (.I0(rowptr_stream_V_data_0_payload_B[1]),
        .I1(rowptr_stream_V_data_0_payload_A[1]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'hAC)) 
    tmp_fu_105_p2_carry_i_4
       (.I0(rowptr_stream_V_data_0_payload_B[0]),
        .I1(rowptr_stream_V_data_0_payload_A[0]),
        .I2(rowptr_stream_V_data_0_sel),
        .O(tmp_fu_105_p2_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry_i_5
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[3]),
        .I2(rowptr_stream_V_data_0_payload_B[3]),
        .I3(end_val_tmp_data_fu_38[3]),
        .O(tmp_fu_105_p2_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry_i_6
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[2]),
        .I2(rowptr_stream_V_data_0_payload_B[2]),
        .I3(end_val_tmp_data_fu_38[2]),
        .O(tmp_fu_105_p2_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry_i_7
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[1]),
        .I2(rowptr_stream_V_data_0_payload_B[1]),
        .I3(end_val_tmp_data_fu_38[1]),
        .O(tmp_fu_105_p2_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'hE41B)) 
    tmp_fu_105_p2_carry_i_8
       (.I0(rowptr_stream_V_data_0_sel),
        .I1(rowptr_stream_V_data_0_payload_A[0]),
        .I2(rowptr_stream_V_data_0_payload_B[0]),
        .I3(end_val_tmp_data_fu_38[0]),
        .O(tmp_fu_105_p2_carry_i_8_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w32_d2_A
   (Block_proc_U0_ap_continue,
    tmp_loc_channel_empty_n,
    out,
    ap_clk,
    ap_rst_n,
    Loop_1_proc_U0_ap_ready,
    ap_done_reg_reg,
    shiftReg_ce,
    in,
    Q,
    output_stream_V_1_ack_in,
    offset_loopback_ap_vld,
    ap_done_reg,
    ap_rst_n_inv);
  output Block_proc_U0_ap_continue;
  output tmp_loc_channel_empty_n;
  output [31:0]out;
  input ap_clk;
  input ap_rst_n;
  input Loop_1_proc_U0_ap_ready;
  input ap_done_reg_reg;
  input shiftReg_ce;
  input [31:0]in;
  input [0:0]Q;
  input output_stream_V_1_ack_in;
  input offset_loopback_ap_vld;
  input ap_done_reg;
  input ap_rst_n_inv;

  wire Block_proc_U0_ap_continue;
  wire Loop_1_proc_U0_ap_ready;
  wire [0:0]Q;
  wire ap_clk;
  wire ap_done_reg;
  wire ap_done_reg_reg;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire [31:0]in;
  wire internal_empty_n_i_1_n_0;
  wire internal_empty_n_i_2_n_0;
  wire internal_full_n_i_1_n_0;
  wire internal_full_n_i_2_n_0;
  wire [2:0]mOutPtr;
  wire \mOutPtr[0]_i_1_n_0 ;
  wire \mOutPtr[1]_i_1_n_0 ;
  wire \mOutPtr[2]_i_1_n_0 ;
  wire offset_loopback_ap_vld;
  wire [31:0]out;
  wire output_stream_V_1_ack_in;
  wire shiftReg_ce;
  wire tmp_loc_channel_empty_n;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w32_d2_A_shiftReg U_fifo_w32_d2_A_ram
       (.ap_clk(ap_clk),
        .in(in),
        .mOutPtr(mOutPtr),
        .out(out),
        .shiftReg_ce(shiftReg_ce));
  LUT6 #(
    .INIT(64'hA800AA00AAAAAAAA)) 
    internal_empty_n_i_1
       (.I0(ap_rst_n),
        .I1(mOutPtr[2]),
        .I2(internal_empty_n_i_2_n_0),
        .I3(tmp_loc_channel_empty_n),
        .I4(Loop_1_proc_U0_ap_ready),
        .I5(ap_done_reg_reg),
        .O(internal_empty_n_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT2 #(
    .INIT(4'hE)) 
    internal_empty_n_i_2
       (.I0(mOutPtr[0]),
        .I1(mOutPtr[1]),
        .O(internal_empty_n_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    internal_empty_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(internal_empty_n_i_1_n_0),
        .Q(tmp_loc_channel_empty_n),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFDDDDDDDD5D5D5D)) 
    internal_full_n_i_1
       (.I0(ap_rst_n),
        .I1(Block_proc_U0_ap_continue),
        .I2(internal_full_n_i_2_n_0),
        .I3(tmp_loc_channel_empty_n),
        .I4(Loop_1_proc_U0_ap_ready),
        .I5(ap_done_reg_reg),
        .O(internal_full_n_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'h10)) 
    internal_full_n_i_2
       (.I0(mOutPtr[2]),
        .I1(mOutPtr[1]),
        .I2(mOutPtr[0]),
        .O(internal_full_n_i_2_n_0));
  FDRE #(
    .INIT(1'b1)) 
    internal_full_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(internal_full_n_i_1_n_0),
        .Q(Block_proc_U0_ap_continue),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8787877778787888)) 
    \mOutPtr[0]_i_1 
       (.I0(Loop_1_proc_U0_ap_ready),
        .I1(tmp_loc_channel_empty_n),
        .I2(Block_proc_U0_ap_continue),
        .I3(offset_loopback_ap_vld),
        .I4(ap_done_reg),
        .I5(mOutPtr[0]),
        .O(\mOutPtr[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBDDDDDDD42222222)) 
    \mOutPtr[1]_i_1 
       (.I0(mOutPtr[0]),
        .I1(ap_done_reg_reg),
        .I2(tmp_loc_channel_empty_n),
        .I3(Q),
        .I4(output_stream_V_1_ack_in),
        .I5(mOutPtr[1]),
        .O(\mOutPtr[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFF7F7F710080808)) 
    \mOutPtr[2]_i_1 
       (.I0(mOutPtr[0]),
        .I1(mOutPtr[1]),
        .I2(ap_done_reg_reg),
        .I3(tmp_loc_channel_empty_n),
        .I4(Loop_1_proc_U0_ap_ready),
        .I5(mOutPtr[2]),
        .O(\mOutPtr[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \mOutPtr_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\mOutPtr[0]_i_1_n_0 ),
        .Q(mOutPtr[0]),
        .S(ap_rst_n_inv));
  FDSE #(
    .INIT(1'b1)) 
    \mOutPtr_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\mOutPtr[1]_i_1_n_0 ),
        .Q(mOutPtr[1]),
        .S(ap_rst_n_inv));
  FDSE #(
    .INIT(1'b1)) 
    \mOutPtr_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\mOutPtr[2]_i_1_n_0 ),
        .Q(mOutPtr[2]),
        .S(ap_rst_n_inv));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w32_d2_A_shiftReg
   (out,
    mOutPtr,
    shiftReg_ce,
    in,
    ap_clk);
  output [31:0]out;
  input [2:0]mOutPtr;
  input shiftReg_ce;
  input [31:0]in;
  input ap_clk;

  wire ap_clk;
  wire [31:0]in;
  wire [2:0]mOutPtr;
  wire [31:0]out;
  wire [1:0]shiftReg_addr;
  wire shiftReg_ce;

  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][0]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][0]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[0]),
        .Q(out[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \SRL_SIG_reg[2][0]_srl3_i_3 
       (.I0(mOutPtr[0]),
        .I1(mOutPtr[2]),
        .O(shiftReg_addr[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \SRL_SIG_reg[2][0]_srl3_i_4 
       (.I0(mOutPtr[1]),
        .I1(mOutPtr[2]),
        .O(shiftReg_addr[1]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][10]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][10]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[10]),
        .Q(out[10]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][11]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][11]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[11]),
        .Q(out[11]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][12]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][12]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[12]),
        .Q(out[12]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][13]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][13]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[13]),
        .Q(out[13]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][14]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][14]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[14]),
        .Q(out[14]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][15]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][15]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[15]),
        .Q(out[15]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][16]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][16]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[16]),
        .Q(out[16]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][17]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][17]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[17]),
        .Q(out[17]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][18]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][18]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[18]),
        .Q(out[18]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][19]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][19]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[19]),
        .Q(out[19]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][1]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][1]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[1]),
        .Q(out[1]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][20]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][20]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[20]),
        .Q(out[20]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][21]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][21]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[21]),
        .Q(out[21]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][22]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][22]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[22]),
        .Q(out[22]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][23]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][23]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[23]),
        .Q(out[23]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][24]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][24]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[24]),
        .Q(out[24]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][25]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][25]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[25]),
        .Q(out[25]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][26]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][26]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[26]),
        .Q(out[26]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][27]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][27]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[27]),
        .Q(out[27]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][28]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][28]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[28]),
        .Q(out[28]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][29]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][29]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[29]),
        .Q(out[29]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][2]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][2]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[2]),
        .Q(out[2]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][30]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][30]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[30]),
        .Q(out[30]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][31]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][31]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[31]),
        .Q(out[31]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][3]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[3]),
        .Q(out[3]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][4]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][4]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[4]),
        .Q(out[4]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][5]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][5]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[5]),
        .Q(out[5]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][6]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][6]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[6]),
        .Q(out[6]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][7]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][7]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[7]),
        .Q(out[7]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][8]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][8]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[8]),
        .Q(out[8]));
  (* srl_bus_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2] " *) 
  (* srl_name = "inst/\tmp_loc_channel_U/U_fifo_w32_d2_A_ram/SRL_SIG_reg[2][9]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \SRL_SIG_reg[2][9]_srl3 
       (.A0(shiftReg_addr[0]),
        .A1(shiftReg_addr[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(shiftReg_ce),
        .CLK(ap_clk),
        .D(in[9]),
        .Q(out[9]));
endmodule

(* C_S_AXI_ADDR_WIDTH = "32" *) (* C_S_AXI_AXILITES_ADDR_WIDTH = "6" *) (* C_S_AXI_AXILITES_DATA_WIDTH = "32" *) 
(* C_S_AXI_AXILITES_WSTRB_WIDTH = "4" *) (* C_S_AXI_DATA_WIDTH = "32" *) (* C_S_AXI_WSTRB_WIDTH = "4" *) 
(* hls_module = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_len_stream
   (s_axi_AXILiteS_AWVALID,
    s_axi_AXILiteS_AWREADY,
    s_axi_AXILiteS_AWADDR,
    s_axi_AXILiteS_WVALID,
    s_axi_AXILiteS_WREADY,
    s_axi_AXILiteS_WDATA,
    s_axi_AXILiteS_WSTRB,
    s_axi_AXILiteS_ARVALID,
    s_axi_AXILiteS_ARREADY,
    s_axi_AXILiteS_ARADDR,
    s_axi_AXILiteS_RVALID,
    s_axi_AXILiteS_RREADY,
    s_axi_AXILiteS_RDATA,
    s_axi_AXILiteS_RRESP,
    s_axi_AXILiteS_BVALID,
    s_axi_AXILiteS_BREADY,
    s_axi_AXILiteS_BRESP,
    ap_clk,
    ap_rst_n,
    interrupt,
    output_size_loopback,
    offset_loopback,
    rowptr_stream_TDATA,
    rowptr_stream_TKEEP,
    rowptr_stream_TLAST,
    output_stream_V_TDATA,
    output_size_loopback_ap_vld,
    offset_loopback_ap_vld,
    rowptr_stream_TVALID,
    rowptr_stream_TREADY,
    output_stream_V_TVALID,
    output_stream_V_TREADY);
  input s_axi_AXILiteS_AWVALID;
  output s_axi_AXILiteS_AWREADY;
  input [5:0]s_axi_AXILiteS_AWADDR;
  input s_axi_AXILiteS_WVALID;
  output s_axi_AXILiteS_WREADY;
  input [31:0]s_axi_AXILiteS_WDATA;
  input [3:0]s_axi_AXILiteS_WSTRB;
  input s_axi_AXILiteS_ARVALID;
  output s_axi_AXILiteS_ARREADY;
  input [5:0]s_axi_AXILiteS_ARADDR;
  output s_axi_AXILiteS_RVALID;
  input s_axi_AXILiteS_RREADY;
  output [31:0]s_axi_AXILiteS_RDATA;
  output [1:0]s_axi_AXILiteS_RRESP;
  output s_axi_AXILiteS_BVALID;
  input s_axi_AXILiteS_BREADY;
  output [1:0]s_axi_AXILiteS_BRESP;
  input ap_clk;
  input ap_rst_n;
  output interrupt;
  output [31:0]output_size_loopback;
  output [31:0]offset_loopback;
  input [31:0]rowptr_stream_TDATA;
  input [3:0]rowptr_stream_TKEEP;
  input rowptr_stream_TLAST;
  output [31:0]output_stream_V_TDATA;
  output output_size_loopback_ap_vld;
  output offset_loopback_ap_vld;
  input rowptr_stream_TVALID;
  output rowptr_stream_TREADY;
  output output_stream_V_TVALID;
  input output_stream_V_TREADY;

  wire \<const0> ;
  wire Block_proc_U0_ap_continue;
  wire [31:0]Block_proc_U0_ap_return;
  wire Block_proc_U0_n_100;
  wire Block_proc_U0_n_101;
  wire Block_proc_U0_n_3;
  wire Loop_1_proc_U0_ap_ready;
  wire Loop_1_proc_U0_n_5;
  wire ap_CS_fsm_state5;
  wire ap_clk;
  wire ap_done_reg;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ap_start;
  wire ap_sync_ready;
  wire ap_sync_reg_Block_proc_U0_ap_ready;
  wire ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_n_0;
  wire int_isr;
  wire interrupt;
  wire [31:0]offset;
  wire [31:0]offset_loopback;
  wire offset_loopback_ap_vld;
  wire [31:0]output_size;
  wire [31:0]output_size_loopback;
  wire output_stream_V_1_ack_in;
  wire [31:0]output_stream_V_TDATA;
  wire output_stream_V_TREADY;
  wire output_stream_V_TVALID;
  wire p_0_in;
  wire [31:0]rowptr_stream_TDATA;
  wire rowptr_stream_TREADY;
  wire rowptr_stream_TVALID;
  wire [5:0]s_axi_AXILiteS_ARADDR;
  wire s_axi_AXILiteS_ARREADY;
  wire s_axi_AXILiteS_ARVALID;
  wire [5:0]s_axi_AXILiteS_AWADDR;
  wire s_axi_AXILiteS_AWREADY;
  wire s_axi_AXILiteS_AWVALID;
  wire s_axi_AXILiteS_BREADY;
  wire s_axi_AXILiteS_BVALID;
  wire [31:0]s_axi_AXILiteS_RDATA;
  wire s_axi_AXILiteS_RREADY;
  wire s_axi_AXILiteS_RVALID;
  wire [31:0]s_axi_AXILiteS_WDATA;
  wire s_axi_AXILiteS_WREADY;
  wire [3:0]s_axi_AXILiteS_WSTRB;
  wire s_axi_AXILiteS_WVALID;
  wire shiftReg_ce;
  wire [31:0]tmp_loc_channel_dout;
  wire tmp_loc_channel_empty_n;
  wire [0:0]tmp_out_fu_42_p2;

  assign output_size_loopback_ap_vld = offset_loopback_ap_vld;
  assign s_axi_AXILiteS_BRESP[1] = \<const0> ;
  assign s_axi_AXILiteS_BRESP[0] = \<const0> ;
  assign s_axi_AXILiteS_RRESP[1] = \<const0> ;
  assign s_axi_AXILiteS_RRESP[0] = \<const0> ;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Block_proc Block_proc_U0
       (.Block_proc_U0_ap_continue(Block_proc_U0_ap_continue),
        .Loop_1_proc_U0_ap_ready(Loop_1_proc_U0_ap_ready),
        .Q(output_size),
        .ap_clk(ap_clk),
        .ap_done_reg(ap_done_reg),
        .ap_rst_n(ap_rst_n),
        .ap_rst_n_inv(ap_rst_n_inv),
        .ap_start(ap_start),
        .ap_sync_reg_Block_proc_U0_ap_ready(ap_sync_reg_Block_proc_U0_ap_ready),
        .ap_sync_reg_Block_proc_U0_ap_ready_reg(Block_proc_U0_n_101),
        .ap_sync_reg_Loop_1_proc_U0_ap_ready_reg(Block_proc_U0_n_100),
        .ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_0(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_n_0),
        .in(Block_proc_U0_ap_return),
        .\int_offset_reg[31] (offset),
        .\int_output_size_reg[0] (tmp_out_fu_42_p2),
        .\mOutPtr_reg[2] (Block_proc_U0_n_3),
        .offset_loopback(offset_loopback),
        .offset_loopback_ap_vld(offset_loopback_ap_vld),
        .output_size_loopback(output_size_loopback),
        .shiftReg_ce(shiftReg_ce));
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Loop_1_proc Loop_1_proc_U0
       (.Loop_1_proc_U0_ap_ready(Loop_1_proc_U0_ap_ready),
        .Q({ap_CS_fsm_state5,Loop_1_proc_U0_n_5}),
        .ap_clk(ap_clk),
        .ap_done_reg_reg(offset_loopback_ap_vld),
        .ap_rst_n(ap_rst_n),
        .ap_rst_n_inv(ap_rst_n_inv),
        .ap_start(ap_start),
        .ap_sync_ready(ap_sync_ready),
        .ap_sync_reg_Block_proc_U0_ap_ready(ap_sync_reg_Block_proc_U0_ap_ready),
        .ap_sync_reg_Loop_1_proc_U0_ap_ready_reg(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_n_0),
        .int_isr(int_isr),
        .out(tmp_loc_channel_dout),
        .output_stream_V_1_ack_in(output_stream_V_1_ack_in),
        .output_stream_V_TDATA(output_stream_V_TDATA),
        .output_stream_V_TREADY(output_stream_V_TREADY),
        .output_stream_V_TVALID(output_stream_V_TVALID),
        .p_0_in(p_0_in),
        .rowptr_stream_TDATA(rowptr_stream_TDATA),
        .rowptr_stream_TREADY(rowptr_stream_TREADY),
        .rowptr_stream_TVALID(rowptr_stream_TVALID),
        .tmp_loc_channel_empty_n(tmp_loc_channel_empty_n));
  FDRE #(
    .INIT(1'b0)) 
    ap_sync_reg_Block_proc_U0_ap_ready_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(Block_proc_U0_n_101),
        .Q(ap_sync_reg_Block_proc_U0_ap_ready),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    ap_sync_reg_Loop_1_proc_U0_ap_ready_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(Block_proc_U0_n_100),
        .Q(ap_sync_reg_Loop_1_proc_U0_ap_ready_reg_n_0),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_len_stream_AXILiteS_s_axi len_stream_AXILiteS_s_axi_U
       (.Q(offset),
        .\ap_CS_fsm_reg[2] ({ap_CS_fsm_state5,Loop_1_proc_U0_n_5}),
        .ap_clk(ap_clk),
        .\ap_return_preg_reg[0] (tmp_out_fu_42_p2),
        .ap_rst_n(ap_rst_n),
        .ap_rst_n_inv(ap_rst_n_inv),
        .ap_start(ap_start),
        .ap_sync_ready(ap_sync_ready),
        .ap_sync_reg_Block_proc_U0_ap_ready(ap_sync_reg_Block_proc_U0_ap_ready),
        .int_isr(int_isr),
        .interrupt(interrupt),
        .out({s_axi_AXILiteS_BVALID,s_axi_AXILiteS_WREADY,s_axi_AXILiteS_AWREADY}),
        .\output_size_loopback_preg_reg[31] (output_size),
        .output_stream_V_1_ack_in(output_stream_V_1_ack_in),
        .p_0_in(p_0_in),
        .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
        .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
        .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
        .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
        .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
        .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
        .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
        .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
        .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
        .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
        .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
        .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID),
        .tmp_loc_channel_empty_n(tmp_loc_channel_empty_n));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w32_d2_A tmp_loc_channel_U
       (.Block_proc_U0_ap_continue(Block_proc_U0_ap_continue),
        .Loop_1_proc_U0_ap_ready(Loop_1_proc_U0_ap_ready),
        .Q(ap_CS_fsm_state5),
        .ap_clk(ap_clk),
        .ap_done_reg(ap_done_reg),
        .ap_done_reg_reg(Block_proc_U0_n_3),
        .ap_rst_n(ap_rst_n),
        .ap_rst_n_inv(ap_rst_n_inv),
        .in(Block_proc_U0_ap_return),
        .offset_loopback_ap_vld(offset_loopback_ap_vld),
        .out(tmp_loc_channel_dout),
        .output_stream_V_1_ack_in(output_stream_V_1_ack_in),
        .shiftReg_ce(shiftReg_ce),
        .tmp_loc_channel_empty_n(tmp_loc_channel_empty_n));
endmodule

(* CHECK_LICENSE_TYPE = "len_stream_0,len_stream,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "len_stream,Vivado 2017.4" *) 
(* hls_module = "yes" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (output_size_loopback_ap_vld,
    offset_loopback_ap_vld,
    s_axi_AXILiteS_AWADDR,
    s_axi_AXILiteS_AWVALID,
    s_axi_AXILiteS_AWREADY,
    s_axi_AXILiteS_WDATA,
    s_axi_AXILiteS_WSTRB,
    s_axi_AXILiteS_WVALID,
    s_axi_AXILiteS_WREADY,
    s_axi_AXILiteS_BRESP,
    s_axi_AXILiteS_BVALID,
    s_axi_AXILiteS_BREADY,
    s_axi_AXILiteS_ARADDR,
    s_axi_AXILiteS_ARVALID,
    s_axi_AXILiteS_ARREADY,
    s_axi_AXILiteS_RDATA,
    s_axi_AXILiteS_RRESP,
    s_axi_AXILiteS_RVALID,
    s_axi_AXILiteS_RREADY,
    ap_clk,
    ap_rst_n,
    interrupt,
    output_size_loopback,
    offset_loopback,
    rowptr_stream_TVALID,
    rowptr_stream_TREADY,
    rowptr_stream_TDATA,
    rowptr_stream_TKEEP,
    rowptr_stream_TLAST,
    output_stream_V_TVALID,
    output_stream_V_TREADY,
    output_stream_V_TDATA);
  output output_size_loopback_ap_vld;
  output offset_loopback_ap_vld;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWADDR" *) input [5:0]s_axi_AXILiteS_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWVALID" *) input s_axi_AXILiteS_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWREADY" *) output s_axi_AXILiteS_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WDATA" *) input [31:0]s_axi_AXILiteS_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WSTRB" *) input [3:0]s_axi_AXILiteS_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WVALID" *) input s_axi_AXILiteS_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WREADY" *) output s_axi_AXILiteS_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BRESP" *) output [1:0]s_axi_AXILiteS_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BVALID" *) output s_axi_AXILiteS_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BREADY" *) input s_axi_AXILiteS_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARADDR" *) input [5:0]s_axi_AXILiteS_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARVALID" *) input s_axi_AXILiteS_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARREADY" *) output s_axi_AXILiteS_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RDATA" *) output [31:0]s_axi_AXILiteS_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RRESP" *) output [1:0]s_axi_AXILiteS_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RVALID" *) output s_axi_AXILiteS_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_AXILiteS, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {AWVALID {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} AWREADY {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} WVALID {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} WREADY {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} BVALID {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} BREADY {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} BRESP {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} ARVALID {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ARREADY {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} RVALID {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} RREADY {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} RRESP {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} AWADDR {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} WDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} WSTRB {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 4} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} ARADDR {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 6} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} RDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input s_axi_AXILiteS_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_AXILiteS:rowptr_stream:output_stream_V, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {INTERRUPT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, PortWidth 1" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 output_size_loopback DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME output_size_loopback, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) output [31:0]output_size_loopback;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 offset_loopback DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME offset_loopback, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) output [31:0]offset_loopback;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rowptr_stream TVALID" *) input rowptr_stream_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rowptr_stream TREADY" *) output rowptr_stream_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rowptr_stream TDATA" *) input [31:0]rowptr_stream_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rowptr_stream TKEEP" *) input [3:0]rowptr_stream_TKEEP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 rowptr_stream TLAST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rowptr_stream, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000" *) input [0:0]rowptr_stream_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream_V TVALID" *) output output_stream_V_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream_V TREADY" *) input output_stream_V_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 output_stream_V TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME output_stream_V, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000" *) output [31:0]output_stream_V_TDATA;

  wire ap_clk;
  wire ap_rst_n;
  wire interrupt;
  wire [31:0]offset_loopback;
  wire offset_loopback_ap_vld;
  wire [31:0]output_size_loopback;
  wire output_size_loopback_ap_vld;
  wire [31:0]output_stream_V_TDATA;
  wire output_stream_V_TREADY;
  wire output_stream_V_TVALID;
  wire [31:0]rowptr_stream_TDATA;
  wire [3:0]rowptr_stream_TKEEP;
  wire [0:0]rowptr_stream_TLAST;
  wire rowptr_stream_TREADY;
  wire rowptr_stream_TVALID;
  wire [5:0]s_axi_AXILiteS_ARADDR;
  wire s_axi_AXILiteS_ARREADY;
  wire s_axi_AXILiteS_ARVALID;
  wire [5:0]s_axi_AXILiteS_AWADDR;
  wire s_axi_AXILiteS_AWREADY;
  wire s_axi_AXILiteS_AWVALID;
  wire s_axi_AXILiteS_BREADY;
  wire [1:0]s_axi_AXILiteS_BRESP;
  wire s_axi_AXILiteS_BVALID;
  wire [31:0]s_axi_AXILiteS_RDATA;
  wire s_axi_AXILiteS_RREADY;
  wire [1:0]s_axi_AXILiteS_RRESP;
  wire s_axi_AXILiteS_RVALID;
  wire [31:0]s_axi_AXILiteS_WDATA;
  wire s_axi_AXILiteS_WREADY;
  wire [3:0]s_axi_AXILiteS_WSTRB;
  wire s_axi_AXILiteS_WVALID;

  (* C_S_AXI_ADDR_WIDTH = "32" *) 
  (* C_S_AXI_AXILITES_ADDR_WIDTH = "6" *) 
  (* C_S_AXI_AXILITES_DATA_WIDTH = "32" *) 
  (* C_S_AXI_AXILITES_WSTRB_WIDTH = "4" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* C_S_AXI_WSTRB_WIDTH = "4" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_len_stream inst
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .interrupt(interrupt),
        .offset_loopback(offset_loopback),
        .offset_loopback_ap_vld(offset_loopback_ap_vld),
        .output_size_loopback(output_size_loopback),
        .output_size_loopback_ap_vld(output_size_loopback_ap_vld),
        .output_stream_V_TDATA(output_stream_V_TDATA),
        .output_stream_V_TREADY(output_stream_V_TREADY),
        .output_stream_V_TVALID(output_stream_V_TVALID),
        .rowptr_stream_TDATA(rowptr_stream_TDATA),
        .rowptr_stream_TKEEP(rowptr_stream_TKEEP),
        .rowptr_stream_TLAST(rowptr_stream_TLAST),
        .rowptr_stream_TREADY(rowptr_stream_TREADY),
        .rowptr_stream_TVALID(rowptr_stream_TVALID),
        .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
        .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
        .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
        .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
        .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),
        .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
        .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
        .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),
        .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
        .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
        .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
        .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),
        .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
        .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
        .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),
        .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
        .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_len_stream_AXILiteS_s_axi
   (ap_rst_n_inv,
    s_axi_AXILiteS_RVALID,
    s_axi_AXILiteS_ARREADY,
    out,
    ap_start,
    p_0_in,
    Q,
    \output_size_loopback_preg_reg[31] ,
    interrupt,
    \ap_return_preg_reg[0] ,
    s_axi_AXILiteS_RDATA,
    ap_clk,
    ap_sync_ready,
    s_axi_AXILiteS_RREADY,
    s_axi_AXILiteS_ARVALID,
    s_axi_AXILiteS_WSTRB,
    s_axi_AXILiteS_WVALID,
    s_axi_AXILiteS_ARADDR,
    ap_rst_n,
    s_axi_AXILiteS_WDATA,
    ap_sync_reg_Block_proc_U0_ap_ready,
    tmp_loc_channel_empty_n,
    \ap_CS_fsm_reg[2] ,
    s_axi_AXILiteS_BREADY,
    s_axi_AXILiteS_AWVALID,
    output_stream_V_1_ack_in,
    s_axi_AXILiteS_AWADDR,
    int_isr);
  output ap_rst_n_inv;
  output s_axi_AXILiteS_RVALID;
  output s_axi_AXILiteS_ARREADY;
  output [2:0]out;
  output ap_start;
  output p_0_in;
  output [31:0]Q;
  output [31:0]\output_size_loopback_preg_reg[31] ;
  output interrupt;
  output [0:0]\ap_return_preg_reg[0] ;
  output [31:0]s_axi_AXILiteS_RDATA;
  input ap_clk;
  input ap_sync_ready;
  input s_axi_AXILiteS_RREADY;
  input s_axi_AXILiteS_ARVALID;
  input [3:0]s_axi_AXILiteS_WSTRB;
  input s_axi_AXILiteS_WVALID;
  input [5:0]s_axi_AXILiteS_ARADDR;
  input ap_rst_n;
  input [31:0]s_axi_AXILiteS_WDATA;
  input ap_sync_reg_Block_proc_U0_ap_ready;
  input tmp_loc_channel_empty_n;
  input [1:0]\ap_CS_fsm_reg[2] ;
  input s_axi_AXILiteS_BREADY;
  input s_axi_AXILiteS_AWVALID;
  input output_stream_V_1_ack_in;
  input [5:0]s_axi_AXILiteS_AWADDR;
  input int_isr;

  wire \/FSM_onehot_wstate[1]_i_1_n_0 ;
  wire \/FSM_onehot_wstate[2]_i_1_n_0 ;
  wire \FSM_onehot_wstate[3]_i_1_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_wstate_reg_n_0_[0] ;
  wire [31:0]Q;
  wire [1:0]\ap_CS_fsm_reg[2] ;
  wire ap_clk;
  wire ap_idle;
  wire [0:0]\ap_return_preg_reg[0] ;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ap_start;
  wire ap_sync_ready;
  wire ap_sync_reg_Block_proc_U0_ap_ready;
  wire ar_hs;
  wire int_ap_done;
  wire int_ap_done_i_1_n_0;
  wire int_ap_done_i_2_n_0;
  wire int_ap_idle;
  wire int_ap_ready;
  wire int_ap_start1;
  wire int_ap_start_i_1_n_0;
  wire int_auto_restart;
  wire int_auto_restart_i_1_n_0;
  wire int_gie_i_1_n_0;
  wire int_gie_reg_n_0;
  wire \int_ier[0]_i_1_n_0 ;
  wire \int_ier[1]_i_1_n_0 ;
  wire \int_ier[1]_i_2_n_0 ;
  wire \int_ier_reg_n_0_[0] ;
  wire int_isr;
  wire int_isr6_out;
  wire \int_isr[0]_i_1_n_0 ;
  wire \int_isr[1]_i_1_n_0 ;
  wire \int_isr_reg_n_0_[0] ;
  wire [31:0]int_offset0;
  wire \int_offset[31]_i_1_n_0 ;
  wire [31:0]int_output_size0;
  wire \int_output_size[31]_i_1_n_0 ;
  wire [31:0]int_val_size0;
  wire \int_val_size[31]_i_1_n_0 ;
  wire \int_val_size[31]_i_3_n_0 ;
  wire \int_val_size_reg_n_0_[0] ;
  wire \int_val_size_reg_n_0_[10] ;
  wire \int_val_size_reg_n_0_[11] ;
  wire \int_val_size_reg_n_0_[12] ;
  wire \int_val_size_reg_n_0_[13] ;
  wire \int_val_size_reg_n_0_[14] ;
  wire \int_val_size_reg_n_0_[15] ;
  wire \int_val_size_reg_n_0_[16] ;
  wire \int_val_size_reg_n_0_[17] ;
  wire \int_val_size_reg_n_0_[18] ;
  wire \int_val_size_reg_n_0_[19] ;
  wire \int_val_size_reg_n_0_[1] ;
  wire \int_val_size_reg_n_0_[20] ;
  wire \int_val_size_reg_n_0_[21] ;
  wire \int_val_size_reg_n_0_[22] ;
  wire \int_val_size_reg_n_0_[23] ;
  wire \int_val_size_reg_n_0_[24] ;
  wire \int_val_size_reg_n_0_[25] ;
  wire \int_val_size_reg_n_0_[26] ;
  wire \int_val_size_reg_n_0_[27] ;
  wire \int_val_size_reg_n_0_[28] ;
  wire \int_val_size_reg_n_0_[29] ;
  wire \int_val_size_reg_n_0_[2] ;
  wire \int_val_size_reg_n_0_[30] ;
  wire \int_val_size_reg_n_0_[31] ;
  wire \int_val_size_reg_n_0_[3] ;
  wire \int_val_size_reg_n_0_[4] ;
  wire \int_val_size_reg_n_0_[5] ;
  wire \int_val_size_reg_n_0_[6] ;
  wire \int_val_size_reg_n_0_[7] ;
  wire \int_val_size_reg_n_0_[8] ;
  wire \int_val_size_reg_n_0_[9] ;
  wire interrupt;
  (* RTL_KEEP = "yes" *) wire [2:0]out;
  wire [31:0]\output_size_loopback_preg_reg[31] ;
  wire output_stream_V_1_ack_in;
  wire p_0_in;
  wire p_1_in;
  wire [7:0]rdata;
  wire \rdata[0]_i_2_n_0 ;
  wire \rdata[0]_i_3_n_0 ;
  wire \rdata[10]_i_1_n_0 ;
  wire \rdata[11]_i_1_n_0 ;
  wire \rdata[12]_i_1_n_0 ;
  wire \rdata[13]_i_1_n_0 ;
  wire \rdata[14]_i_1_n_0 ;
  wire \rdata[15]_i_1_n_0 ;
  wire \rdata[16]_i_1_n_0 ;
  wire \rdata[17]_i_1_n_0 ;
  wire \rdata[18]_i_1_n_0 ;
  wire \rdata[19]_i_1_n_0 ;
  wire \rdata[1]_i_2_n_0 ;
  wire \rdata[1]_i_3_n_0 ;
  wire \rdata[1]_i_4_n_0 ;
  wire \rdata[1]_i_5_n_0 ;
  wire \rdata[20]_i_1_n_0 ;
  wire \rdata[21]_i_1_n_0 ;
  wire \rdata[22]_i_1_n_0 ;
  wire \rdata[23]_i_1_n_0 ;
  wire \rdata[24]_i_1_n_0 ;
  wire \rdata[25]_i_1_n_0 ;
  wire \rdata[26]_i_1_n_0 ;
  wire \rdata[27]_i_1_n_0 ;
  wire \rdata[28]_i_1_n_0 ;
  wire \rdata[29]_i_1_n_0 ;
  wire \rdata[2]_i_2_n_0 ;
  wire \rdata[30]_i_1_n_0 ;
  wire \rdata[31]_i_1_n_0 ;
  wire \rdata[31]_i_3_n_0 ;
  wire \rdata[31]_i_4_n_0 ;
  wire \rdata[31]_i_5_n_0 ;
  wire \rdata[31]_i_6_n_0 ;
  wire \rdata[3]_i_2_n_0 ;
  wire \rdata[4]_i_1_n_0 ;
  wire \rdata[5]_i_1_n_0 ;
  wire \rdata[6]_i_1_n_0 ;
  wire \rdata[7]_i_2_n_0 ;
  wire \rdata[7]_i_3_n_0 ;
  wire \rdata[8]_i_1_n_0 ;
  wire \rdata[9]_i_1_n_0 ;
  wire [1:0]rstate;
  wire \rstate[0]_i_1_n_0 ;
  wire [5:0]s_axi_AXILiteS_ARADDR;
  wire s_axi_AXILiteS_ARREADY;
  wire s_axi_AXILiteS_ARVALID;
  wire [5:0]s_axi_AXILiteS_AWADDR;
  wire s_axi_AXILiteS_AWVALID;
  wire s_axi_AXILiteS_BREADY;
  wire [31:0]s_axi_AXILiteS_RDATA;
  wire s_axi_AXILiteS_RREADY;
  wire s_axi_AXILiteS_RVALID;
  wire [31:0]s_axi_AXILiteS_WDATA;
  wire [3:0]s_axi_AXILiteS_WSTRB;
  wire s_axi_AXILiteS_WVALID;
  wire tmp_loc_channel_empty_n;
  wire waddr;
  wire \waddr_reg_n_0_[0] ;
  wire \waddr_reg_n_0_[1] ;
  wire \waddr_reg_n_0_[2] ;
  wire \waddr_reg_n_0_[3] ;
  wire \waddr_reg_n_0_[4] ;
  wire \waddr_reg_n_0_[5] ;

  LUT5 #(
    .INIT(32'h000BFF0B)) 
    \/FSM_onehot_wstate[1]_i_1 
       (.I0(s_axi_AXILiteS_BREADY),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(s_axi_AXILiteS_AWVALID),
        .O(\/FSM_onehot_wstate[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88B8)) 
    \/FSM_onehot_wstate[2]_i_1 
       (.I0(s_axi_AXILiteS_AWVALID),
        .I1(out[0]),
        .I2(out[1]),
        .I3(s_axi_AXILiteS_WVALID),
        .O(\/FSM_onehot_wstate[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000F404)) 
    \FSM_onehot_wstate[3]_i_1 
       (.I0(s_axi_AXILiteS_BREADY),
        .I1(out[2]),
        .I2(out[1]),
        .I3(s_axi_AXILiteS_WVALID),
        .I4(out[0]),
        .O(\FSM_onehot_wstate[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRIDLE:0010,WRDATA:0100,WRRESP:1000,iSTATE:0001" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_wstate_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(1'b0),
        .Q(\FSM_onehot_wstate_reg_n_0_[0] ),
        .S(ap_rst_n_inv));
  (* FSM_ENCODED_STATES = "WRIDLE:0010,WRDATA:0100,WRRESP:1000,iSTATE:0001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\/FSM_onehot_wstate[1]_i_1_n_0 ),
        .Q(out[0]),
        .R(ap_rst_n_inv));
  (* FSM_ENCODED_STATES = "WRIDLE:0010,WRDATA:0100,WRRESP:1000,iSTATE:0001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\/FSM_onehot_wstate[2]_i_1_n_0 ),
        .Q(out[1]),
        .R(ap_rst_n_inv));
  (* FSM_ENCODED_STATES = "WRIDLE:0010,WRDATA:0100,WRRESP:1000,iSTATE:0001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[3]_i_1_n_0 ),
        .Q(out[2]),
        .R(ap_rst_n_inv));
  LUT1 #(
    .INIT(2'h1)) 
    \ap_return_preg[0]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [0]),
        .O(\ap_return_preg_reg[0] ));
  LUT5 #(
    .INIT(32'hF777F000)) 
    int_ap_done_i_1
       (.I0(ar_hs),
        .I1(int_ap_done_i_2_n_0),
        .I2(\ap_CS_fsm_reg[2] [1]),
        .I3(output_stream_V_1_ack_in),
        .I4(int_ap_done),
        .O(int_ap_done_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    int_ap_done_i_2
       (.I0(s_axi_AXILiteS_ARADDR[4]),
        .I1(s_axi_AXILiteS_ARADDR[5]),
        .I2(s_axi_AXILiteS_ARADDR[2]),
        .I3(s_axi_AXILiteS_ARADDR[3]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[1]),
        .O(int_ap_done_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_done_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_ap_done_i_1_n_0),
        .Q(int_ap_done),
        .R(ap_rst_n_inv));
  LUT4 #(
    .INIT(16'h0D00)) 
    int_ap_idle_i_1
       (.I0(ap_start),
        .I1(ap_sync_reg_Block_proc_U0_ap_ready),
        .I2(tmp_loc_channel_empty_n),
        .I3(\ap_CS_fsm_reg[2] [0]),
        .O(ap_idle));
  FDRE int_ap_idle_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_idle),
        .Q(int_ap_idle),
        .R(ap_rst_n_inv));
  FDRE int_ap_ready_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_sync_ready),
        .Q(int_ap_ready),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hFBBBF888)) 
    int_ap_start_i_1
       (.I0(int_auto_restart),
        .I1(ap_sync_ready),
        .I2(s_axi_AXILiteS_WDATA[0]),
        .I3(int_ap_start1),
        .I4(ap_start),
        .O(int_ap_start_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    int_ap_start_i_2
       (.I0(\waddr_reg_n_0_[3] ),
        .I1(\waddr_reg_n_0_[2] ),
        .I2(\waddr_reg_n_0_[5] ),
        .I3(\waddr_reg_n_0_[4] ),
        .I4(\int_val_size[31]_i_3_n_0 ),
        .I5(s_axi_AXILiteS_WSTRB[0]),
        .O(int_ap_start1));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_start_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_ap_start_i_1_n_0),
        .Q(ap_start),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    int_auto_restart_i_1
       (.I0(s_axi_AXILiteS_WDATA[7]),
        .I1(\waddr_reg_n_0_[3] ),
        .I2(\waddr_reg_n_0_[2] ),
        .I3(\int_ier[1]_i_2_n_0 ),
        .I4(int_auto_restart),
        .O(int_auto_restart_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    int_auto_restart_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_auto_restart_i_1_n_0),
        .Q(int_auto_restart),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    int_gie_i_1
       (.I0(s_axi_AXILiteS_WDATA[0]),
        .I1(\waddr_reg_n_0_[3] ),
        .I2(\waddr_reg_n_0_[2] ),
        .I3(\int_ier[1]_i_2_n_0 ),
        .I4(int_gie_reg_n_0),
        .O(int_gie_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    int_gie_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_gie_i_1_n_0),
        .Q(int_gie_reg_n_0),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \int_ier[0]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[0]),
        .I1(\waddr_reg_n_0_[2] ),
        .I2(\waddr_reg_n_0_[3] ),
        .I3(\int_ier[1]_i_2_n_0 ),
        .I4(\int_ier_reg_n_0_[0] ),
        .O(\int_ier[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \int_ier[1]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[1]),
        .I1(\waddr_reg_n_0_[2] ),
        .I2(\waddr_reg_n_0_[3] ),
        .I3(\int_ier[1]_i_2_n_0 ),
        .I4(p_0_in),
        .O(\int_ier[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \int_ier[1]_i_2 
       (.I0(s_axi_AXILiteS_WSTRB[0]),
        .I1(\int_val_size[31]_i_3_n_0 ),
        .I2(\waddr_reg_n_0_[4] ),
        .I3(\waddr_reg_n_0_[5] ),
        .O(\int_ier[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \int_ier_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_ier[0]_i_1_n_0 ),
        .Q(\int_ier_reg_n_0_[0] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ier_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_ier[1]_i_1_n_0 ),
        .Q(p_0_in),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'hF7777777F8888888)) 
    \int_isr[0]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[0]),
        .I1(int_isr6_out),
        .I2(output_stream_V_1_ack_in),
        .I3(\ap_CS_fsm_reg[2] [1]),
        .I4(\int_ier_reg_n_0_[0] ),
        .I5(\int_isr_reg_n_0_[0] ),
        .O(\int_isr[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \int_isr[0]_i_2 
       (.I0(\waddr_reg_n_0_[3] ),
        .I1(\waddr_reg_n_0_[2] ),
        .I2(\waddr_reg_n_0_[5] ),
        .I3(\waddr_reg_n_0_[4] ),
        .I4(\int_val_size[31]_i_3_n_0 ),
        .I5(s_axi_AXILiteS_WSTRB[0]),
        .O(int_isr6_out));
  LUT6 #(
    .INIT(64'hFFFF7FFFFFFF8000)) 
    \int_isr[1]_i_1 
       (.I0(s_axi_AXILiteS_WDATA[1]),
        .I1(\int_ier[1]_i_2_n_0 ),
        .I2(\waddr_reg_n_0_[2] ),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(int_isr),
        .I5(p_1_in),
        .O(\int_isr[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \int_isr_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_isr[0]_i_1_n_0 ),
        .Q(\int_isr_reg_n_0_[0] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_isr_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_isr[1]_i_1_n_0 ),
        .Q(p_1_in),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[0]_i_1 
       (.I0(Q[0]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[0]),
        .O(int_offset0[0]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[10]_i_1 
       (.I0(Q[10]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[10]),
        .O(int_offset0[10]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[11]_i_1 
       (.I0(Q[11]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[11]),
        .O(int_offset0[11]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[12]_i_1 
       (.I0(Q[12]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[12]),
        .O(int_offset0[12]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[13]_i_1 
       (.I0(Q[13]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[13]),
        .O(int_offset0[13]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[14]_i_1 
       (.I0(Q[14]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[14]),
        .O(int_offset0[14]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[15]_i_1 
       (.I0(Q[15]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[15]),
        .O(int_offset0[15]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[16]_i_1 
       (.I0(Q[16]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[16]),
        .O(int_offset0[16]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[17]_i_1 
       (.I0(Q[17]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[17]),
        .O(int_offset0[17]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[18]_i_1 
       (.I0(Q[18]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[18]),
        .O(int_offset0[18]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[19]_i_1 
       (.I0(Q[19]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[19]),
        .O(int_offset0[19]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[1]_i_1 
       (.I0(Q[1]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[1]),
        .O(int_offset0[1]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[20]_i_1 
       (.I0(Q[20]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[20]),
        .O(int_offset0[20]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[21]_i_1 
       (.I0(Q[21]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[21]),
        .O(int_offset0[21]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[22]_i_1 
       (.I0(Q[22]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[22]),
        .O(int_offset0[22]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[23]_i_1 
       (.I0(Q[23]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[23]),
        .O(int_offset0[23]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[24]_i_1 
       (.I0(Q[24]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[24]),
        .O(int_offset0[24]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[25]_i_1 
       (.I0(Q[25]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[25]),
        .O(int_offset0[25]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[26]_i_1 
       (.I0(Q[26]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[26]),
        .O(int_offset0[26]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[27]_i_1 
       (.I0(Q[27]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[27]),
        .O(int_offset0[27]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[28]_i_1 
       (.I0(Q[28]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[28]),
        .O(int_offset0[28]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[29]_i_1 
       (.I0(Q[29]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[29]),
        .O(int_offset0[29]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[2]_i_1 
       (.I0(Q[2]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[2]),
        .O(int_offset0[2]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[30]_i_1 
       (.I0(Q[30]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[30]),
        .O(int_offset0[30]));
  LUT5 #(
    .INIT(32'h00000002)) 
    \int_offset[31]_i_1 
       (.I0(\waddr_reg_n_0_[5] ),
        .I1(\waddr_reg_n_0_[4] ),
        .I2(\waddr_reg_n_0_[2] ),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(\int_val_size[31]_i_3_n_0 ),
        .O(\int_offset[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[31]_i_2 
       (.I0(Q[31]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[31]),
        .O(int_offset0[31]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[3]_i_1 
       (.I0(Q[3]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[3]),
        .O(int_offset0[3]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[4]_i_1 
       (.I0(Q[4]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[4]),
        .O(int_offset0[4]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[5]_i_1 
       (.I0(Q[5]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[5]),
        .O(int_offset0[5]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[6]_i_1 
       (.I0(Q[6]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[6]),
        .O(int_offset0[6]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[7]_i_1 
       (.I0(Q[7]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[7]),
        .O(int_offset0[7]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[8]_i_1 
       (.I0(Q[8]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[8]),
        .O(int_offset0[8]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_offset[9]_i_1 
       (.I0(Q[9]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[9]),
        .O(int_offset0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[0] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[0]),
        .Q(Q[0]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[10] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[10]),
        .Q(Q[10]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[11] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[11]),
        .Q(Q[11]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[12] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[12]),
        .Q(Q[12]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[13] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[13]),
        .Q(Q[13]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[14] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[14]),
        .Q(Q[14]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[15] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[15]),
        .Q(Q[15]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[16] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[16]),
        .Q(Q[16]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[17] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[17]),
        .Q(Q[17]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[18] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[18]),
        .Q(Q[18]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[19] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[19]),
        .Q(Q[19]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[1] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[1]),
        .Q(Q[1]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[20] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[20]),
        .Q(Q[20]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[21] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[21]),
        .Q(Q[21]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[22] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[22]),
        .Q(Q[22]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[23] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[23]),
        .Q(Q[23]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[24] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[24]),
        .Q(Q[24]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[25] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[25]),
        .Q(Q[25]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[26] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[26]),
        .Q(Q[26]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[27] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[27]),
        .Q(Q[27]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[28] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[28]),
        .Q(Q[28]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[29] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[29]),
        .Q(Q[29]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[2] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[2]),
        .Q(Q[2]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[30] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[30]),
        .Q(Q[30]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[31] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[31]),
        .Q(Q[31]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[3] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[3]),
        .Q(Q[3]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[4] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[4]),
        .Q(Q[4]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[5] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[5]),
        .Q(Q[5]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[6] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[6]),
        .Q(Q[6]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[7] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[7]),
        .Q(Q[7]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[8] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[8]),
        .Q(Q[8]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_offset_reg[9] 
       (.C(ap_clk),
        .CE(\int_offset[31]_i_1_n_0 ),
        .D(int_offset0[9]),
        .Q(Q[9]),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[0]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [0]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[0]),
        .O(int_output_size0[0]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[10]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [10]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[10]),
        .O(int_output_size0[10]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[11]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [11]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[11]),
        .O(int_output_size0[11]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[12]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [12]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[12]),
        .O(int_output_size0[12]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[13]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [13]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[13]),
        .O(int_output_size0[13]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[14]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [14]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[14]),
        .O(int_output_size0[14]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[15]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [15]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[15]),
        .O(int_output_size0[15]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[16]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [16]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[16]),
        .O(int_output_size0[16]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[17]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [17]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[17]),
        .O(int_output_size0[17]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[18]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [18]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[18]),
        .O(int_output_size0[18]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[19]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [19]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[19]),
        .O(int_output_size0[19]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[1]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [1]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[1]),
        .O(int_output_size0[1]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[20]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [20]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[20]),
        .O(int_output_size0[20]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[21]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [21]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[21]),
        .O(int_output_size0[21]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[22]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [22]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[22]),
        .O(int_output_size0[22]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[23]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [23]),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[23]),
        .O(int_output_size0[23]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[24]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [24]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[24]),
        .O(int_output_size0[24]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[25]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [25]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[25]),
        .O(int_output_size0[25]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[26]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [26]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[26]),
        .O(int_output_size0[26]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[27]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [27]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[27]),
        .O(int_output_size0[27]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[28]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [28]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[28]),
        .O(int_output_size0[28]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[29]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [29]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[29]),
        .O(int_output_size0[29]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[2]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [2]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[2]),
        .O(int_output_size0[2]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[30]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [30]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[30]),
        .O(int_output_size0[30]));
  LUT5 #(
    .INIT(32'h00000400)) 
    \int_output_size[31]_i_1 
       (.I0(\waddr_reg_n_0_[2] ),
        .I1(\waddr_reg_n_0_[3] ),
        .I2(\int_val_size[31]_i_3_n_0 ),
        .I3(\waddr_reg_n_0_[4] ),
        .I4(\waddr_reg_n_0_[5] ),
        .O(\int_output_size[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[31]_i_2 
       (.I0(\output_size_loopback_preg_reg[31] [31]),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[31]),
        .O(int_output_size0[31]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[3]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [3]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[3]),
        .O(int_output_size0[3]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[4]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [4]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[4]),
        .O(int_output_size0[4]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[5]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [5]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[5]),
        .O(int_output_size0[5]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[6]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [6]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[6]),
        .O(int_output_size0[6]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[7]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [7]),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[7]),
        .O(int_output_size0[7]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[8]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [8]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[8]),
        .O(int_output_size0[8]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_output_size[9]_i_1 
       (.I0(\output_size_loopback_preg_reg[31] [9]),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[9]),
        .O(int_output_size0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[0] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[0]),
        .Q(\output_size_loopback_preg_reg[31] [0]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[10] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[10]),
        .Q(\output_size_loopback_preg_reg[31] [10]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[11] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[11]),
        .Q(\output_size_loopback_preg_reg[31] [11]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[12] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[12]),
        .Q(\output_size_loopback_preg_reg[31] [12]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[13] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[13]),
        .Q(\output_size_loopback_preg_reg[31] [13]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[14] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[14]),
        .Q(\output_size_loopback_preg_reg[31] [14]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[15] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[15]),
        .Q(\output_size_loopback_preg_reg[31] [15]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[16] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[16]),
        .Q(\output_size_loopback_preg_reg[31] [16]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[17] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[17]),
        .Q(\output_size_loopback_preg_reg[31] [17]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[18] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[18]),
        .Q(\output_size_loopback_preg_reg[31] [18]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[19] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[19]),
        .Q(\output_size_loopback_preg_reg[31] [19]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[1] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[1]),
        .Q(\output_size_loopback_preg_reg[31] [1]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[20] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[20]),
        .Q(\output_size_loopback_preg_reg[31] [20]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[21] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[21]),
        .Q(\output_size_loopback_preg_reg[31] [21]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[22] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[22]),
        .Q(\output_size_loopback_preg_reg[31] [22]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[23] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[23]),
        .Q(\output_size_loopback_preg_reg[31] [23]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[24] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[24]),
        .Q(\output_size_loopback_preg_reg[31] [24]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[25] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[25]),
        .Q(\output_size_loopback_preg_reg[31] [25]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[26] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[26]),
        .Q(\output_size_loopback_preg_reg[31] [26]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[27] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[27]),
        .Q(\output_size_loopback_preg_reg[31] [27]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[28] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[28]),
        .Q(\output_size_loopback_preg_reg[31] [28]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[29] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[29]),
        .Q(\output_size_loopback_preg_reg[31] [29]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[2] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[2]),
        .Q(\output_size_loopback_preg_reg[31] [2]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[30] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[30]),
        .Q(\output_size_loopback_preg_reg[31] [30]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[31] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[31]),
        .Q(\output_size_loopback_preg_reg[31] [31]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[3] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[3]),
        .Q(\output_size_loopback_preg_reg[31] [3]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[4] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[4]),
        .Q(\output_size_loopback_preg_reg[31] [4]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[5] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[5]),
        .Q(\output_size_loopback_preg_reg[31] [5]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[6] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[6]),
        .Q(\output_size_loopback_preg_reg[31] [6]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[7] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[7]),
        .Q(\output_size_loopback_preg_reg[31] [7]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[8] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[8]),
        .Q(\output_size_loopback_preg_reg[31] [8]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_output_size_reg[9] 
       (.C(ap_clk),
        .CE(\int_output_size[31]_i_1_n_0 ),
        .D(int_output_size0[9]),
        .Q(\output_size_loopback_preg_reg[31] [9]),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[0]_i_1 
       (.I0(\int_val_size_reg_n_0_[0] ),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[0]),
        .O(int_val_size0[0]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[10]_i_1 
       (.I0(\int_val_size_reg_n_0_[10] ),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[10]),
        .O(int_val_size0[10]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[11]_i_1 
       (.I0(\int_val_size_reg_n_0_[11] ),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[11]),
        .O(int_val_size0[11]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[12]_i_1 
       (.I0(\int_val_size_reg_n_0_[12] ),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[12]),
        .O(int_val_size0[12]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[13]_i_1 
       (.I0(\int_val_size_reg_n_0_[13] ),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[13]),
        .O(int_val_size0[13]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[14]_i_1 
       (.I0(\int_val_size_reg_n_0_[14] ),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[14]),
        .O(int_val_size0[14]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[15]_i_1 
       (.I0(\int_val_size_reg_n_0_[15] ),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[15]),
        .O(int_val_size0[15]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[16]_i_1 
       (.I0(\int_val_size_reg_n_0_[16] ),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[16]),
        .O(int_val_size0[16]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[17]_i_1 
       (.I0(\int_val_size_reg_n_0_[17] ),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[17]),
        .O(int_val_size0[17]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[18]_i_1 
       (.I0(\int_val_size_reg_n_0_[18] ),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[18]),
        .O(int_val_size0[18]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[19]_i_1 
       (.I0(\int_val_size_reg_n_0_[19] ),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[19]),
        .O(int_val_size0[19]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[1]_i_1 
       (.I0(\int_val_size_reg_n_0_[1] ),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[1]),
        .O(int_val_size0[1]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[20]_i_1 
       (.I0(\int_val_size_reg_n_0_[20] ),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[20]),
        .O(int_val_size0[20]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[21]_i_1 
       (.I0(\int_val_size_reg_n_0_[21] ),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[21]),
        .O(int_val_size0[21]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[22]_i_1 
       (.I0(\int_val_size_reg_n_0_[22] ),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[22]),
        .O(int_val_size0[22]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[23]_i_1 
       (.I0(\int_val_size_reg_n_0_[23] ),
        .I1(s_axi_AXILiteS_WSTRB[2]),
        .I2(s_axi_AXILiteS_WDATA[23]),
        .O(int_val_size0[23]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[24]_i_1 
       (.I0(\int_val_size_reg_n_0_[24] ),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[24]),
        .O(int_val_size0[24]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[25]_i_1 
       (.I0(\int_val_size_reg_n_0_[25] ),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[25]),
        .O(int_val_size0[25]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[26]_i_1 
       (.I0(\int_val_size_reg_n_0_[26] ),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[26]),
        .O(int_val_size0[26]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[27]_i_1 
       (.I0(\int_val_size_reg_n_0_[27] ),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[27]),
        .O(int_val_size0[27]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[28]_i_1 
       (.I0(\int_val_size_reg_n_0_[28] ),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[28]),
        .O(int_val_size0[28]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[29]_i_1 
       (.I0(\int_val_size_reg_n_0_[29] ),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[29]),
        .O(int_val_size0[29]));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[2]_i_1 
       (.I0(\int_val_size_reg_n_0_[2] ),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[2]),
        .O(int_val_size0[2]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[30]_i_1 
       (.I0(\int_val_size_reg_n_0_[30] ),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[30]),
        .O(int_val_size0[30]));
  LUT5 #(
    .INIT(32'h00000100)) 
    \int_val_size[31]_i_1 
       (.I0(\waddr_reg_n_0_[3] ),
        .I1(\waddr_reg_n_0_[2] ),
        .I2(\int_val_size[31]_i_3_n_0 ),
        .I3(\waddr_reg_n_0_[4] ),
        .I4(\waddr_reg_n_0_[5] ),
        .O(\int_val_size[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[31]_i_2 
       (.I0(\int_val_size_reg_n_0_[31] ),
        .I1(s_axi_AXILiteS_WSTRB[3]),
        .I2(s_axi_AXILiteS_WDATA[31]),
        .O(int_val_size0[31]));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \int_val_size[31]_i_3 
       (.I0(\waddr_reg_n_0_[0] ),
        .I1(\waddr_reg_n_0_[1] ),
        .I2(s_axi_AXILiteS_WVALID),
        .I3(out[1]),
        .O(\int_val_size[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[3]_i_1 
       (.I0(\int_val_size_reg_n_0_[3] ),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[3]),
        .O(int_val_size0[3]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[4]_i_1 
       (.I0(\int_val_size_reg_n_0_[4] ),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[4]),
        .O(int_val_size0[4]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[5]_i_1 
       (.I0(\int_val_size_reg_n_0_[5] ),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[5]),
        .O(int_val_size0[5]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[6]_i_1 
       (.I0(\int_val_size_reg_n_0_[6] ),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[6]),
        .O(int_val_size0[6]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[7]_i_1 
       (.I0(\int_val_size_reg_n_0_[7] ),
        .I1(s_axi_AXILiteS_WSTRB[0]),
        .I2(s_axi_AXILiteS_WDATA[7]),
        .O(int_val_size0[7]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[8]_i_1 
       (.I0(\int_val_size_reg_n_0_[8] ),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[8]),
        .O(int_val_size0[8]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \int_val_size[9]_i_1 
       (.I0(\int_val_size_reg_n_0_[9] ),
        .I1(s_axi_AXILiteS_WSTRB[1]),
        .I2(s_axi_AXILiteS_WDATA[9]),
        .O(int_val_size0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[0] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[0]),
        .Q(\int_val_size_reg_n_0_[0] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[10] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[10]),
        .Q(\int_val_size_reg_n_0_[10] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[11] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[11]),
        .Q(\int_val_size_reg_n_0_[11] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[12] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[12]),
        .Q(\int_val_size_reg_n_0_[12] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[13] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[13]),
        .Q(\int_val_size_reg_n_0_[13] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[14] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[14]),
        .Q(\int_val_size_reg_n_0_[14] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[15] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[15]),
        .Q(\int_val_size_reg_n_0_[15] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[16] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[16]),
        .Q(\int_val_size_reg_n_0_[16] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[17] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[17]),
        .Q(\int_val_size_reg_n_0_[17] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[18] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[18]),
        .Q(\int_val_size_reg_n_0_[18] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[19] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[19]),
        .Q(\int_val_size_reg_n_0_[19] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[1] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[1]),
        .Q(\int_val_size_reg_n_0_[1] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[20] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[20]),
        .Q(\int_val_size_reg_n_0_[20] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[21] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[21]),
        .Q(\int_val_size_reg_n_0_[21] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[22] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[22]),
        .Q(\int_val_size_reg_n_0_[22] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[23] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[23]),
        .Q(\int_val_size_reg_n_0_[23] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[24] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[24]),
        .Q(\int_val_size_reg_n_0_[24] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[25] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[25]),
        .Q(\int_val_size_reg_n_0_[25] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[26] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[26]),
        .Q(\int_val_size_reg_n_0_[26] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[27] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[27]),
        .Q(\int_val_size_reg_n_0_[27] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[28] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[28]),
        .Q(\int_val_size_reg_n_0_[28] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[29] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[29]),
        .Q(\int_val_size_reg_n_0_[29] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[2] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[2]),
        .Q(\int_val_size_reg_n_0_[2] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[30] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[30]),
        .Q(\int_val_size_reg_n_0_[30] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[31] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[31]),
        .Q(\int_val_size_reg_n_0_[31] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[3] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[3]),
        .Q(\int_val_size_reg_n_0_[3] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[4] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[4]),
        .Q(\int_val_size_reg_n_0_[4] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[5] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[5]),
        .Q(\int_val_size_reg_n_0_[5] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[6] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[6]),
        .Q(\int_val_size_reg_n_0_[6] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[7] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[7]),
        .Q(\int_val_size_reg_n_0_[7] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[8] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[8]),
        .Q(\int_val_size_reg_n_0_[8] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_val_size_reg[9] 
       (.C(ap_clk),
        .CE(\int_val_size[31]_i_1_n_0 ),
        .D(int_val_size0[9]),
        .Q(\int_val_size_reg_n_0_[9] ),
        .R(ap_rst_n_inv));
  LUT3 #(
    .INIT(8'hE0)) 
    interrupt_INST_0
       (.I0(p_1_in),
        .I1(\int_isr_reg_n_0_[0] ),
        .I2(int_gie_reg_n_0),
        .O(interrupt));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \rdata[0]_i_2 
       (.I0(int_gie_reg_n_0),
        .I1(\int_isr_reg_n_0_[0] ),
        .I2(\rdata[1]_i_4_n_0 ),
        .I3(\rdata[1]_i_5_n_0 ),
        .I4(ap_start),
        .I5(\int_ier_reg_n_0_[0] ),
        .O(\rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[0]_i_3 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[0] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[0]),
        .I4(\output_size_loopback_preg_reg[31] [0]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[10]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[10] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[10]),
        .I4(\output_size_loopback_preg_reg[31] [10]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[11]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[11] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[11]),
        .I4(\output_size_loopback_preg_reg[31] [11]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[12]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[12] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[12]),
        .I4(\output_size_loopback_preg_reg[31] [12]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[13]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[13] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[13]),
        .I4(\output_size_loopback_preg_reg[31] [13]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[14]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[14] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[14]),
        .I4(\output_size_loopback_preg_reg[31] [14]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[15]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[15] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[15]),
        .I4(\output_size_loopback_preg_reg[31] [15]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[16]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[16] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[16]),
        .I4(\output_size_loopback_preg_reg[31] [16]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[17]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[17] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[17]),
        .I4(\output_size_loopback_preg_reg[31] [17]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[18]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[18] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[18]),
        .I4(\output_size_loopback_preg_reg[31] [18]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[19]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[19] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[19]),
        .I4(\output_size_loopback_preg_reg[31] [19]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFC0A0C0A)) 
    \rdata[1]_i_2 
       (.I0(int_ap_done),
        .I1(p_0_in),
        .I2(\rdata[1]_i_4_n_0 ),
        .I3(\rdata[1]_i_5_n_0 ),
        .I4(p_1_in),
        .O(\rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[1]_i_3 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[1] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[1]),
        .I4(\output_size_loopback_preg_reg[31] [1]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE8)) 
    \rdata[1]_i_4 
       (.I0(s_axi_AXILiteS_ARADDR[4]),
        .I1(s_axi_AXILiteS_ARADDR[5]),
        .I2(s_axi_AXILiteS_ARADDR[3]),
        .I3(s_axi_AXILiteS_ARADDR[2]),
        .I4(s_axi_AXILiteS_ARADDR[1]),
        .I5(s_axi_AXILiteS_ARADDR[0]),
        .O(\rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE2)) 
    \rdata[1]_i_5 
       (.I0(s_axi_AXILiteS_ARADDR[3]),
        .I1(s_axi_AXILiteS_ARADDR[4]),
        .I2(s_axi_AXILiteS_ARADDR[2]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .I5(s_axi_AXILiteS_ARADDR[5]),
        .O(\rdata[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[20]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[20] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[20]),
        .I4(\output_size_loopback_preg_reg[31] [20]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[21]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[21] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[21]),
        .I4(\output_size_loopback_preg_reg[31] [21]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[22]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[22] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[22]),
        .I4(\output_size_loopback_preg_reg[31] [22]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[23]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[23] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[23]),
        .I4(\output_size_loopback_preg_reg[31] [23]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[24]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[24] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[24]),
        .I4(\output_size_loopback_preg_reg[31] [24]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[25]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[25] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[25]),
        .I4(\output_size_loopback_preg_reg[31] [25]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[26]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[26] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[26]),
        .I4(\output_size_loopback_preg_reg[31] [26]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[27]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[27] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[27]),
        .I4(\output_size_loopback_preg_reg[31] [27]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[28]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[28] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[28]),
        .I4(\output_size_loopback_preg_reg[31] [28]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[29]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[29] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[29]),
        .I4(\output_size_loopback_preg_reg[31] [29]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[29]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \rdata[2]_i_1 
       (.I0(\rdata[2]_i_2_n_0 ),
        .I1(\rdata[31]_i_4_n_0 ),
        .I2(int_ap_idle),
        .I3(\rdata[7]_i_3_n_0 ),
        .O(rdata[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[2]_i_2 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[2] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[2]),
        .I4(\output_size_loopback_preg_reg[31] [2]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[30]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[30] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[30]),
        .I4(\output_size_loopback_preg_reg[31] [30]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \rdata[31]_i_1 
       (.I0(ar_hs),
        .I1(s_axi_AXILiteS_ARADDR[4]),
        .I2(s_axi_AXILiteS_ARADDR[5]),
        .I3(s_axi_AXILiteS_ARADDR[1]),
        .I4(s_axi_AXILiteS_ARADDR[0]),
        .O(\rdata[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \rdata[31]_i_2 
       (.I0(rstate[1]),
        .I1(rstate[0]),
        .I2(s_axi_AXILiteS_ARVALID),
        .O(ar_hs));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[31]_i_3 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[31] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[31]),
        .I4(\output_size_loopback_preg_reg[31] [31]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \rdata[31]_i_4 
       (.I0(s_axi_AXILiteS_ARADDR[0]),
        .I1(s_axi_AXILiteS_ARADDR[1]),
        .I2(s_axi_AXILiteS_ARADDR[2]),
        .I3(s_axi_AXILiteS_ARADDR[3]),
        .I4(s_axi_AXILiteS_ARADDR[5]),
        .O(\rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010100)) 
    \rdata[31]_i_5 
       (.I0(s_axi_AXILiteS_ARADDR[0]),
        .I1(s_axi_AXILiteS_ARADDR[1]),
        .I2(s_axi_AXILiteS_ARADDR[2]),
        .I3(s_axi_AXILiteS_ARADDR[3]),
        .I4(s_axi_AXILiteS_ARADDR[5]),
        .I5(s_axi_AXILiteS_ARADDR[4]),
        .O(\rdata[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000100)) 
    \rdata[31]_i_6 
       (.I0(s_axi_AXILiteS_ARADDR[5]),
        .I1(s_axi_AXILiteS_ARADDR[0]),
        .I2(s_axi_AXILiteS_ARADDR[1]),
        .I3(s_axi_AXILiteS_ARADDR[2]),
        .I4(s_axi_AXILiteS_ARADDR[4]),
        .I5(s_axi_AXILiteS_ARADDR[3]),
        .O(\rdata[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \rdata[3]_i_1 
       (.I0(\rdata[3]_i_2_n_0 ),
        .I1(\rdata[31]_i_4_n_0 ),
        .I2(int_ap_ready),
        .I3(\rdata[7]_i_3_n_0 ),
        .O(rdata[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[3]_i_2 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[3] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[3]),
        .I4(\output_size_loopback_preg_reg[31] [3]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[4]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[4] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[4]),
        .I4(\output_size_loopback_preg_reg[31] [4]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[5]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[5] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[5]),
        .I4(\output_size_loopback_preg_reg[31] [5]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[6]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[6] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[6]),
        .I4(\output_size_loopback_preg_reg[31] [6]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \rdata[7]_i_1 
       (.I0(\rdata[7]_i_2_n_0 ),
        .I1(\rdata[31]_i_4_n_0 ),
        .I2(int_auto_restart),
        .I3(\rdata[7]_i_3_n_0 ),
        .O(rdata[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[7]_i_2 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[7] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[7]),
        .I4(\output_size_loopback_preg_reg[31] [7]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rdata[7]_i_3 
       (.I0(s_axi_AXILiteS_ARADDR[0]),
        .I1(s_axi_AXILiteS_ARADDR[1]),
        .I2(s_axi_AXILiteS_ARADDR[5]),
        .I3(s_axi_AXILiteS_ARADDR[4]),
        .O(\rdata[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[8]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[8] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[8]),
        .I4(\output_size_loopback_preg_reg[31] [8]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[9]_i_1 
       (.I0(\rdata[31]_i_4_n_0 ),
        .I1(\int_val_size_reg_n_0_[9] ),
        .I2(\rdata[31]_i_5_n_0 ),
        .I3(Q[9]),
        .I4(\output_size_loopback_preg_reg[31] [9]),
        .I5(\rdata[31]_i_6_n_0 ),
        .O(\rdata[9]_i_1_n_0 ));
  FDRE \rdata_reg[0] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[0]),
        .Q(s_axi_AXILiteS_RDATA[0]),
        .R(1'b0));
  MUXF7 \rdata_reg[0]_i_1 
       (.I0(\rdata[0]_i_2_n_0 ),
        .I1(\rdata[0]_i_3_n_0 ),
        .O(rdata[0]),
        .S(\rdata[7]_i_3_n_0 ));
  FDRE \rdata_reg[10] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[10]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[10]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[11] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[11]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[11]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[12] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[12]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[12]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[13] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[13]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[13]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[14] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[14]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[14]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[15] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[15]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[15]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[16] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[16]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[16]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[17] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[17]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[17]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[18] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[18]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[18]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[19] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[19]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[19]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[1] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[1]),
        .Q(s_axi_AXILiteS_RDATA[1]),
        .R(1'b0));
  MUXF7 \rdata_reg[1]_i_1 
       (.I0(\rdata[1]_i_2_n_0 ),
        .I1(\rdata[1]_i_3_n_0 ),
        .O(rdata[1]),
        .S(\rdata[7]_i_3_n_0 ));
  FDRE \rdata_reg[20] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[20]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[20]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[21] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[21]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[21]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[22] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[22]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[22]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[23] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[23]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[23]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[24] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[24]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[24]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[25] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[25]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[25]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[26] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[26]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[26]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[27] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[27]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[27]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[28] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[28]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[28]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[29] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[29]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[29]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[2] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[2]),
        .Q(s_axi_AXILiteS_RDATA[2]),
        .R(1'b0));
  FDRE \rdata_reg[30] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[30]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[30]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[31] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[31]_i_3_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[31]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[3] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[3]),
        .Q(s_axi_AXILiteS_RDATA[3]),
        .R(1'b0));
  FDRE \rdata_reg[4] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[4]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[4]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[5] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[5]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[5]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[6] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[6]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[6]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[7] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[7]),
        .Q(s_axi_AXILiteS_RDATA[7]),
        .R(1'b0));
  FDRE \rdata_reg[8] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[8]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[8]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[9] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata[9]_i_1_n_0 ),
        .Q(s_axi_AXILiteS_RDATA[9]),
        .R(\rdata[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rowptr_stream_V_last_0_state[1]_i_1 
       (.I0(ap_rst_n),
        .O(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'h005C)) 
    \rstate[0]_i_1 
       (.I0(s_axi_AXILiteS_RREADY),
        .I1(s_axi_AXILiteS_ARVALID),
        .I2(rstate[0]),
        .I3(rstate[1]),
        .O(\rstate[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rstate_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\rstate[0]_i_1_n_0 ),
        .Q(rstate[0]),
        .R(ap_rst_n_inv));
  FDSE #(
    .INIT(1'b1)) 
    \rstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(1'b0),
        .Q(rstate[1]),
        .S(ap_rst_n_inv));
  LUT2 #(
    .INIT(4'h1)) 
    s_axi_AXILiteS_ARREADY_INST_0
       (.I0(rstate[1]),
        .I1(rstate[0]),
        .O(s_axi_AXILiteS_ARREADY));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_AXILiteS_RVALID_INST_0
       (.I0(rstate[0]),
        .I1(rstate[1]),
        .O(s_axi_AXILiteS_RVALID));
  LUT2 #(
    .INIT(4'h8)) 
    \waddr[5]_i_1 
       (.I0(out[0]),
        .I1(s_axi_AXILiteS_AWVALID),
        .O(waddr));
  FDRE \waddr_reg[0] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[0]),
        .Q(\waddr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \waddr_reg[1] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[1]),
        .Q(\waddr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \waddr_reg[2] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[2]),
        .Q(\waddr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \waddr_reg[3] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[3]),
        .Q(\waddr_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \waddr_reg[4] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[4]),
        .Q(\waddr_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \waddr_reg[5] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_AXILiteS_AWADDR[5]),
        .Q(\waddr_reg_n_0_[5] ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
