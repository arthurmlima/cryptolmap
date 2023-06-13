// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module top_module_generic_modf_float_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        x,
        ap_return
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] x;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] ap_return;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [4:0] mask_table_address0;
reg    mask_table_ce0;
wire   [22:0] mask_table_q0;
reg   [0:0] xs_sign_V_reg_296;
reg   [7:0] xs_exp_V_reg_302;
wire   [22:0] xs_sig_V_fu_95_p1;
reg   [22:0] xs_sig_V_reg_310;
wire   [63:0] zext_ln541_fu_109_p1;
wire   [31:0] p_Val2_38_fu_73_p1;
wire   [4:0] index_fu_99_p4;
wire    ap_CS_fsm_state2;
wire   [22:0] xf_sig_V_fu_134_p2;
reg   [22:0] p_Result_s_fu_139_p4;
wire   [23:0] p_Result_70_fu_149_p3;
wire  signed [31:0] sext_ln1198_fu_157_p1;
wire   [31:0] p_Result_71_fu_175_p3;
reg   [31:0] zeros_fu_161_p3;
wire   [7:0] add_ln214_fu_190_p2;
wire   [7:0] trunc_ln214_fu_186_p1;
wire   [0:0] icmp_ln1019_6_fu_169_p2;
wire   [7:0] xf_exp_V_fu_195_p2;
wire   [22:0] r_V_fu_209_p2;
wire   [22:0] zeroscast_fu_215_p1;
wire   [7:0] xf_exp_V_2_fu_201_p3;
wire   [22:0] shl_ln1669_fu_219_p2;
wire   [31:0] p_Result_72_fu_225_p4;
wire   [0:0] icmp_ln1035_fu_114_p2;
wire   [0:0] icmp_ln1035_1_fu_119_p2;
wire   [0:0] xor_ln1035_fu_238_p2;
wire   [0:0] icmp_ln1023_fu_129_p2;
wire   [0:0] icmp_ln1019_fu_124_p2;
wire   [0:0] and_ln18_1_fu_250_p2;
wire   [0:0] and_ln18_fu_244_p2;
wire   [0:0] and_ln18_2_fu_256_p2;
wire   [31:0] bitcast_ln356_fu_182_p1;
wire   [0:0] or_ln1035_fu_270_p2;
wire   [31:0] select_ln18_fu_262_p3;
wire   [31:0] bitcast_ln356_1_fu_234_p1;
wire   [31:0] select_ln1035_fu_276_p3;
wire   [31:0] select_ln1035_1_fu_284_p3;
reg   [31:0] ap_return_preg;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_return_preg = 32'd0;
end

