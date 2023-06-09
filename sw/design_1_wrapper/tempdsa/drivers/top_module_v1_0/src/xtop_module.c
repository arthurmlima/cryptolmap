// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xtop_module.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTop_module_CfgInitialize(XTop_module *InstancePtr, XTop_module_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTop_module_Start(XTop_module *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_module_ReadReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_AP_CTRL) & 0x80;
    XTop_module_WriteReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTop_module_IsDone(XTop_module *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_module_ReadReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTop_module_IsIdle(XTop_module *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_module_ReadReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTop_module_IsReady(XTop_module *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_module_ReadReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTop_module_EnableAutoRestart(XTop_module *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_module_WriteReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XTop_module_DisableAutoRestart(XTop_module *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_module_WriteReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_AP_CTRL, 0);
}

void XTop_module_InterruptGlobalEnable(XTop_module *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_module_WriteReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_GIE, 1);
}

void XTop_module_InterruptGlobalDisable(XTop_module *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_module_WriteReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_GIE, 0);
}

void XTop_module_InterruptEnable(XTop_module *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTop_module_ReadReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_IER);
    XTop_module_WriteReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_IER, Register | Mask);
}

void XTop_module_InterruptDisable(XTop_module *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTop_module_ReadReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_IER);
    XTop_module_WriteReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_IER, Register & (~Mask));
}

void XTop_module_InterruptClear(XTop_module *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_module_WriteReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_ISR, Mask);
}

u32 XTop_module_InterruptGetEnabled(XTop_module *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTop_module_ReadReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_IER);
}

u32 XTop_module_InterruptGetStatus(XTop_module *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTop_module_ReadReg(InstancePtr->Control_BaseAddress, XTOP_MODULE_CONTROL_ADDR_ISR);
}

