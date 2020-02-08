// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:Cipher:1.0
// IP Revision: 2

(* X_CORE_INFO = "Cipher,Vivado 2017.3" *)
(* CHECK_LICENSE_TYPE = "Cipher_0,Cipher,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Cipher_0 (
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  state_address0,
  state_ce0,
  state_we0,
  state_d0,
  state_q0,
  state_address1,
  state_ce1,
  state_we1,
  state_d1,
  state_q1,
  RoundKey_address0,
  RoundKey_ce0,
  RoundKey_q0
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *)
input wire ap_rst;
input wire ap_start;
output wire ap_done;
output wire ap_idle;
output wire ap_ready;
output wire [3 : 0] state_address0;
output wire state_ce0;
output wire state_we0;
output wire [7 : 0] state_d0;
input wire [7 : 0] state_q0;
output wire [3 : 0] state_address1;
output wire state_ce1;
output wire state_we1;
output wire [7 : 0] state_d1;
input wire [7 : 0] state_q1;
output wire [7 : 0] RoundKey_address0;
output wire RoundKey_ce0;
input wire [7 : 0] RoundKey_q0;

  Cipher #(
    .ap_ST_fsm_state1(36'H000000001),
    .ap_ST_fsm_state2(36'H000000002),
    .ap_ST_fsm_state3(36'H000000004),
    .ap_ST_fsm_state4(36'H000000008),
    .ap_ST_fsm_state5(36'H000000010),
    .ap_ST_fsm_state6(36'H000000020),
    .ap_ST_fsm_state7(36'H000000040),
    .ap_ST_fsm_state8(36'H000000080),
    .ap_ST_fsm_state9(36'H000000100),
    .ap_ST_fsm_state10(36'H000000200),
    .ap_ST_fsm_state11(36'H000000400),
    .ap_ST_fsm_state12(36'H000000800),
    .ap_ST_fsm_state13(36'H000001000),
    .ap_ST_fsm_state14(36'H000002000),
    .ap_ST_fsm_state15(36'H000004000),
    .ap_ST_fsm_state16(36'H000008000),
    .ap_ST_fsm_state17(36'H000010000),
    .ap_ST_fsm_state18(36'H000020000),
    .ap_ST_fsm_state19(36'H000040000),
    .ap_ST_fsm_state20(36'H000080000),
    .ap_ST_fsm_state21(36'H000100000),
    .ap_ST_fsm_state22(36'H000200000),
    .ap_ST_fsm_state23(36'H000400000),
    .ap_ST_fsm_state24(36'H000800000),
    .ap_ST_fsm_state25(36'H001000000),
    .ap_ST_fsm_state26(36'H002000000),
    .ap_ST_fsm_state27(36'H004000000),
    .ap_ST_fsm_state28(36'H008000000),
    .ap_ST_fsm_state29(36'H010000000),
    .ap_ST_fsm_state30(36'H020000000),
    .ap_ST_fsm_state31(36'H040000000),
    .ap_ST_fsm_state32(36'H080000000),
    .ap_ST_fsm_state33(36'H100000000),
    .ap_ST_fsm_state34(36'H200000000),
    .ap_ST_fsm_state35(36'H400000000),
    .ap_ST_fsm_state36(36'H800000000)
  ) inst (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .state_address0(state_address0),
    .state_ce0(state_ce0),
    .state_we0(state_we0),
    .state_d0(state_d0),
    .state_q0(state_q0),
    .state_address1(state_address1),
    .state_ce1(state_ce1),
    .state_we1(state_we1),
    .state_d1(state_d1),
    .state_q1(state_q1),
    .RoundKey_address0(RoundKey_address0),
    .RoundKey_ce0(RoundKey_ce0),
    .RoundKey_q0(RoundKey_q0)
  );
endmodule
