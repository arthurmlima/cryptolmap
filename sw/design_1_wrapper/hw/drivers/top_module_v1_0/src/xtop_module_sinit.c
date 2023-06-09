// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xtop_module.h"

extern XTop_module_Config XTop_module_ConfigTable[];

XTop_module_Config *XTop_module_LookupConfig(u16 DeviceId) {
	XTop_module_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTOP_MODULE_NUM_INSTANCES; Index++) {
		if (XTop_module_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XTop_module_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTop_module_Initialize(XTop_module *InstancePtr, u16 DeviceId) {
	XTop_module_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTop_module_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTop_module_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

