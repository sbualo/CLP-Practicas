library IEEE;
use IEEE.std_logic_1164.all;

entity sumrest_nb is 
    generic(N: Natural := 4);
	port(
		a_i: in std_logic_vector(N -1 downto 0);
		b_i: in std_logic_vector(N -1 downto 0);
		carry_in: in std_logic;
        sum_or_rest: in std_logic;
		suma_out: out std_logic_vector(N -1 downto 0);
		carry_out: out std_logic
	);
end;

architecture sumrest_nb_arq of sumrest_nb is
    signal aux_b_i: std_logic_vector(N - 1 downto 0) := (others => '0');
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


function negate_vector(a : std_logic_vector) return std_logic_vector is
    variable result : std_logic_vector(a'range);
begin
    for i in a'range loop
        -- Perform bitwise inversion
        result(i) := not a(i);
    end loop;
    return result;
end function;

begin

--Quizas se puede hacer con un mux para evitar serializacion
process(sum_or_rest, b_i)
begin
    if sum_or_rest = '1' then
        aux_b_i <= negate_vector(b_i);
    else
        aux_b_i <= b_i;
    end if;
end process;

    aux(0) <= carry_in;
	carry_out <= aux(N);
    sumNb_gen: for i in 0 to N - 1 generate
        sum_inst:sum_1b port map(a_i => a_i(i) ,
                                b_i => aux_b_i(i),
                                carry_out => aux(i +1),
                                carry_in => aux(i), 
                                suma_out => suma_out(i));
        end generate;  

end;

