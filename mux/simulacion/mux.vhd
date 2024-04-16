library IEEE;
use IEEE.std_logic_1164.all;

entity mux is 
    generic(N,M:integer);
	port(
		entrada: in std_logic_vector(N-1 downto 0);
        selector: in std_logic_vector(M-1 downto 0);
        salida: out std_logic
	);
end;

architecture m of mux is
    function word_to_int(word: std_logic_vector) return integer is variable result : integer := 0;
    begin
        for index in word'RANGE loop
            if (word(index) = '1') then 
                result := result + 2**index;
            end if; 
        end loop;
    return result; end word_to_int;
begin
    sal <= ent(word_to_int(sel)); 
end;
