
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
			OPin : in STD_LOGIC_VECTOR(3 downto 0);
			OPout : out STD_LOGIC
		);
end lc_reg;

architecture Behavioral of lc_reg is

begin
	OPout <= '1';
	--with OPin select TMP_S <=
	--	TMP_A + TMP_B when "001",
	--	TMP_A - TMP_B when "011",
	--	A * B when "010",
	--	CONV_STD_LOGIC_VECTOR(CONV_INTEGER(TMP_A) / CONV_INTEGER(TMP_B), 16) when "100",
	--  "0000000000000000" when others;

end Behavioral;

