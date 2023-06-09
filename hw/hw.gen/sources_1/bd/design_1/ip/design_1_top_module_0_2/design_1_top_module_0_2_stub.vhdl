-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
-- Date        : Thu Jun  8 23:09:26 2023
-- Host        : arthur-G3-3579 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/arthur/gits/testecyrpto/hw/hw.gen/sources_1/bd/design_1/ip/design_1_top_module_0_2/design_1_top_module_0_2_stub.vhdl
-- Design      : design_1_top_module_0_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_top_module_0_2 is
  Port ( 
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    input_stream_TVALID : in STD_LOGIC;
    input_stream_TREADY : out STD_LOGIC;
    input_stream_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    input_stream_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    input_stream_TSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    input_stream_TUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TID : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TDEST : in STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TVALID : out STD_LOGIC;
    output_stream_TREADY : in STD_LOGIC;
    output_stream_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    output_stream_TKEEP : out STD_LOGIC_VECTOR ( 7 downto 0 );
    output_stream_TSTRB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    output_stream_TUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TID : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TDEST : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end design_1_top_module_0_2;

architecture stub of design_1_top_module_0_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_control_AWADDR[5:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[5:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,interrupt,input_stream_TVALID,input_stream_TREADY,input_stream_TDATA[63:0],input_stream_TKEEP[7:0],input_stream_TSTRB[7:0],input_stream_TUSER[0:0],input_stream_TLAST[0:0],input_stream_TID[0:0],input_stream_TDEST[0:0],output_stream_TVALID,output_stream_TREADY,output_stream_TDATA[63:0],output_stream_TKEEP[7:0],output_stream_TSTRB[7:0],output_stream_TUSER[0:0],output_stream_TLAST[0:0],output_stream_TID[0:0],output_stream_TDEST[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "top_module,Vivado 2023.1";
begin
end;
