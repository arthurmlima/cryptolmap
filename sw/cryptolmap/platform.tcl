# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/arthur/crypto/sw/cryptolmap/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/arthur/crypto/sw/cryptolmap/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {cryptolmap}\
-hw {/home/arthur/crypto/hw/cryptolmap.xsa}\
-arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/arthur/crypto/sw}

platform write
domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}
platform generate -domains 
platform active {cryptolmap}
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
platform generate -quick
platform generate
