library IEEE;
use IEEE.std_logic_1164.all;

entity sum4b_tb is
end;

architecture sum4b_tb_arq of sum4b_tb is

	-- Declaracion de componente
	component sum4b is
		port(
			a_i: in std_logic_vector(3 downto 0);
			b_i: in std_logic_vector(3 downto 0);
			carry_in: in std_logic;
			suma_out: out std_logic_vector(3 downto 0);
			carry_out: out std_logic
		);
	end component;

	-- Senales de prueba
	signal a_tb: std_logic_vector(3 downto 0) := "1011";
	signal b_tb: std_logic_vector(3 downto 0) := "0100";
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic_vector(3 downto 0);
	signal co_tb: std_logic;
	
begin

	-- Senales de excitacion
	-- a_tb <= not a_tb after 20 ns;
	-- b_tb <= not b_tb after 40 ns;
	ci_tb <= '1' after 180 ns;

	-- Instanciacion del componente a probar
	DUT: sum4b
		port map(
			a_i		=> a_tb,
			b_i 	=> b_tb,
			carry_in 	=> ci_tb,
			suma_out 	=> s_tb,
			carry_out	=> co_tb
		);

end;