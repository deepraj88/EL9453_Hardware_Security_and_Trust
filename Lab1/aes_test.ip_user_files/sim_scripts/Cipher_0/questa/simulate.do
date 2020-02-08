onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Cipher_0_opt

do {wave.do}

view wave
view structure
view signals

do {Cipher_0.udo}

run -all

quit -force
