library IEEE;
use IEEE.std_logic_1164.all;

entity sum_nb is 
    generic(N: Natural := 4);
	port(
		a_i: in std_logic_vector(N -1 downto 0);
		b_i: in std_logic_vector(N -1 downto 0);
		carry_in: in std_logic;
		suma_out: out std_logic_vector(N -1 downto 0);
		carry_out: out std_logic
	);
end;

architecture sum_nb_arq of sum_nb is

	component sum_1b is
		port(
			a_i: in std_logic;
			b_i: in std_logic;
			carry_in: in std_logic;
			suma_out: out std_logic;
			carry_out: out std_logic
		);
	end component;
    signal aux: std_logic_vector(N downto 0);

begin

    aux(0) <= carry_in;
	carry_out <= aux(N);
    sumNb_gen: for i in 0 to N - 1 generate
        sum_inst:sum_1b port map(a_i => a_i(i) ,
                                b_i => b_i(i),
                                carry_out => aux(i +1),
                                carry_in => aux(i), 
                                suma_out => suma_out(i));
        end generate;  

end;
