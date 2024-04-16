library IEEE;
use IEEE.std_logic_1164.all;

entity ffd_nb_tb is
end;

architecture ffd_nb_tb_arq of ffd_nb_tb is
	
	constant N_tb: natural := 6;
	
	-- Declaracion de señales de prueba
    signal enable_tb: std_logic := '0';
    signal reset_tb: std_logic := '0';
    signal entrada_tb: std_logic := '0';
    signal clock_tb: std_logic := '0';
    signal salida_tb: std_logic := '0';


	component ffd_nb is 
        generic(N: Natural := 4);
        port (
            clck_i: in  std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            d_i: in std_logic_vector(N -1 downto 0);
            q_o: out std_logic_vector(N -1 downto 0)
        );
    end component;

begin

	enable_tb <=  '1' after 100 ns;
	clock_tb <=  not clock_tb after 25 ns;
	entrada_tb <= '1' after 149 ns, '0' after 176 ns;

	DUT: ffd_nb
		generic map(
			N => N_tb
		)
		port map(
			ena_i	 => enable_tb,
            rst_i	=>reset_tb, 
			d_i(0)	 => entrada_tb,
			clck_i => clock_tb,
			q_o(4) => salida_tb
		);
	
end;