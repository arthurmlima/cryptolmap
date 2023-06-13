# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/arthur/crypto/sw/app_system/_ide/scripts/debugger_app-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/arthur/crypto/sw/app_system/_ide/scripts/debugger_app-default.tcl
# 
connect -url tcp:127.0.0.1:3121
source /tools/Xilinx/Vitis/2022.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx HW-Z1-ZCU104 FT4232H 87066A" && level==0 && jtag_device_ctx=="jsn-HW-Z1-ZCU104 FT4232H-87066A-14730093-0"}
fpga -file /home/arthur/crypto/sw/app/_ide/bitstream/cryptolmap.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/arthur/crypto/sw/cryptolmap/export/cryptolmap/hw/cryptolmap.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/arthur/crypto/sw/cryptolmap/export/cryptolmap/sw/cryptolmap/boot/fsbl.elf
set bp_52_52_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_52_52_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/arthur/crypto/sw/app/Debug/app.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
