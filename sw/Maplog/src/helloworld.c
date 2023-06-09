/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include "stdlib.h"
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include <stdint.h>

#include "math.h"
#include "image.h"
#include "platform.h"
#include "xaxidma.h"
#include "xtime_l.h"
#include "sleep.h"
#include "xtop_module.h"


#define IMAGE_HEIGHT 512
#define IMAGE_WIDTH	 512

#define HASH_SIZE 256>>3
#define IMAGE_SIZE IMAGE_WIDTH*IMAGE_HEIGHT
#define IMAGE_SIZE_SW IMAGE_WIDTH*IMAGE_HEIGHT>>2
#define IMAGE_SIZE_DW IMAGE_WIDTH*IMAGE_HEIGHT>>3

uint8_t hash[32];


XTop_module top_module;
XTop_module_Config *top_module_cfg;
XAxiDma axiDMA;
XAxiDma_Config *axiDMA_cfg;

void initPeripherals() {
	top_module_cfg = XTop_module_LookupConfig(XPAR_TOP_MODULE_0_DEVICE_ID);
	if (top_module_cfg) {
		int status = XTop_module_CfgInitialize(&top_module, top_module_cfg);
		if (status != XST_SUCCESS)
			printf("Error initializing doGain core\n");
	}

	axiDMA_cfg = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if (axiDMA_cfg) {
		int status = XAxiDma_CfgInitialize(&axiDMA, axiDMA_cfg);
		if (status != XST_SUCCESS)
			printf("Error initializing AxiDMA core\n");
	}

	XAxiDma_IntrDisable(&axiDMA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&axiDMA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
}


int main() {

	init_platform();

	u32 *image_tx =(u32*)&imagem;
	u32 *hash_rx =(u32*)&hash;
	
	initPeripherals();


	XTop_module_Start(&top_module);
	Xil_DCacheFlushRange((u32)image_tx, IMAGE_SIZE);
	Xil_DCacheFlushRange((u32)hash_rx, IMAGE_SIZE);
	printf("Transfere a imagem para IP\n");
	int stat ;
	stat = XAxiDma_SimpleTransfer(&axiDMA, (u32) image_tx, IMAGE_SIZE, XAXIDMA_DMA_TO_DEVICE);
	if (stat != XST_SUCCESS){
		printf("Error image transfer\n");
     }
	printf("Recebe o valor do Hash\n");
	stat = XAxiDma_SimpleTransfer(&axiDMA, (u32) hash_rx, HASH_SIZE, XAXIDMA_DEVICE_TO_DMA);
	if (stat != XST_SUCCESS){
		printf("Error hash transfer\n");
     }
	while (XAxiDma_Busy(&axiDMA, XAXIDMA_DEVICE_TO_DMA));
	printf("Terminado o DMA\n");
	Xil_DCacheInvalidateRange((u32)hash_rx, HASH_SIZE);
	printf("Terminado o IP\n");
	while (!XTop_module_IsDone(&top_module));

	printf("Hash:\n");

	// print all elements of hash
	for (int i = 0; i < 32; i++) {
		printf("%02x", hash[i]);
	}









	return 0;
}