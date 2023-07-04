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
   2. 
## _Zynq_ SoC Overview 

_Zynq_ SoC is developed by _Xilinx_ includes an FPGA and an ARM Cortex processor . The ARM-Host is able to communicate with the FPGA in several ways using AXI communication protocol, including memory mapped transfers and stream bursts.

** obs: The AXI interface is sinthesized using FPGA resources.

There are many different products involving _Zynq_ SoC, including _Zynq 7000_, _Zynq Ultrascale MPSoC_,  _Zynq Ultrascale RFSoC_.  \[[1]\]

In this project we used the development board _ZCU104_ featuring a _Zynq Ultrascale+ MPSoC_ \[[2]\].


### _Xilinx_ Development Tools
_Xilinx_ offers various enviroments for rapid SoC product deployment. In this project we have used  the _Vivado 2023.1_, _Vitis 2023.1_ and _Vitis HLS 2023.1_  \[[3]\].

_Vivado_ is the IDE responsible to configure the SoC including programmable logic synthesis (this includes the part of the program that is shipped in the FPGA and also the AXI interface), basic ARM-Host setups, boards GPIOs, physical prototype constraints. In other terms, _Vivado_ builds a platform.

_Vitis HLS_ generates a programmable logic module for synthesis from C/C++ program. _Xilinx_ offers many libraries for synthesis _Vitis Libraries_ \[[4]\].. 

_Vitis_ is the IDE responsible to build the applications to run on the platform made in _Vivado_. This is where the ARM-Host is programmed including everything in software.



## Build Cryptosystem Design

This project was build using _Xilinx Tools 2023.1_ on a _Ubuntu 22.04_ operational system. You are required to use a Linux system to correctly execute _Vitis Libraries_ \[[4]\]. 

Clone the repository with `--recursive` directive. **This will download approximatly 800 MB**

    ~$ git clone --recursive git@github.com:arthurmlima/cryptolmap.git

Next step is to sinthesize the module of containing _SHA256_, _Logistic Map_ and other data processing required before shipping to the processing system. 

    ~$ vitis_hls -f cryptolmap/cryptolmap_hls/setup.tcl

This script finishes by exporting a RTL module to be inserted in a platform sinthesized by _Vivado_. Run the next command

    ~$ vivado -source cryptolmap/hw/buld.tcl

The platform will be automatically created using a block automation including all modules required to build the platform.

The rest of the application is launched in baremetal a single core of ARM Cortex A53 Domain using the _Vitis_. For these, please refer to the files provided at `cryptolmap/sw/src/`

### Simulation Cryptosystem Design

In `cryptolmap/cryptolmap_sim` directory, the sources used for all statistical tests made are available. It is used _MATLAB R2021_\[[5]\]. It is also necessary to install _gcc_ C/C++ toolchain to simulate the design.

The file `cryptolmap/cryptolmap_sim/main.m` issues the entire simulation, the parameters concerning encryption schemes are configured in its header. 


# The Cryptosystem

We have implemented an image encryption system based on the logistic map using HW/SW Co-design targetting _Zynq Ultrascale+_ zcu104 development board.

A block design of the platform is the following:

