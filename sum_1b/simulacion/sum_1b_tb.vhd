library IEEE;
use IEEE.std_logic_1164.all;

entity sum_1b_tb is 
end;

architecture sum_1b_tb_arq of sum_1b_tb is
--Parte declarativa

    component sum_1b is 
        port(
            a_i: in std_logic;     
            b_i: in std_logic;
            carry_in: in std_logic; 
            suma_out: out std_logic;
            carry_out: out std_logic
        );
    end component;

    signal a_tb: std_logic := '1';
    signal b_tb: std_logic;
    signal c_tb: std_logic := '0';
    signal d_tb: std_logic;
    signal e_tb: std_logic;
begin

     a_tb <= '0' after 100 ns , '1' after 250 ns;
     b_tb <= '0' after 50 ns , '1' after 150 ns;
     c_tb <= '1' after 200 ns;
--    a_tb <= not a_tb after 10 ns;
--	b_tb <= not b_tb after 20 ns;
--	c_tb <= not c_tb after 40 ns;
    
    DUT: sum_1b
        port map (
            a_i => a_tb,
            b_i => b_tb,
            carry_in => c_tb,
            suma_out => d_tb,
            carry_out => e_tb
        );
end;