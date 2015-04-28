library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

type INDEX is INTEGER range 0 to 255;
type MEM_TAB is array(INDEX) of STD_LOGIC_VECTOR(31 down to 0);

entity memoire_instr is
    Port (  @ : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           OUT : in  STD_LOGIC_VECTOR (31 downto 0));
end memoire_instr;

architecture Behavioral of memoire_instr is
signal N : STD_LOGIC_VECTOR(31 down to 0);
signal MEM : MEM_TAB;	
begin
	process 
	begin
	wait until CLK'event and CLK = '1';
		N := MEM[@];
	end process;
	OUT := N;

end Behavioral;

