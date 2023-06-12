# script.tcl
puts "First argument: $argv"
set scriptPath [file dirname [info script]]
puts "Present location: $scriptPath"


create_project hw $scriptPath -part xczu7ev-ffvc1156-2-e
set_property board_part xilinx.com:zcu104:part0:1.1 [current_project]
import_files -fileset constrs_1 -force -norecurse $scriptPath/xdc/zcu104.xdc
create_bd_design "design_1"
update_compile_order -fileset sources_1
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.4 zynq_ultra_ps_e_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1" }  [get_bd_cells zynq_ultra_ps_e_0]
set_property CONFIG.PSU__USE__S_AXI_GP0 {1} [get_bd_cells zynq_ultra_ps_e_0]
set_property  ip_repo_paths $scriptPath/ip_repo [current_project]
update_ip_catalog
update_ip_catalog -rebuild
set_property dataflow_viewer_settings "min_width=16"   [current_fileset]
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:top_module:1.0 top_module_0
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
endgroup
set_property location {3 1150 -750} [get_bd_cells axi_dma_0]
set_property location {2 1218 -1150} [get_bd_cells top_module_0]
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_FPD} Slave {/axi_dma_0/S_AXI_LITE} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_FPD} Slave {/top_module_0/s_axi_control} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins top_module_0/s_axi_control]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/axi_dma_0/M_AXI_MM2S} Slave {/zynq_ultra_ps_e_0/S_AXI_HPC0_FPD} ddr_seg {Auto} intc_ip {New AXI SmartConnect} master_apm {0}}  [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HPC0_FPD]
endgroup
startgroup
set_property -dict [list \
  CONFIG.c_include_mm2s_dre {1} \
  CONFIG.c_include_s2mm_dre {1} \
  CONFIG.c_include_sg {0} \
  CONFIG.c_sg_length_width {26} \
] [get_bd_cells axi_dma_0]
endgroup
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins top_module_0/input_stream]
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM] [get_bd_intf_pins top_module_0/output_stream]
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/zynq_ultra_ps_e_0/pl_clk0 (100 MHz)} Clk_xbar {/zynq_ultra_ps_e_0/pl_clk0 (100 MHz)} Master {/axi_dma_0/M_AXI_S2MM} Slave {/zynq_ultra_ps_e_0/S_AXI_HPC0_FPD} ddr_seg {Auto} intc_ip {/axi_smc} master_apm {0}}  [get_bd_intf_pins axi_dma_0/M_AXI_S2MM]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/zynq_ultra_ps_e_0/pl_clk0 (100 MHz)} Clk_xbar {/zynq_ultra_ps_e_0/pl_clk0 (100 MHz)} Master {/zynq_ultra_ps_e_0/M_AXI_HPM1_FPD} Slave {/axi_dma_0/S_AXI_LITE} ddr_seg {Auto} intc_ip {/ps8_0_axi_periph} master_apm {0}}  [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM1_FPD]
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup
set_property location {2 577 -585} [get_bd_cells xlconcat_0]
connect_bd_net [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]

startgroup
set_property -dict [list CONFIG.c_m_axi_s2mm_data_width.VALUE_SRC PROPAGATED CONFIG.c_s_axis_s2mm_tdata_width.VALUE_SRC PROPAGATED] [get_bd_cells axi_dma_0]
set_property -dict [list \
  CONFIG.c_include_mm2s {1} \
  CONFIG.c_include_mm2s_dre {1} \
  CONFIG.c_include_s2mm {1} \
  CONFIG.c_include_s2mm_dre {1} \
  CONFIG.c_m_axi_mm2s_data_width {64} \
  CONFIG.c_m_axis_mm2s_tdata_width {64} \
] [get_bd_cells axi_dma_0]
endgroup
validate_bd_design

startgroup
set_property CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {70} [get_bd_cells zynq_ultra_ps_e_0]
endgroup

update_compile_order -fileset sources_1
make_wrapper -files [get_files $scriptPath/hw.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse $scriptPath/hw.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
regenerate_bd_layout
save_bd_design
update_compile_order -fileset sources_1

set output [exec nproc]

launch_runs impl_1 -to_step write_bitstream -jobs $output
