
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lc_reg is
	Port (
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC
		);
end lc_reg;

architecture Behavioral of lc_reg is

begin
	-- Action write dans la banc de registres 
	-- sauf dans le cas d'un STORE (opcode 0x08)
	with OPin select OPout <=
		'0' when x"08",
		'1' when others;

end Behavioral;

