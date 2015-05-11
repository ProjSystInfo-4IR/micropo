
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ip is
	Port (
		INSTR_PTR : out STD_LOGIC_VECTOR(7 downto 0);
		CLK : in STD_LOGIC
		);
end ip;

architecture Behavioral of ip is
	signal TMP : STD_LOGIC_VECTOR(7 downto 0) :=  x"00";

begin
	process
	begin
		wait until CLK'event and CLK = '1';
		TMP <= TMP + CONV_STD_LOGIC_VECTOR(1, 8);
	end process;
	INSTR_PTR <= TMP;
end Behavioral;

