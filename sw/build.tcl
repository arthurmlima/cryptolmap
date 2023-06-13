# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/arthur/crypto/sw/cryptolmap/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/arthur/crypto/sw/cryptolmap/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

#puts "First argument: $argv"
#set scriptPath [file dirname [info script]]
#puts "Present location: $scriptPath"
#cd $scriptPath
#platform create -name {cryptolmap}\
#-hw { ../hw/cryptolmap.xsa}\
#-arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {.}

#platform write
#domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}
#platform generate -domains 
#platform active {cryptolmap}
#domain active {zynqmp_fsbl}
#domain active {zynqmp_pmufw}
#domain active {standalone_psu_cortexa53_0}
#platform generate -quick
#app create -name hello_world -template "Hello World" -platform cryptolmap -proc psu_cortexa53_0 -os standalone

init:
	xsct -eval "setws $(ws); \
		platform create -name $(plat_name) -hw $(xsa); \
		domain create -name $(domain_name_apu) -os standalone -proc psu_cortexa53_0; \
		app create -name $(app_name_apu) -platform $(plat_name) -domain $(domain_name_apu) -os standalone -template {Hello World}; \
		platform active $(plat_name); \
		platform generate; \
		app build $(app_name_apu); \
