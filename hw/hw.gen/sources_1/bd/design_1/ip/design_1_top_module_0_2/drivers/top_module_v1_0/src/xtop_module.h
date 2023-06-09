// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XTOP_MODULE_H
#define XTOP_MODULE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xtop_module_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XTop_module_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XTop_module;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTop_module_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTop_module_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTop_module_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTop_module_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XTop_module_Initialize(XTop_module *InstancePtr, u16 DeviceId);
XTop_module_Config* XTop_module_LookupConfig(u16 DeviceId);
int XTop_module_CfgInitialize(XTop_module *InstancePtr, XTop_module_Config *ConfigPtr);
#else
int XTop_module_Initialize(XTop_module *InstancePtr, const char* InstanceName);
int XTop_module_Release(XTop_module *InstancePtr);
#endif

void XTop_module_Start(XTop_module *InstancePtr);
u32 XTop_module_IsDone(XTop_module *InstancePtr);
u32 XTop_module_IsIdle(XTop_module *InstancePtr);
u32 XTop_module_IsReady(XTop_module *InstancePtr);
void XTop_module_EnableAutoRestart(XTop_module *InstancePtr);
void XTop_module_DisableAutoRestart(XTop_module *InstancePtr);

void XTop_module_Set_u_perm(XTop_module *InstancePtr, u32 Data);
u32 XTop_module_Get_u_perm(XTop_module *InstancePtr);
void XTop_module_Set_u_diff(XTop_module *InstancePtr, u32 Data);
u32 XTop_module_Get_u_diff(XTop_module *InstancePtr);
void XTop_module_Set_u_dt(XTop_module *InstancePtr, u32 Data);
u32 XTop_module_Get_u_dt(XTop_module *InstancePtr);

void XTop_module_InterruptGlobalEnable(XTop_module *InstancePtr);
void XTop_module_InterruptGlobalDisable(XTop_module *InstancePtr);
void XTop_module_InterruptEnable(XTop_module *InstancePtr, u32 Mask);
void XTop_module_InterruptDisable(XTop_module *InstancePtr, u32 Mask);
void XTop_module_InterruptClear(XTop_module *InstancePtr, u32 Mask);
u32 XTop_module_InterruptGetEnabled(XTop_module *InstancePtr);
u32 XTop_module_InterruptGetStatus(XTop_module *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
