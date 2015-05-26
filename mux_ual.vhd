
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_ual is
	port ( 
		Bin : in STD_LOGIC_VECTOR(7 downto 0);
		OPin : in STD_LOGIC_VECTOR(7 downto 0);
		Sin : in STD_LOGIC_VECTOR(7 downto 0);
		Bout : out STD_LOGIC_VECTOR(7 downto 0)
		);
end mux_ual;

architecture Behavioral of mux_ual is

begin
	with OPin select Bout <=
		  Sin  when x"01",          -- ADD
		  Sin  when x"02",          -- MUL
		  Sin  when x"03",          -- SOU
		  Sin  when x"04",          -- DIV
		  Bin	 when others;
end Behavioral;

