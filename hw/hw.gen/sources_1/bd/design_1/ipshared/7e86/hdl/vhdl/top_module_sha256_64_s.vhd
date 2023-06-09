-- ==============================================================
-- Generated by Vitis HLS v2023.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_module_sha256_64_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    msg_strm_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    msg_strm_num_data_valid : IN STD_LOGIC_VECTOR (15 downto 0);
    msg_strm_fifo_cap : IN STD_LOGIC_VECTOR (15 downto 0);
    msg_strm_empty_n : IN STD_LOGIC;
    msg_strm_read : OUT STD_LOGIC;
    len_strm_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    len_strm_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    len_strm_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    len_strm_empty_n : IN STD_LOGIC;
    len_strm_read : OUT STD_LOGIC;
    end_len_strm_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    end_len_strm_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    end_len_strm_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    end_len_strm_empty_n : IN STD_LOGIC;
    end_len_strm_read : OUT STD_LOGIC;
    hash_strm_din : OUT STD_LOGIC_VECTOR (255 downto 0);
    hash_strm_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    hash_strm_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    hash_strm_full_n : IN STD_LOGIC;
    hash_strm_write : OUT STD_LOGIC;
    end_hash_strm_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    end_hash_strm_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    end_hash_strm_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    end_hash_strm_full_n : IN STD_LOGIC;
    end_hash_strm_write : OUT STD_LOGIC );
end;


architecture behav of top_module_sha256_64_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;

