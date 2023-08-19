# Table of Contents

1. [_Zynq_ SoC Overview](#zynq-soc-overview)
   1. [_Xilinx_ Development Tools](#xilinx-development-tools)
2. [Build Cryptosystem Design](#build-cryptosystem-design)
   1. [Simulation Cryptosystem Design](#simulation-cryptosystem-design)
3. [The Cryptosystem](#the-cryptosystem)
   1. [HLS module](#hls-module)
   2. [Software application](#software-application)
4. [Results](#results)
5. [References](#references)
   1. [Contact](#contact)
   
## _Zynq_ SoC Overview 

_Zynq_ SoC is developed by _Xilinx_ and includes an FPGA and an ARM Cortex processor. The ARM-Host is able to communicate with the FPGA in several ways using the AXI communication protocol, including memory mapped transfers and stream bursts.

**Note:** The AXI interface is synthesized using FPGA resources.

There are many different products involving _Zynq_ SoC, including _Zynq 7000_, _Zynq Ultrascale MPSoC_,  _Zynq Ultrascale RFSoC_.  \[[1]\]

In this project, we used the development board _Kria KV260_ featuring a _Zynq Ultrascale+ MPSoC_ \[[2]\].

### _Xilinx_ Development Tools

_Xilinx_ offers various environments for rapid SoC product deployment. In this project, we have used _Vivado 2023.1_, _Vitis 2023.1_, and _Vitis HLS 2023.1_  \[[3]\].

_Vivado_ is the IDE responsible for configuring the SoC including programmable logic synthesis (this includes the part of the program that is shipped in the FPGA and also the AXI interface), basic ARM-Host setups, board GPIOs, and physical prototype constraints. In other terms, _Vivado_ builds a platform.

_Vitis HLS_ generates a programmable logic module for synthesis from a C/C++ program. _Xilinx_ offers many libraries for synthesis, known as _Vitis Libraries_ \[[4]\].

_Vitis_ is the IDE responsible for building the applications to run on the platform made in _Vivado_. This is where the ARM-Host is programmed, including everything in software.

## Build Cryptosystem Design

This project was built using _Xilinx Tools 2023.1_ on a _Ubuntu 22.04_ operating system. You are required to use a Linux system to correctly execute _Vitis Libraries_ \[[4]\].

Clone the repository with the `--recursive` directive. **This will download approximately 800 MB**

    ~$ git clone --recursive git@github.com:arthurmlima/cryptolmap.git

The next step is to synthesize the module containing _SHA256_, _Logistic Map_, and other data processing required before shipping to the processing system.

    ~$ vitis_hls -f cryptolmap/cryptolmap_hls/setup.tcl

This script finishes by exporting an RTL module to be inserted into a platform synthesized by _Vivado_. Run the next command:

    ~$ vivado -source cryptolmap/hw/buld.tcl

The platform will be automatically created using block automation, including all modules required to build the platform.

The rest of the application is launched in bare metal on a single core of ARM Cortex A53 Domain using _Vitis_. For this, please refer to the files provided at `cryptolmap/sw/src/`.

### Simulation Cryptosystem Design

In the `cryptolmap/cryptolmap_sim` directory, the sources used for all statistical tests made are available. _MATLAB R2021_\[[5]\] is used. It is also necessary to install the _gcc_ C/C++ toolchain to simulate the design.

The file `cryptolmap/cryptolmap_sim/main.m` issues the entire simulation, and the parameters concerning encryption schemes are configured in its header.

# The Cryptosystem

We have implemented an image encryption system based on the logistic map using HW/SW Co-design targeting the _Zynq Ultrascale+_ Kria KV260 development board.

A block design of the platform is as follows:

![design_SoC-1](https://user-images.githubusercontent.com/59630651/250668379-a5f49aa0-417e-431e-8d95-52f3b187560f.jpg)

* _Zynq_ block does not refer to the entire chip. It represents, in this block design, the ARM-Host alone. It has enabled one AXI master port and another AXI slave port.

* _AXI DMA_ is an IP block used to transmit information from ARM-Host DDR/FPGA bidirectionally using the AXI-Stream protocol. _AXI DMA_ should be able to execute without using ARM-Host resources.

* _AXI Peripheral_, _AXI SmartConnect_ are essentially multiplexers that assign the ARM-Host master or slave ports, respectively, to their proper endpoints.

* _Cryptolmap_ is the programmable logic synthesized from the C/C++ code using _Vitis HLS_.

The _ARM-Host_ is also configured to:

* Provide interrupts to _Cryptolmap_ module.
* Generate the initialization vectors (IVs) for the Logistic map using _Cryptolmap_.
* Configure the UART interface for debug.
* Configure the DDR for DMA and software application memory.

### HLS module

High-Level Synthesis is an advanced tool from _Xilinx_ that can convert a C/C++ algorithm into VHDL/Verilog code. 

In this project, the HLS code is responsible for the Logistic Map, _SHA256_ hash calculation, IV generation, and image encryption and decryption. 

### Software application

The software application was developed in C and runs on the ARM Cortex A53 cores of the _Zynq Ultrascale+ MPSoC_. The main operations it performs include:

* Image capture.
* Image encryption and decryption using the Logistic Map algorithm running on the FPGA.

This application makes use of the _Vitis Libraries_ \[[4]\] for the algorithm implementation.

# Results

This section is yet to be populated as the project is ongoing. Initial results show promising levels of security for image encryption with fast execution times due to the HW/SW co-design approach. 

# References

[1]: https://www.xilinx.com/products/silicon-devices/soc/zynq-ultrascale-mpsoc.html
[2]: https://www.xilinx.com/products/boards-and-kits/kria-kv260-vision-starter-kit.html
[3]: https://www.xilinx.com/products/design-tools/vivado.html
[4]: https://www.xilinx.com/products/design-tools/vitis/vitis-libraries.html
[5]: https://www.mathworks.com/products/matlab.html

### Contact 

For any further information or questions, you can reach me out at: [arthurmlima@examplemail.com](mailto:arthurmlima@examplemail.com)
