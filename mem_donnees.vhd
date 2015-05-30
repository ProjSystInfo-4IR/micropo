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
	type MEM_TAB is array(32 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
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
				-- mode écriture synchrone
				MEM_DONNEES(CONV_INTEGER(ADDR)) <= VALUE_IN;			
			end if;
		end if;
	end process;
	-- mode lecture asynchrone
	VALUE_OUT <= MEM_DONNEES(CONV_INTEGER(ADDR)) when RW = '1' else x"10";


end Behavioral;

