-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_module_generateMsgSchedule_Pipeline_LOOP_SHA256_PREPARE_WT64 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    w_strm14_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    w_strm14_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
    w_strm14_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
    w_strm14_full_n : IN STD_LOGIC;
    w_strm14_write : OUT STD_LOGIC;
    W_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_2_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_3_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_4_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_5_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_7_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_8_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_9_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_10_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_11_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_12_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_13_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_15_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_14_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_6_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    W_1_reload : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of top_module_generateMsgSchedule_Pipeline_LOOP_SHA256_PREPARE_WT64 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv7_10 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_const_lv7_40 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_12 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln549_fu_406_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal w_strm14_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal Wt_1_fu_573_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal Wt_1_reg_792 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal t_2_fu_108 : STD_LOGIC_VECTOR (6 downto 0);
    signal t_3_fu_579_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal empty_fu_112 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_100_fu_116 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_101_fu_120 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_102_fu_124 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_103_fu_128 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_104_fu_132 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_105_fu_136 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_106_fu_140 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_107_fu_144 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_108_fu_148 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_109_fu_152 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_110_fu_156 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_111_fu_160 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_112_fu_164 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_113_fu_168 : STD_LOGIC_VECTOR (31 downto 0);
    signal Wt_fu_172 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal trunc_ln553_fu_431_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal lshr_ln_fu_421_p4 : STD_LOGIC_VECTOR (14 downto 0);
    signal trunc_ln553_1_fu_453_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal lshr_ln553_1_fu_443_p4 : STD_LOGIC_VECTOR (12 downto 0);
    signal lshr_ln553_2_fu_465_p4 : STD_LOGIC_VECTOR (21 downto 0);
    signal or_ln_fu_435_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln553_fu_475_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln553_fu_479_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln553_1_fu_457_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln553_2_fu_501_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal lshr_ln553_3_fu_491_p4 : STD_LOGIC_VECTOR (24 downto 0);
    signal trunc_ln553_3_fu_523_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal lshr_ln553_4_fu_513_p4 : STD_LOGIC_VECTOR (13 downto 0);
    signal lshr_ln553_5_fu_535_p4 : STD_LOGIC_VECTOR (28 downto 0);
    signal zext_ln553_1_fu_545_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln553_3_fu_527_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln553_2_fu_549_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln553_2_fu_505_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln553_3_fu_555_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln553_1_fu_485_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln553_1_fu_567_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln553_fu_561_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component top_module_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component top_module_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    Wt_fu_172_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    Wt_fu_172 <= W_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    Wt_fu_172 <= Wt_1_fu_573_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_100_fu_116_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_100_fu_116 <= W_6_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_100_fu_116 <= empty_110_fu_156;
                end if;
            end if; 
        end if;
    end process;

    empty_101_fu_120_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_101_fu_120 <= W_15_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_101_fu_120 <= empty_102_fu_124;
                end if;
            end if; 
        end if;
    end process;

    empty_102_fu_124_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_102_fu_124 <= W_14_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_102_fu_124 <= empty_103_fu_128;
                end if;
            end if; 
        end if;
    end process;

    empty_103_fu_128_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_103_fu_128 <= W_13_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_103_fu_128 <= empty_104_fu_132;
                end if;
            end if; 
        end if;
    end process;

    empty_104_fu_132_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_104_fu_132 <= W_12_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_104_fu_132 <= empty_105_fu_136;
                end if;
            end if; 
        end if;
    end process;

    empty_105_fu_136_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_105_fu_136 <= W_11_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_105_fu_136 <= empty_106_fu_140;
                end if;
            end if; 
        end if;
    end process;

    empty_106_fu_140_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_106_fu_140 <= W_10_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_106_fu_140 <= empty_107_fu_144;
                end if;
            end if; 
        end if;
    end process;

    empty_107_fu_144_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_107_fu_144 <= W_9_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_107_fu_144 <= empty_108_fu_148;
                end if;
            end if; 
        end if;
    end process;

    empty_108_fu_148_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_108_fu_148 <= W_8_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_108_fu_148 <= empty_109_fu_152;
                end if;
            end if; 
        end if;
    end process;

    empty_109_fu_152_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_109_fu_152 <= W_7_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_109_fu_152 <= empty_100_fu_116;
                end if;
            end if; 
        end if;
    end process;

    empty_110_fu_156_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_110_fu_156 <= W_5_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_110_fu_156 <= empty_111_fu_160;
                end if;
            end if; 
        end if;
    end process;

    empty_111_fu_160_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_111_fu_160 <= W_4_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_111_fu_160 <= empty_112_fu_164;
                end if;
            end if; 
        end if;
    end process;

    empty_112_fu_164_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_112_fu_164 <= W_3_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_112_fu_164 <= empty_113_fu_168;
                end if;
            end if; 
        end if;
    end process;

    empty_113_fu_168_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_113_fu_168 <= W_2_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_113_fu_168 <= empty_fu_112;
                end if;
            end if; 
        end if;
    end process;

    empty_fu_112_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    empty_fu_112 <= W_1_reload;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    empty_fu_112 <= Wt_fu_172;
                end if;
            end if; 
        end if;
    end process;

    t_2_fu_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    t_2_fu_108 <= ap_const_lv7_10;
                elsif (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    t_2_fu_108 <= t_3_fu_579_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln549_fu_406_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                Wt_1_reg_792 <= Wt_1_fu_573_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    Wt_1_fu_573_p2 <= std_logic_vector(unsigned(add_ln553_1_fu_567_p2) + unsigned(add_ln553_fu_561_p2));
    add_ln553_1_fu_567_p2 <= std_logic_vector(unsigned(xor_ln553_1_fu_485_p2) + unsigned(empty_100_fu_116));
    add_ln553_fu_561_p2 <= std_logic_vector(unsigned(empty_101_fu_120) + unsigned(xor_ln553_3_fu_555_p2));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter2, w_strm14_full_n)
    begin
                ap_block_pp0_stage0_01001 <= ((w_strm14_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter2, w_strm14_full_n)
    begin
                ap_block_pp0_stage0_11001 <= ((w_strm14_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter2, w_strm14_full_n)
    begin
                ap_block_pp0_stage0_subdone <= ((w_strm14_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state3_pp0_stage0_iter2_assign_proc : process(w_strm14_full_n)
    begin
                ap_block_state3_pp0_stage0_iter2 <= (w_strm14_full_n = ap_const_logic_0);
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln549_fu_406_p2)
    begin
        if (((icmp_ln549_fu_406_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln549_fu_406_p2 <= "1" when (t_2_fu_108 = ap_const_lv7_40) else "0";
    lshr_ln553_1_fu_443_p4 <= empty_fu_112(31 downto 19);
    lshr_ln553_2_fu_465_p4 <= empty_fu_112(31 downto 10);
    lshr_ln553_3_fu_491_p4 <= empty_102_fu_124(31 downto 7);
    lshr_ln553_4_fu_513_p4 <= empty_102_fu_124(31 downto 18);
    lshr_ln553_5_fu_535_p4 <= empty_102_fu_124(31 downto 3);
    lshr_ln_fu_421_p4 <= empty_fu_112(31 downto 17);
    or_ln553_1_fu_457_p3 <= (trunc_ln553_1_fu_453_p1 & lshr_ln553_1_fu_443_p4);
    or_ln553_2_fu_505_p3 <= (trunc_ln553_2_fu_501_p1 & lshr_ln553_3_fu_491_p4);
    or_ln553_3_fu_527_p3 <= (trunc_ln553_3_fu_523_p1 & lshr_ln553_4_fu_513_p4);
    or_ln_fu_435_p3 <= (trunc_ln553_fu_431_p1 & lshr_ln_fu_421_p4);
    t_3_fu_579_p2 <= std_logic_vector(unsigned(t_2_fu_108) + unsigned(ap_const_lv7_1));
    trunc_ln553_1_fu_453_p1 <= empty_fu_112(19 - 1 downto 0);
    trunc_ln553_2_fu_501_p1 <= empty_102_fu_124(7 - 1 downto 0);
    trunc_ln553_3_fu_523_p1 <= empty_102_fu_124(18 - 1 downto 0);
    trunc_ln553_fu_431_p1 <= empty_fu_112(17 - 1 downto 0);

    w_strm14_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, w_strm14_full_n, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            w_strm14_blk_n <= w_strm14_full_n;
        else 
            w_strm14_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    w_strm14_din <= Wt_1_reg_792;

    w_strm14_write_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            w_strm14_write <= ap_const_logic_1;
        else 
            w_strm14_write <= ap_const_logic_0;
        end if; 
    end process;

    xor_ln553_1_fu_485_p2 <= (xor_ln553_fu_479_p2 xor or_ln553_1_fu_457_p3);
    xor_ln553_2_fu_549_p2 <= (zext_ln553_1_fu_545_p1 xor or_ln553_3_fu_527_p3);
    xor_ln553_3_fu_555_p2 <= (xor_ln553_2_fu_549_p2 xor or_ln553_2_fu_505_p3);
    xor_ln553_fu_479_p2 <= (zext_ln553_fu_475_p1 xor or_ln_fu_435_p3);
    zext_ln553_1_fu_545_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln553_5_fu_535_p4),32));
    zext_ln553_fu_475_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln553_2_fu_465_p4),32));
end behav;