
wire kernel_monitor_reset;
wire kernel_monitor_clock;
wire kernel_monitor_report;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
assign kernel_monitor_report = 1'b0;
wire [1:0] axis_block_sigs;
wire [12:0] inst_idle_sigs;
wire [8:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~get_image_stream_U0.grp_get_image_stream_Pipeline_VITIS_LOOP_17_1_fu_71.input_stream_TDATA_blk_n;
assign axis_block_sigs[1] = ~logmap_U0.output_stream_TDATA_blk_n;

assign inst_idle_sigs[0] = entry_proc_U0.ap_idle;
assign inst_block_sigs[0] = (entry_proc_U0.ap_done & ~entry_proc_U0.ap_continue) | ~entry_proc_U0.u_diff_c_blk_n;
assign inst_idle_sigs[1] = get_image_stream_U0.ap_idle;
assign inst_block_sigs[1] = (get_image_stream_U0.ap_done & ~get_image_stream_U0.ap_continue) | ~get_image_stream_U0.grp_get_image_stream_Pipeline_VITIS_LOOP_17_1_fu_71.msg_strm5_blk_n | ~get_image_stream_U0.len_strm6_blk_n | ~get_image_stream_U0.end_len_strm7_blk_n;
assign inst_idle_sigs[2] = sha256_64_U0.ap_idle;
assign inst_block_sigs[2] = (sha256_64_U0.ap_done & ~sha256_64_U0.ap_continue) | ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.preProcessing_U0.grp_preProcessing_Pipeline_LOOP_SHA256_GEN_COPY_TAIL_PAD_ONE_fu_229.msg_strm5_blk_n | ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.preProcessing_U0.grp_preProcessing_Pipeline_LOOP_SHA256_GEN_FULL_BLKS_fu_220.msg_strm5_blk_n | ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.preProcessing_U0.len_strm6_blk_n | ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.preProcessing_U0.end_len_strm7_blk_n | ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.sha256Digest_256_U0.hash_strm8_blk_n | ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.sha256Digest_256_U0.end_hash_strm9_blk_n;
assign inst_idle_sigs[3] = set_hash_stream_U0.ap_idle;
assign inst_block_sigs[3] = (set_hash_stream_U0.ap_done & ~set_hash_stream_U0.ap_continue) | ~set_hash_stream_U0.hash_strm8_blk_n | ~set_hash_stream_U0.grp_set_hash_stream_Pipeline_VITIS_LOOP_40_1_fu_57.end_hash_strm9_blk_n;
assign inst_idle_sigs[4] = logmap_U0.ap_idle;
assign inst_block_sigs[4] = (logmap_U0.ap_done & ~logmap_U0.ap_continue) | ~logmap_U0.u_diff_blk_n;
assign inst_idle_sigs[5] = sha256_64_U0.grp_sha256_top_64_256_s_fu_22.preProcessing_U0.ap_idle;
assign inst_block_sigs[5] = (sha256_64_U0.grp_sha256_top_64_256_s_fu_22.preProcessing_U0.ap_done & ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.preProcessing_U0.ap_continue);
assign inst_idle_sigs[6] = sha256_64_U0.grp_sha256_top_64_256_s_fu_22.dup_strm_U0.ap_idle;
assign inst_block_sigs[6] = (sha256_64_U0.grp_sha256_top_64_256_s_fu_22.dup_strm_U0.ap_done & ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.dup_strm_U0.ap_continue);
assign inst_idle_sigs[7] = sha256_64_U0.grp_sha256_top_64_256_s_fu_22.generateMsgSchedule_U0.ap_idle;
assign inst_block_sigs[7] = (sha256_64_U0.grp_sha256_top_64_256_s_fu_22.generateMsgSchedule_U0.ap_done & ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.generateMsgSchedule_U0.ap_continue);
assign inst_idle_sigs[8] = sha256_64_U0.grp_sha256_top_64_256_s_fu_22.sha256Digest_256_U0.ap_idle;
assign inst_block_sigs[8] = (sha256_64_U0.grp_sha256_top_64_256_s_fu_22.sha256Digest_256_U0.ap_done & ~sha256_64_U0.grp_sha256_top_64_256_s_fu_22.sha256Digest_256_U0.ap_continue);

assign inst_idle_sigs[9] = 1'b0;
assign inst_idle_sigs[10] = get_image_stream_U0.ap_idle;
assign inst_idle_sigs[11] = get_image_stream_U0.grp_get_image_stream_Pipeline_VITIS_LOOP_17_1_fu_71.ap_idle;
assign inst_idle_sigs[12] = logmap_U0.ap_idle;

top_module_hls_deadlock_idx0_monitor top_module_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);


always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
