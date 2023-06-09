# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/arthur/mapalogistico/sw/design_1_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/arthur/mapalogistico/sw/design_1_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {design_1_wrapper}\
-hw {/home/arthur/mapalogistico/hw/design_1_wrapper.xsa}\
-arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/arthur/mapalogistico/sw}

platform write
domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}
platform generate -domains 
platform active {design_1_wrapper}
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
platform generate -quick
bsp reload
bsp config stdin "psu_uart_1"
bsp config stdout "psu_uart_1"
bsp write
bsp reload
catch {bsp regenerate}
platform active {design_1_wrapper}
platform generate
bsp reload
bsp reload
platform generate
platform active {design_1_wrapper}
platform config -updatehw {/home/arthur/mapalogistico/hw/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/arthur/mapalogistico/hw/design_1_wrapper.xsa}
platform generate -domains 
domain active {zynqmp_fsbl}
bsp reload
platform active {design_1_wrapper}
platform config -updatehw {/home/arthur/mapalogistico/hw/design_1_wrapper.xsa}
platform generate -domains 
platform active {design_1_wrapper}
platform config -updatehw {/home/arthur/mapalogistico/hw/design_1_wrapper.xsa}
platform generate -domains 
platform active {design_1_wrapper}
platform config -updatehw {/home/arthur/mapalogistico/hw/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/arthur/mapalogistico/hw/design_1_wrapper.xsa}
platform generate -domains 
platform generate -domains 
