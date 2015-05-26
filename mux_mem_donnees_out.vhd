library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_mem_donnees_out is
	port ( 
		Bin : in STD_LOGIC_VECTOR(7 downto 0);
		MEMin : in STD_LOGIC_VECTOR(7 downto 0);
		OPin : in STD_LOGIC_VECTOR(7 downto 0);
		Bout : out STD_LOGIC_VECTOR(7 downto 0)
	);
end mux_mem_donnees_out;

architecture Behavioral of mux_mem_donnees_out is

begin
	with OPin select Bout <=
	  MEMin  when x"07",          -- LOAD
	  Bin when others;

end Behavioral;