top_module_generic_modf_float_s_mask_table_ROM_AUTO_1R #(
    .DataWidth( 23 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
mask_table_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(mask_table_address0),
    .ce0(mask_table_ce0),
    .q0(mask_table_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_return_preg <= select_ln1035_1_fu_284_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        xs_exp_V_reg_302 <= {{p_Val2_38_fu_73_p1[30:23]}};
        xs_sig_V_reg_310 <= xs_sig_V_fu_95_p1;
        xs_sign_V_reg_296 <= p_Val2_38_fu_73_p1[32'd31];
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_return = select_ln1035_1_fu_284_p3;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        mask_table_ce0 = 1'b1;
    end else begin
        mask_table_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln214_fu_190_p2 = ($signed(xs_exp_V_reg_302) + $signed(8'd255));

assign and_ln18_1_fu_250_p2 = (icmp_ln1023_fu_129_p2 & icmp_ln1019_fu_124_p2);

assign and_ln18_2_fu_256_p2 = (and_ln18_fu_244_p2 & and_ln18_1_fu_250_p2);

assign and_ln18_fu_244_p2 = (xor_ln1035_fu_238_p2 & icmp_ln1035_1_fu_119_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign bitcast_ln356_1_fu_234_p1 = p_Result_72_fu_225_p4;

assign bitcast_ln356_fu_182_p1 = p_Result_71_fu_175_p3;

assign icmp_ln1019_6_fu_169_p2 = ((xf_sig_V_fu_134_p2 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln1019_fu_124_p2 = ((xs_exp_V_reg_302 == 8'd255) ? 1'b1 : 1'b0);

assign icmp_ln1023_fu_129_p2 = ((xs_sig_V_reg_310 != 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln1035_1_fu_119_p2 = ((xs_exp_V_reg_302 > 8'd150) ? 1'b1 : 1'b0);

assign icmp_ln1035_fu_114_p2 = ((xs_exp_V_reg_302 < 8'd127) ? 1'b1 : 1'b0);

assign index_fu_99_p4 = {{p_Val2_38_fu_73_p1[27:23]}};

assign mask_table_address0 = zext_ln541_fu_109_p1;

assign or_ln1035_fu_270_p2 = (icmp_ln1035_fu_114_p2 | icmp_ln1035_1_fu_119_p2);

assign p_Result_70_fu_149_p3 = {{1'd1}, {p_Result_s_fu_139_p4}};

assign p_Result_71_fu_175_p3 = {{xs_sign_V_reg_296}, {31'd0}};

assign p_Result_72_fu_225_p4 = {{{xs_sign_V_reg_296}, {xf_exp_V_2_fu_201_p3}}, {shl_ln1669_fu_219_p2}};

integer ap_tvar_int_0;

always @ (xf_sig_V_fu_134_p2) begin
    for (ap_tvar_int_0 = 23 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 22 - 0) begin
            p_Result_s_fu_139_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            p_Result_s_fu_139_p4[ap_tvar_int_0] = xf_sig_V_fu_134_p2[22 - ap_tvar_int_0];
        end
    end
end

assign p_Val2_38_fu_73_p1 = x;

assign r_V_fu_209_p2 = xf_sig_V_fu_134_p2 << 23'd1;

assign select_ln1035_1_fu_284_p3 = ((icmp_ln1035_fu_114_p2[0:0] == 1'b1) ? x : select_ln1035_fu_276_p3);

assign select_ln1035_fu_276_p3 = ((or_ln1035_fu_270_p2[0:0] == 1'b1) ? select_ln18_fu_262_p3 : bitcast_ln356_1_fu_234_p1);

assign select_ln18_fu_262_p3 = ((and_ln18_2_fu_256_p2[0:0] == 1'b1) ? 32'd2147483647 : bitcast_ln356_fu_182_p1);

assign sext_ln1198_fu_157_p1 = $signed(p_Result_70_fu_149_p3);

assign shl_ln1669_fu_219_p2 = r_V_fu_209_p2 << zeroscast_fu_215_p1;

assign trunc_ln214_fu_186_p1 = zeros_fu_161_p3[7:0];

assign xf_exp_V_2_fu_201_p3 = ((icmp_ln1019_6_fu_169_p2[0:0] == 1'b1) ? 8'd0 : xf_exp_V_fu_195_p2);

assign xf_exp_V_fu_195_p2 = (add_ln214_fu_190_p2 - trunc_ln214_fu_186_p1);

assign xf_sig_V_fu_134_p2 = (xs_sig_V_reg_310 & mask_table_q0);

assign xor_ln1035_fu_238_p2 = (icmp_ln1035_fu_114_p2 ^ 1'd1);

assign xs_sig_V_fu_95_p1 = p_Val2_38_fu_73_p1[22:0];


always @ (sext_ln1198_fu_157_p1) begin
    if (sext_ln1198_fu_157_p1[0] == 1'b1) begin
        zeros_fu_161_p3 = 32'd0;
    end else if (sext_ln1198_fu_157_p1[1] == 1'b1) begin
        zeros_fu_161_p3 = 32'd1;
    end else if (sext_ln1198_fu_157_p1[2] == 1'b1) begin
        zeros_fu_161_p3 = 32'd2;
    end else if (sext_ln1198_fu_157_p1[3] == 1'b1) begin
        zeros_fu_161_p3 = 32'd3;
    end else if (sext_ln1198_fu_157_p1[4] == 1'b1) begin
        zeros_fu_161_p3 = 32'd4;
    end else if (sext_ln1198_fu_157_p1[5] == 1'b1) begin
        zeros_fu_161_p3 = 32'd5;
    end else if (sext_ln1198_fu_157_p1[6] == 1'b1) begin
        zeros_fu_161_p3 = 32'd6;
    end else if (sext_ln1198_fu_157_p1[7] == 1'b1) begin
        zeros_fu_161_p3 = 32'd7;
    end else if (sext_ln1198_fu_157_p1[8] == 1'b1) begin
        zeros_fu_161_p3 = 32'd8;
    end else if (sext_ln1198_fu_157_p1[9] == 1'b1) begin
        zeros_fu_161_p3 = 32'd9;
    end else if (sext_ln1198_fu_157_p1[10] == 1'b1) begin
        zeros_fu_161_p3 = 32'd10;
    end else if (sext_ln1198_fu_157_p1[11] == 1'b1) begin
        zeros_fu_161_p3 = 32'd11;
    end else if (sext_ln1198_fu_157_p1[12] == 1'b1) begin
        zeros_fu_161_p3 = 32'd12;
    end else if (sext_ln1198_fu_157_p1[13] == 1'b1) begin
        zeros_fu_161_p3 = 32'd13;
    end else if (sext_ln1198_fu_157_p1[14] == 1'b1) begin
        zeros_fu_161_p3 = 32'd14;
    end else if (sext_ln1198_fu_157_p1[15] == 1'b1) begin
        zeros_fu_161_p3 = 32'd15;
    end else if (sext_ln1198_fu_157_p1[16] == 1'b1) begin
        zeros_fu_161_p3 = 32'd16;
    end else if (sext_ln1198_fu_157_p1[17] == 1'b1) begin
        zeros_fu_161_p3 = 32'd17;
    end else if (sext_ln1198_fu_157_p1[18] == 1'b1) begin
        zeros_fu_161_p3 = 32'd18;
    end else if (sext_ln1198_fu_157_p1[19] == 1'b1) begin
        zeros_fu_161_p3 = 32'd19;
    end else if (sext_ln1198_fu_157_p1[20] == 1'b1) begin
        zeros_fu_161_p3 = 32'd20;
    end else if (sext_ln1198_fu_157_p1[21] == 1'b1) begin
        zeros_fu_161_p3 = 32'd21;
    end else if (sext_ln1198_fu_157_p1[22] == 1'b1) begin
        zeros_fu_161_p3 = 32'd22;
    end else if (sext_ln1198_fu_157_p1[23] == 1'b1) begin
        zeros_fu_161_p3 = 32'd23;
    end else if (sext_ln1198_fu_157_p1[24] == 1'b1) begin
        zeros_fu_161_p3 = 32'd24;
    end else if (sext_ln1198_fu_157_p1[25] == 1'b1) begin
        zeros_fu_161_p3 = 32'd25;
    end else if (sext_ln1198_fu_157_p1[26] == 1'b1) begin
        zeros_fu_161_p3 = 32'd26;
    end else if (sext_ln1198_fu_157_p1[27] == 1'b1) begin
        zeros_fu_161_p3 = 32'd27;
    end else if (sext_ln1198_fu_157_p1[28] == 1'b1) begin
        zeros_fu_161_p3 = 32'd28;
    end else if (sext_ln1198_fu_157_p1[29] == 1'b1) begin
        zeros_fu_161_p3 = 32'd29;
    end else if (sext_ln1198_fu_157_p1[30] == 1'b1) begin
        zeros_fu_161_p3 = 32'd30;
    end else if (sext_ln1198_fu_157_p1[31] == 1'b1) begin
        zeros_fu_161_p3 = 32'd31;
    end else begin
        zeros_fu_161_p3 = 32'd32;
    end
end

assign zeroscast_fu_215_p1 = zeros_fu_161_p3[22:0];

assign zext_ln541_fu_109_p1 = index_fu_99_p4;

endmodule //top_module_generic_modf_float_s