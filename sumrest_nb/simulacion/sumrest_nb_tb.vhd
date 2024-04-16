library IEEE;
use IEEE.std_logic_1164.all;

entity sumrest_nb_tb is
end;

architecture sumrest_nb_tb_arq of sumrest_nb_tb is
	
	constant N_tb: natural := 6;
	
	-- Declaracion de senales de prueba
	signal a_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic := '0';
    signal sumrest_tb : std_logic := '0';

	component sumrest_nb is 
    generic(N: Natural := 4);
	port(
		a_i: in std_logic_vector(N -1 downto 0);
		b_i: in std_logic_vector(N -1 downto 0);
		carry_in: in std_logic;
        sum_or_rest: in std_logic;
		suma_out: out std_logic_vector(N -1 downto 0);
		carry_out: out std_logic
	);
    end component;

begin

	a_tb <=  "000111" after 100 ns, "010000" after 300 ns;
	b_tb <=  "000100" after 200 ns;
	ci_tb <= '1' after 400 ns;
    sumrest_tb <= '1' after 500 ns;

	DUT: sumrest_nb
		generic map(
			N => N_tb
		)
		port map(
			a_i	 => a_tb, 
			b_i	 => b_tb,
			carry_in => ci_tb,
			suma_out => s_tb,
			carry_out => co_tb,
            sum_or_rest => sumrest_tb
		);
	
end;