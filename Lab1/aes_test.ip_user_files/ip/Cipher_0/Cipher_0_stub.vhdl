-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (lin64) Build 2018833 Wed Oct  4 19:58:07 MDT 2017
-- Date        : Fri Jul 26 17:50:00 2019
-- Host        : deepraj-Aurora-R4 running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /media/deepraj/Work/workspace/Lecture/Hardwar_security/homework/tiny-AES-c/aes_test/aes_test.srcs/sources_1/ip/Cipher_0/Cipher_0_stub.vhdl
-- Design      : Cipher_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Cipher_0 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    state_address0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    state_ce0 : out STD_LOGIC;
    state_we0 : out STD_LOGIC;
    state_d0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    state_q0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    state_address1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    state_ce1 : out STD_LOGIC;
    state_we1 : out STD_LOGIC;
    state_d1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    state_q1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RoundKey_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    RoundKey_ce0 : out STD_LOGIC;
    RoundKey_q0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end Cipher_0;

architecture stub of Cipher_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,state_address0[3:0],state_ce0,state_we0,state_d0[7:0],state_q0[7:0],state_address1[3:0],state_ce1,state_we1,state_d1[7:0],state_q1[7:0],RoundKey_address0[7:0],RoundKey_ce0,RoundKey_q0[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Cipher,Vivado 2017.3";
begin
end;
