
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entité mapping entre l'opcode et Ctrl_ALU
entity lc_ual is
	Port (
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC_VECTOR(2 downto 0)
		);
end lc_ual;

architecture Behavioral of lc_ual is

begin
	with OPin select OPout <=
		"001" when x"01",       -- ADD
		"011" when x"03",       -- SOU 
		"010" when x"02",       -- MUL
		"100" when x"04",       -- DIV
		"111" when others;

end Behavioral;

