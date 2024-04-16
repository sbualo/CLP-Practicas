library IEEE;
use IEEE.std_logic_1164.all;

entity shiftreg_nb is 
    generic(N: Natural := 4);
	port(
        enable: in std_logic;
        entrada: in std_logic;
		clock: in std_logic;
		salida: out std_logic
	);
end;

architecture shiftreg_nb_arq of shiftreg_nb is

	component ffd is 
        port (
            clck_i: in  std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            d_i: in std_logic;
            q_o: out std_logic;
        );
    end component;

begin

    -- d_i(0) <= entrada;
	-- salida <= q_o(N);
    -- flipflopNb_gen: for i in 0 to N - 1 generate
    --     flip_flop_inst:ffd port map(clck_i => clock,
    --                                 ena_i => enable,
    --                                 rst_i => not enable,
    --                                 d_i(i) => q_o(i+1), 
    --                                 q_o(i) => d_i(i+1));
    --     end generate;  

end;
