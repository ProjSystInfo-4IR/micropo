library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_instr is
    Port ( ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           VALUE_OUT : out STD_LOGIC_VECTOR (31 downto 0));
end mem_instr;

architecture Behavioral of mem_instr is

--type INDEX1 is INTEGER range 0 to 255;
type MEM_TAB is array(255 downto 0) of STD_LOGIC_VECTOR(31 downto 0);

signal N : STD_LOGIC_VECTOR(31 downto 0);
signal MEM : MEM_TAB := (1 => "01011010000000000000000000000000",
								others => "00000000000000000000000000000000");	
begin
	process 
	begin
	wait until CLK'event and CLK = '1';
		N <= MEM(CONV_INTEGER(ADDR));
	end process;
	VALUE_OUT <= N;
	--MEM(0) <= "01011010000000000000000000000000";

end Behavioral;

