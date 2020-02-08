vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/hdl/verilog/AddRoundKey.v" \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/hdl/verilog/SubBytes.v" \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/hdl/verilog/SubBytes_sbox.v" \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/hdl/verilog/Cipher.v" \
"../../../../aes_test.srcs/sources_1/ip/Cipher_0/sim/Cipher_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

