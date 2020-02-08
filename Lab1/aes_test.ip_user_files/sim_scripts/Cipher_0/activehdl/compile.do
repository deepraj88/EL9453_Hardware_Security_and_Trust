vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/hdl/verilog/AddRoundKey.v" \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/hdl/verilog/SubBytes.v" \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/hdl/verilog/SubBytes_sbox.v" \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/hdl/verilog/Cipher.v" \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/sim/Cipher_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

