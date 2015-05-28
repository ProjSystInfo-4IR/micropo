library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_mem_donnees_in is
	port ( 
		Ain : in STD_LOGIC_VECTOR(7 downto 0);
		Bin : in STD_LOGIC_VECTOR(7 downto 0);
		OPin : in STD_LOGIC_VECTOR(7 downto 0);
		Bout : out STD_LOGIC_VECTOR(7 downto 0)
	);
end mux_mem_donnees_in;

architecture Behavioral of mux_mem_donnees_in is

begin
	with OPin select Bout <=
	  Ain  when x"08",          -- STR
	  Bin when others;

end Behavioral;

