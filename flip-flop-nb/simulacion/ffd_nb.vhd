library IEEE;
use IEEE.std_logic_1164.all;

entity ffd_nb is 
    generic(N: Natural := 4);
    port (
        clck_i: in  std_logic;
        rst_i: in std_logic;
        ena_i: in std_logic;
        d_i: in std_logic_vector(N -1 downto 0);
        q_o: out std_logic_vector(N -1 downto 0)
    );
end;

architecture ffd_nb_arq of ffd_nb is

	component ffd is 
        port (
            clck_i: in  std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            d_i: in std_logic;
            q_o: out std_logic
        );
    end component;
    signal aux: std_logic_vector(N downto 0);

begin

    aux(0) <= d_i(0);
	--q_o <= aux(N);
    flipflopNb_gen: for i in 0 to N - 1 generate
        flip_flop_inst:ffd port map(clck_i => clck_i,
                                    ena_i => ena_i,
                                    rst_i => rst_i,
                                    d_i => aux(i), 
                                    q_o => aux(i+1));
        end generate;  

end;


