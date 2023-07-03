# cryptolmap
This repository contains the hardware/software codesign implementation of a modified logistic map suitable for image encryption

## Build design
This project was build using Xilinx Tools 2023.1 on a Ubuntu 22.04 operational system. You are required to use a Linux system to correctly execute [Vitis Libraries]{https://}

Clone the repository with `--recursive` directive. **This will download approximatly 800 MB**

    ~$ git clone --recursive git@github.com:arthurmlima/cryptolmap.git

Next step is to sinthesize the module of containing _SHA256_, _Logistic Map_ and other data processing required before shipping to the processing system. 

    ~$ vitis_hls -f cryptolmap/cryptolmap_hls/setup.tcl

This script finishes by exporting a RTL module to be sinthesized by another Xilinx Tool, _Vivado_, which is responsible for synthesis and implementation of the overall SoC. But this comes in a different script in another directory. 

    ~$vivado -source hw/buld.tcl

It will create a block diagram of every module required deploy the configurable hardware in a Zynq device.

The remaining of the application is launched in baremetal ARM Cortex A53 Domain using the _Vitis_ IDE. For these, please refer to the files provided at `cryptolmap/sw/src/`


## The HLS module

The _Vitis HLS_ provides the synthesis of C/C++ program algorithms in custom hardware. As functions which communicates to the out-side world using the AXI protocol. 

### Falar dos componentes do SoC 
### Falar dos 
