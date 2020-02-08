// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (lin64) Build 2018833 Wed Oct  4 19:58:07 MDT 2017
// Date        : Fri Jul 26 17:50:00 2019
// Host        : deepraj-Aurora-R4 running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /media/deepraj/Work/workspace/Lecture/Hardwar_security/homework/tiny-AES-c/aes_test/aes_test.srcs/sources_1/ip/Cipher_0/Cipher_0_stub.v
// Design      : Cipher_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Cipher,Vivado 2017.3" *)
module Cipher_0(ap_clk, ap_rst, ap_start, ap_done, ap_idle, 
  ap_ready, state_address0, state_ce0, state_we0, state_d0, state_q0, state_address1, state_ce1, 
  state_we1, state_d1, state_q1, RoundKey_address0, RoundKey_ce0, RoundKey_q0)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,state_address0[3:0],state_ce0,state_we0,state_d0[7:0],state_q0[7:0],state_address1[3:0],state_ce1,state_we1,state_d1[7:0],state_q1[7:0],RoundKey_address0[7:0],RoundKey_ce0,RoundKey_q0[7:0]" */;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [3:0]state_address0;
  output state_ce0;
  output state_we0;
  output [7:0]state_d0;
  input [7:0]state_q0;
  output [3:0]state_address1;
  output state_ce1;
  output state_we1;
  output [7:0]state_d1;
  input [7:0]state_q1;
  output [7:0]RoundKey_address0;
  output RoundKey_ce0;
  input [7:0]RoundKey_q0;
endmodule
