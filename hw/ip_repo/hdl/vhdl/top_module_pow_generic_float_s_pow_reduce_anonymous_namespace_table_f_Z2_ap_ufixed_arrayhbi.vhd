-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity top_module_pow_generic_float_s_pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_arrayhbi is 
    generic(
             DataWidth     : integer := 8; 
             AddressWidth     : integer := 5; 
             AddressRange    : integer := 32
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of top_module_pow_generic_float_s_pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_arrayhbi is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00000000", 1 => "00000000", 2 => "00000001", 3 => "00000010", 
    4 => "00000100", 5 => "00000110", 6 => "00001001", 7 => "00001100", 
    8 => "00010000", 9 => "00010100", 10 => "00011001", 11 => "00011110", 
    12 => "00100100", 13 => "00101010", 14 => "00110001", 15 => "00111000", 
    16 => "01000000", 17 => "01001000", 18 => "01010001", 19 => "01011010", 
    20 => "01100100", 21 => "01101110", 22 => "01111001", 23 => "10000100", 
    24 => "10010000", 25 => "10011100", 26 => "10101001", 27 => "10110110", 
    28 => "11000100", 29 => "11010010", 30 => "11100001", 31 => "11110000");



begin 

 
memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
 
        if (ce0 = '1') then  
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;

end if;
end process;

end rtl;

