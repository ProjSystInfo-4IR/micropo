
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lc_mem is
	Port (
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC
		);
end lc_mem;

architecture Behavioral of lc_mem is

begin
	with OPin select OPout <=
		'0' when x"08",        -- STORE, mode écriture
		'1' when others;

end Behavioral;