![design_SoC-1](https://user-images.githubusercontent.com/59630651/250668379-a5f49aa0-417e-431e-8d95-52f3b187560f.jpg)

* _Zynq_ block does not refer to the entire chip. It represents, in this block design, the ARM-Host alone. It has enabled one AXI master port and another AXI slave port. 

* _AXI DMA_ is an IP block used to transmit information ARM-Host DDR/FPGA bidirectionally using AXI-Stream protocol. _AXI DMA_ should be able to execute without using ARM-Host resources 

* _AXI Perirh_, _AXI SmartConnect_ are essentially multiplexers that assign the ARM-Host master or slave ports, respectevily, to their corresponding inputs/outputs

* _Processor System Reset_ is default for handling resets of peripherals

* _System ILA_ _ILA_ stands for _Integrated Logic Analizer_, this is the debug interface, the _ila\_0_ and _ila\_1_ are used to see AXI-Stream ports of _top\_module_

* _top\_module_ is the HLS module which is the part of the code we chose to be implemented in hardware. It is best described in the following section.

* _concat_ is a simple bit concatenation of the interrupts signals of _AXI DMA_.

* _AXI Timer_ is conventional timer which is executed at the same FPGA frequency. Used for profile results.


## HLS module 


The part of the algorithm in programmable logic consists of: hash _SHA256_, logistic map dedicated to diffusion and the data treatment to encrypt the plain-image and generate the cipher-image.


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


## Software application 

The cryptosystem in controlled in software by the ARM-Host running baremetal featuring a single core. Its setup to handle 2 interrupts for read and write _AXI DMA_ transactions.

It initially loads the image to be encrypted in the DDR and issue _AXI DMA_ to write to external device and pools while the _AXI DMA_ write interruption is not set. When the write interruption occurs, it means that the HLS module already has the image to process and so, it should also pool for the _SHA256_ `m_perm` from HLS module. 

Once it receives `m_perm`, the program continues to execute the permutation part encryption scheme that consists of sorting the permutation sequence in ascending order to re-index the image array. 

```
/*
 * qsort is a well known "stdio.h" function of sort
 * @BSIZE is the image size
 * @to ord is a struct type str containing time sequence of logistic map for permutation and a natural index
 * @img is the plain-image array
*/

qsort(to_ord, BSIZE, sizeof(to_ord[0]), cmp);
for (int i = 0; i < BSIZE; i++)
{
    sorted_index[i]=to_ord[i].index;
    img[i] = image[to_ord[i].index];
}

...
/*
* function to compare two elements of string str
*/
int cmp(const void* a, const void* b)
{
    struct str* a1 = (struct str*)a;
    struct str* a2 = (struct str*)b;
    if ((*a1).value > (*a2).value)
        return -1;
    else if ((*a1).value < (*a2).value)
        return 1;
    else
        return 0;
}
```
This is the process to achieve the permutated image, important to stress that this happens concurrently to HLS module execution of diffusion part. 

When HLS module execution elapses, an the read from peripheral interrupt event occurs letting the ARM-Host known that all data are its properly set to proceed. 

The final process is the encryption of the permutated-image with the cipher using _xor_ operation. The following image displays the overall process.

![architecture-1](https://user-images.githubusercontent.com/59630651/250990494-4110bc18-e5ad-4d89-a4d2-51d2d1ac9d25.png)
** The above image display as _Programmable Logic_ the content which refer to _HLS module_


# Results 

This cryptosystem had the following results for utilization of resources: 

|   | LUT   | Slice | Ratio      |
|---|-------|-------|------------|
| LUTRAM | 38931 | 101760 | 38.257664 |
| FF    | 23367 | 460800 | 5.0709634 |
| BRAM  | 76    | 312    | 24.358974 |
| DSP   | 96    | 1728   | 5.555556  |
| BUFG  | 4     | 544    | 0.7352941 |

Energy resource are estimated from _Vivado_ IDE report. It is important to mention that this is a mere estimation and may not present high accuracy  


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

The profiling results for execution of this system is:





# References
\[1\] _Zynq SoC_ product page https://www.xilinx.com/products/silicon-devices/soc.html

\[2\] _ZCU104 Development Kit_ product page https://www.xilinx.com/products/boards-and-kits/zcu104.html

\[3\] _Xilinx Tools_ documentation product page https://www.xilinx.com/support.html

\[4\] _Vitis Libraries_ official repository https://github.com/Xilinx/Vitis_Libraries

\[5\] _MathWorks MATLAB_ official product page https://www.mathworks.com 

\[6\] _NIST SP 800-22 RevA_ official page https://csrc.nist.gov/publications/detail/sp/800-22/rev-1a/final

### Contact 

Have any questions ? Please contact arthurmlima@ieee.org

[1]: https://www.xilinx.com/products/silicon-devices/soc.html "Zynq SoC"
[2]: https://www.xilinx.com/products/boards-and-kits/zcu104.html "zcu104"
[3]: https://www.xilinx.com/support.html "Xilinx Tools"
[4]: https://github.com/Xilinx/Vitis_Libraries "Vitis Libraries"
[5]: https://www.mathworks.com "matlab"
[6]: https://csrc.nist.gov/publications/detail/sp/800-22/rev-1a/final "NIST"


















