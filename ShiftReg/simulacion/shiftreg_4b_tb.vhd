library IEEE;
use IEEE.std_logic_1164.all;

entity shiftreg_nb_tb is
end;

architecture shiftreg_nb_tb_arq of shiftreg_nb_tb is
	
	constant N_tb: natural := 6;
	
	-- Declaracion de señales de prueba
    signal enable_tb: std_logic := '0';
    signal entrada_tb: std_logic := '0';
    signal clock_tb: std_logic := '0';
    signal salida_tb: std_logic := '0';

	-- signal enable_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
	-- signal b_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
	-- signal ci_tb: std_logic := '0';
	-- signal s_tb: std_logic_vector(N_tb-1 downto 0);
	-- signal co_tb: std_logic := '0';

	component shiftreg_nb is 
        generic(N: Natural := 4);
        port(
            enable: in std_logic;
            entrada: in std_logic;
            clock: in std_logic;
            salida: out std_logic
        );
    end component;

begin

	enable_tb <=  "1" after 100 ns;
	clock_tb <=  not clock_tb after 25ns;
	entrada_tb <= '1' after 149 ns, '0' after 176 ns;

	DUT: shiftreg_nb
		generic map(
			N => N_tb
		)
		port map(
			enable	 => enable_tb, 
			entrada	 => entrada_tb,
			clock => clock_tb,
			salida => salida_tb
		);
	
end;