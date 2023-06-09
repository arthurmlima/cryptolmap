// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of u_perm
//        bit 31~0 - u_perm[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of u_diff
//        bit 31~0 - u_diff[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of u_dt
//        bit 31~0 - u_dt[31:0] (Read/Write)
// 0x24 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XTOP_MODULE_CONTROL_ADDR_AP_CTRL     0x00
#define XTOP_MODULE_CONTROL_ADDR_GIE         0x04
#define XTOP_MODULE_CONTROL_ADDR_IER         0x08
#define XTOP_MODULE_CONTROL_ADDR_ISR         0x0c
#define XTOP_MODULE_CONTROL_ADDR_U_PERM_DATA 0x10
#define XTOP_MODULE_CONTROL_BITS_U_PERM_DATA 32
#define XTOP_MODULE_CONTROL_ADDR_U_DIFF_DATA 0x18
#define XTOP_MODULE_CONTROL_BITS_U_DIFF_DATA 32
#define XTOP_MODULE_CONTROL_ADDR_U_DT_DATA   0x20
#define XTOP_MODULE_CONTROL_BITS_U_DT_DATA   32

