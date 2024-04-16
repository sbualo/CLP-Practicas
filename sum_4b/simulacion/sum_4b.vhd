library IEEE;
use IEEE.std_logic_1164.all;

entity sum4b is
	port(
		a_i: in std_logic_vector(3 downto 0);
		b_i: in std_logic_vector(3 downto 0);
		carry_in: in std_logic;
		suma_out: out std_logic_vector(3 downto 0);
		carry_out: out std_logic
	);
end;

architecture sum4b_arq of sum4b is
	
	component sum_1b is
		port(
			a_i: in std_logic;
			b_i: in std_logic;
			carry_in: in std_logic;
			suma_out: out std_logic;
			carry_out: out std_logic
		);
	end component;

signal aux: std_logic_vector(4 downto 0); 

	
begin

	aux(0) <= carry_in;
	
	sum1b_ins_0: sum_1b
		port map(
			a_i		=> a_i(0), 
			b_i		=> b_i(0), 
			carry_in	=> aux(0),
			suma_out		=> suma_out(0), 
			carry_out	=> aux(1)
		);

	sum1b_ins_1: sum_1b
		port map(
			a_i		    => a_i(1), 
			b_i		    => b_i(1), 
			carry_in	=> aux(1),
			suma_out	=> suma_out(1), 
			carry_out	=> aux(2)
		);
		
	sum1b_ins_2: sum_1b
		port map(
			a_i		    => a_i(2), 
			b_i		    => b_i(2), 
			carry_in	=> aux(2),
			suma_out	=> suma_out(2), 
			carry_out	=> aux(3)
		);

	sum1b_ins_3: sum_1b
		port map(
			a_i		=> a_i(3), 
			b_i		=> b_i(3), 
			carry_in	=> aux(3),
			suma_out		=> suma_out(3), 
			carry_out	=> aux(4)
		);

    carry_out <= aux(4);

end;