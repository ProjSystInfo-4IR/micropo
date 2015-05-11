library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_donnees is
	Port (
		ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
	   CLK : in  STD_LOGIC;
		RW : in STD_LOGIC;
		RST : in STD_LOGIC;
		VALUE_IN : in STD_LOGIC_VECTOR (7 downto 0);
	   VALUE_OUT : out STD_LOGIC_VECTOR (7 downto 0)); 
end mem_donnees;

architecture Behavioral of mem_donnees is
	type MEM_TAB is array(255 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal N : STD_LOGIC_VECTOR(7 downto 0);
	signal MEM_DONNEES : MEM_TAB := (others => "00000000");	
begin
	process 
	begin
		wait until CLK'event and CLK = '1';
		if (RST = '1') then 
			-- remettre le contenu de la mémoire en 0x00
			MEM_DONNEES <= (others => x"00"); 
		else
			if RW = '0' then
				-- mode écriture
				MEM_DONNEES(CONV_INTEGER(ADDR)) <= VALUE_IN;
			else 
				-- mode lecture
				N <= MEM_DONNEES(CONV_INTEGER(ADDR));
			end if;
		end if;
	end process;
	VALUE_OUT <= N;

end Behavioral;

