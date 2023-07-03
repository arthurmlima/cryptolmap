# cryptolmap
This repository contains the hardware/software codesign implementation of a modified logistic map suitable for image encryption


## _Zynq_ SoC Overview 

_Zynq_ SoC is developed by _Xilinx_ includes an FPGA and an ARM Cortex processor. The ARM-Host is able to communicate with the FPGA in several ways using AXI communication protocol, including memory mapped transfers and stream bursts.

**obs: The AXI interface is sinthesized using FPGA resources.

There are many different products involving _Zynq_ SoC, including _Zynq 7000_, _Zynq Ultrascale MPSoC_,  _Zynq Ultrascale RFSoC_.  

In this project we used the development board _ZCU104_ featuring a _Zynq Ultrascale+_ SoC.


### _Xilinx_ Development Tools
_Xilinx_ offers various enviroments for rapid SoC product deployment. In this project we have used  the _Vivado 2023.1_, _Vitis 2023.1_ and _Vitis HLS 2023.1_. 

_Vivado_ is the IDE responsible to configure the SoC including programmable logic synthesis (this includes the part of your program that is shipped in the FPGA and also AXI interface), basic ARM-Host setups, boards GPIOs, physical prototype constraints. In other terms, _Vivado_ builds a platform.

_Vitis HLS_ generates a programmable logic module for synthesis from C/C++ program. _Xilinx_ offers many libraries for synthesis _Vitis Libraries_. 

_Vitis_ is the IDE responsible to build the applications to run in the platform made in _Vivado_. This is where the ARM-Host is programmed including everything in software.



## Build design

This project was build using Xilinx Tools 2023.1 on a Ubuntu 22.04 operational system. You are required to use a Linux system to correctly execute [Vitis Libraries]{https://} 

Clone the repository with `--recursive` directive. **This will download approximatly 800 MB**

    ~$ git clone --recursive git@github.com:arthurmlima/cryptolmap.git

Next step is to sinthesize the module of containing _SHA256_, _Logistic Map_ and other data processing required before shipping to the processing system. 

    ~$ vitis_hls -f cryptolmap/cryptolmap_hls/setup.tcl

This script finishes by exporting a RTL module to be inserted in a platform sinthesized by _Vivado_. Run the next command

    ~$ vivado -source cryptolmap/hw/buld.tcl

The platform will be automatically created using a block automation including all modules required to build the platform.

The rest of the application is launched in baremetal a single core of ARM Cortex A53 Domain using the _Vitis_. For these, please refer to the files provided at `cryptolmap/sw/src/`


## The HLS module





### Falar dos componentes do SoC 
### Falar dos 
