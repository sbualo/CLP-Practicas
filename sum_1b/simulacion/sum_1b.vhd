library IEEE;
use IEEE.std_logic_1164.all;

entity sum_1b is 
    port(
        a_i: in std_logic;     
        b_i: in std_logic;
        carry_in: in std_logic; 
        suma_out: out std_logic;
        carry_out: out std_logic
    );
end;

architecture sum_1b_arq of sum_1b is
--Parte declarativa
begin

    suma_out <=  a_i xor b_i xor carry_in;
    carry_out <= (a_i and b_i) or (a_i and carry_in) or (b_i and carry_in);

end;