attribute shreg_extract : string;
    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_msg_strm_read : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_len_strm_read : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_end_len_strm_read : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_hash_strm_din : STD_LOGIC_VECTOR (255 downto 0);
    signal grp_sha256_top_64_256_s_fu_22_hash_strm_write : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_end_hash_strm_din : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_sha256_top_64_256_s_fu_22_end_hash_strm_write : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_ap_start : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_ap_done : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_ap_ready : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_ap_idle : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_ap_continue : STD_LOGIC;
    signal grp_sha256_top_64_256_s_fu_22_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state1_ignore_call5 : BOOLEAN;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_sync_grp_sha256_top_64_256_s_fu_22_ap_ready : STD_LOGIC;
    signal ap_sync_grp_sha256_top_64_256_s_fu_22_ap_done : STD_LOGIC;
    signal ap_block_state2_on_subcall_done : BOOLEAN;
    signal ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_ready : STD_LOGIC := '0';
    signal ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_done : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component top_module_sha256_top_64_256_s IS
    port (
        msg_strm_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        msg_strm_empty_n : IN STD_LOGIC;
        msg_strm_read : OUT STD_LOGIC;
        len_strm_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        len_strm_empty_n : IN STD_LOGIC;
        len_strm_read : OUT STD_LOGIC;
        end_len_strm_dout : IN STD_LOGIC_VECTOR (0 downto 0);
        end_len_strm_empty_n : IN STD_LOGIC;
        end_len_strm_read : OUT STD_LOGIC;
        hash_strm_din : OUT STD_LOGIC_VECTOR (255 downto 0);
        hash_strm_full_n : IN STD_LOGIC;
        hash_strm_write : OUT STD_LOGIC;
        end_hash_strm_din : OUT STD_LOGIC_VECTOR (0 downto 0);
        end_hash_strm_full_n : IN STD_LOGIC;
        end_hash_strm_write : OUT STD_LOGIC;
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;



begin
    grp_sha256_top_64_256_s_fu_22 : component top_module_sha256_top_64_256_s
    port map (
        msg_strm_dout => msg_strm_dout,
        msg_strm_empty_n => msg_strm_empty_n,
        msg_strm_read => grp_sha256_top_64_256_s_fu_22_msg_strm_read,
        len_strm_dout => len_strm_dout,
        len_strm_empty_n => len_strm_empty_n,
        len_strm_read => grp_sha256_top_64_256_s_fu_22_len_strm_read,
        end_len_strm_dout => end_len_strm_dout,
        end_len_strm_empty_n => end_len_strm_empty_n,
        end_len_strm_read => grp_sha256_top_64_256_s_fu_22_end_len_strm_read,
        hash_strm_din => grp_sha256_top_64_256_s_fu_22_hash_strm_din,
        hash_strm_full_n => hash_strm_full_n,
        hash_strm_write => grp_sha256_top_64_256_s_fu_22_hash_strm_write,
        end_hash_strm_din => grp_sha256_top_64_256_s_fu_22_end_hash_strm_din,
        end_hash_strm_full_n => end_hash_strm_full_n,
        end_hash_strm_write => grp_sha256_top_64_256_s_fu_22_end_hash_strm_write,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_sha256_top_64_256_s_fu_22_ap_start,
        ap_done => grp_sha256_top_64_256_s_fu_22_ap_done,
        ap_ready => grp_sha256_top_64_256_s_fu_22_ap_ready,
        ap_idle => grp_sha256_top_64_256_s_fu_22_ap_idle,
        ap_continue => grp_sha256_top_64_256_s_fu_22_ap_continue);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
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
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_done_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_done <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
                    ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_done <= ap_const_logic_0;
                elsif ((grp_sha256_top_64_256_s_fu_22_ap_done = ap_const_logic_1)) then 
                    ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_done <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_ready <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
                    ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_ready <= ap_const_logic_0;
                elsif ((grp_sha256_top_64_256_s_fu_22_ap_ready = ap_const_logic_1)) then 
                    ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_ready <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_sha256_top_64_256_s_fu_22_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_sha256_top_64_256_s_fu_22_ap_start_reg <= ap_const_logic_0;
            else
                if (((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sync_grp_sha256_top_64_256_s_fu_22_ap_ready = ap_const_logic_0)))) then 
                    grp_sha256_top_64_256_s_fu_22_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_sha256_top_64_256_s_fu_22_ap_ready = ap_const_logic_1)) then 
                    grp_sha256_top_64_256_s_fu_22_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((real_start = ap_const_logic_1) and (internal_ap_ready = ap_const_logic_0))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_ST_fsm_state1_blk_assign_proc : process(real_start, ap_done_reg)
    begin
        if (((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(ap_block_state2_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state2_on_subcall_done)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state1_ignore_call5_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1_ignore_call5 <= ((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state2_on_subcall_done_assign_proc : process(ap_sync_grp_sha256_top_64_256_s_fu_22_ap_ready, ap_sync_grp_sha256_top_64_256_s_fu_22_ap_done)
    begin
                ap_block_state2_on_subcall_done <= ((ap_sync_grp_sha256_top_64_256_s_fu_22_ap_ready and ap_sync_grp_sha256_top_64_256_s_fu_22_ap_done) = ap_const_logic_0);
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;
    ap_sync_grp_sha256_top_64_256_s_fu_22_ap_done <= (grp_sha256_top_64_256_s_fu_22_ap_done or ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_done);
    ap_sync_grp_sha256_top_64_256_s_fu_22_ap_ready <= (grp_sha256_top_64_256_s_fu_22_ap_ready or ap_sync_reg_grp_sha256_top_64_256_s_fu_22_ap_ready);
    end_hash_strm_din <= grp_sha256_top_64_256_s_fu_22_end_hash_strm_din;

    end_hash_strm_write_assign_proc : process(grp_sha256_top_64_256_s_fu_22_end_hash_strm_write, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            end_hash_strm_write <= grp_sha256_top_64_256_s_fu_22_end_hash_strm_write;
        else 
            end_hash_strm_write <= ap_const_logic_0;
        end if; 
    end process;


    end_len_strm_read_assign_proc : process(grp_sha256_top_64_256_s_fu_22_end_len_strm_read, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            end_len_strm_read <= grp_sha256_top_64_256_s_fu_22_end_len_strm_read;
        else 
            end_len_strm_read <= ap_const_logic_0;
        end if; 
    end process;


    grp_sha256_top_64_256_s_fu_22_ap_continue_assign_proc : process(ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
            grp_sha256_top_64_256_s_fu_22_ap_continue <= ap_const_logic_1;
        else 
            grp_sha256_top_64_256_s_fu_22_ap_continue <= ap_const_logic_0;
        end if; 
    end process;

    grp_sha256_top_64_256_s_fu_22_ap_start <= grp_sha256_top_64_256_s_fu_22_ap_start_reg;
    hash_strm_din <= grp_sha256_top_64_256_s_fu_22_hash_strm_din;

    hash_strm_write_assign_proc : process(grp_sha256_top_64_256_s_fu_22_hash_strm_write, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            hash_strm_write <= grp_sha256_top_64_256_s_fu_22_hash_strm_write;
        else 
            hash_strm_write <= ap_const_logic_0;
        end if; 
    end process;


    internal_ap_ready_assign_proc : process(ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    len_strm_read_assign_proc : process(grp_sha256_top_64_256_s_fu_22_len_strm_read, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            len_strm_read <= grp_sha256_top_64_256_s_fu_22_len_strm_read;
        else 
            len_strm_read <= ap_const_logic_0;
        end if; 
    end process;


    msg_strm_read_assign_proc : process(grp_sha256_top_64_256_s_fu_22_msg_strm_read, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            msg_strm_read <= grp_sha256_top_64_256_s_fu_22_msg_strm_read;
        else 
            msg_strm_read <= ap_const_logic_0;
        end if; 
    end process;


    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_full_n = ap_const_logic_0) and (start_once_reg = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((real_start = ap_const_logic_1) and (start_once_reg = ap_const_logic_0))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;