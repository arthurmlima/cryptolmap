# Cryptolmap
This repository contains the hardware/software codesign implementation of a modified logistic map suitable for image encryption


## _Zynq_ SoC Overview 

_Zynq_ SoC is developed by _Xilinx_ includes an FPGA and an ARM Cortex processor. The ARM-Host is able to communicate with the FPGA in several ways using AXI communication protocol, including memory mapped transfers and stream bursts.

** obs: The AXI interface is sinthesized using FPGA resources.

There are many different products involving _Zynq_ SoC, including _Zynq 7000_, _Zynq Ultrascale MPSoC_,  _Zynq Ultrascale RFSoC_.  

In this project we used the development board _ZCU104_ featuring a _Zynq Ultrascale+_ SoC.


### _Xilinx_ Development Tools
_Xilinx_ offers various enviroments for rapid SoC product deployment. In this project we have used  the _Vivado 2023.1_, _Vitis 2023.1_ and _Vitis HLS 2023.1_. 

_Vivado_ is the IDE responsible to configure the SoC including programmable logic synthesis (this includes the part of the program that is shipped in the FPGA and also the AXI interface), basic ARM-Host setups, boards GPIOs, physical prototype constraints. In other terms, _Vivado_ builds a platform.

_Vitis HLS_ generates a programmable logic module for synthesis from C/C++ program. _Xilinx_ offers many libraries for synthesis _Vitis Libraries_. 

_Vitis_ is the IDE responsible to build the applications to run on the platform made in _Vivado_. This is where the ARM-Host is programmed including everything in software.



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


# The Cryptosystem

We have implemented an image encryption system based on the logistic map using HW/SW Co-design targetting _Zynq Ultrascale+_ zcu104 development board.

A block design of the platform is the following:

![design_SoC-1](https://user-images.githubusercontent.com/59630651/250668379-a5f49aa0-417e-431e-8d95-52f3b187560f.jpg)

* _Zynq_ block does not refer to the entire chip. It represents, in this block design, the ARM-Host alone. It has enabled one Axi Master port and another Axi Slave port. 

* _Axi DMA_ is an IP block used to transmit information ARM-Host DDR/FPGA bidirectionally using AXI-Stream protocol. _Axi DMA_ should be able to execute without using ARM-Host resources 

* _Axi Perirh_, _Axi SmartConnect_ are essentially multiplexers that assign the ARM-Host Master or Slave ports, respectevily, to their corresponding inputs/outputs

* _Processor System Reset_ is default for handling resets of peripherals

* _System ILA_ _ILA_ stands for _Integrated Logic Analizer_, this is the debug interface, the _ila\_0_ and _ila\_1_ are used to see AXI-Stream ports of _top\_module_

* _top\_module_ is the HLS module which is the part of the code we chose to be implemented in hardware. It is best described in the following section.

* _concat_ is a simple bit concatenation of the interrupts signals of _Axi DMA_.

* _Axi Timer_ is conventional timer which is executed at the same FPGA frequency. Used for profile results.







## HLS module 


The part of the algorithm in programmable logic consists of: hash sha256, logistic map dedicated to diffusion and the data treatment to encrypt the plain-image and generate the cipher-image.


The following header is the main function.

```
void top_module(
   in_stream &input_stream,
   out_stream &output_stream,
   int u_dt,
   int u_diff,
   float &m_perm);
```

`input_stream` refers to the image transfer and it is implemented in a dedicated slave port using AXI-Stream protocol. It reads the memory from AXI DMA. `output_stream` refers to the cipher image transfer back to the ARM-Host and it is implemented in a dedicated AXI-Stream master port.

`u_dt` is the iterations discarded. `u_diff` is the diffusion parameter of logistic map: $x_{n+1}=rx_{n}(x_{n} + 1)$. $r$ is `u_diff`. `m_perm` is the permutation key extracted from hash _SHA256_ of image that must be informed to the ARM-Host. These ports are implemented using memory mapped interface AXI-Lite that is present in any module from _Vitis HLS_.


### Image receive transmission. 
The HLS module initiates by reading the AXI-Stream channel the image data shipped in 8 bits/pixel. This design use 64 bits width, therefore the module reads 32768 times the input, considering 512x512 8 bits/pixel image.

### _SHA256_ 

This is an open-source implementation provided by _Xilinx_ at _Vitis Libraries_. Punctual changes were made for dimensioning the buffers to avoid deadlocks regarding width stream to match the image size, so please for this block, refer to the forked repository of _Vitis Libraries_. 

For further comprehension regarding this block, refer to official documentationby for their security library. 

### Logistic Map for diffusion 

It reads the value provided from _SHA256_ as initial condition, performs the logistic map calculations and encrypt the image. The output of `top_module` is tied this function output which drives the AXI-Stream master port of HLS module.


### Dataflow  

![design_SoC](https://user-images.githubusercontent.com/59630651/250720886-bce96b92-7acb-4625-8983-63fa126d1d62.png)



# References












# Results 

|   | LUT   | Slice | Ratio      |
|---|-------|-------|------------|
| LUTRAM | 38931 | 101760 | 38.257664 |
| FF    | 23367 | 460800 | 5.0709634 |
| BRAM  | 76    | 312    | 24.358974 |
| DSP   | 96    | 1728   | 5.555556  |
| BUFG  | 4     | 544    | 0.7352941 |



| Parameter                  | Value         |
|----------------------------|---------------|
| Total On-Chip Power (W)    | 3.696         |
| Power Budget Margin (W)    | NA            |
| Dynamic (W)                | 3.001         |
| Device Static (W)          | 0.694         |
| Effective TJA (C/W)        | 1.0           |
| Max Ambient (C)            | 96.4          |
| Junction Temperature (C)   | 28.6          |
| Confidence Level           | Medium        |

### Falar dos 





