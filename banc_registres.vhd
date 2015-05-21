library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity banc_registres is
	Port (
		ADDR_A : in  STD_LOGIC_VECTOR (3 downto 0);
		ADDR_B : in  STD_LOGIC_VECTOR (3 downto 0);
		ADDR_W : in  STD_LOGIC_VECTOR (3 downto 0);
		W : in STD_LOGIC;
		DATA : in STD_LOGIC_VECTOR (7 downto 0);
		RST : in STD_LOGIC;
	   CLK : in  STD_LOGIC;
		QA : out STD_LOGIC_VECTOR (7 downto 0);
		QB : out STD_LOGIC_VECTOR (7 downto 0)
			);
end banc_registres;

architecture Behavioral of banc_registres is
type MEM_REG is array(15 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal NA : STD_LOGIC_VECTOR(7 downto 0);
	signal NB : STD_LOGIC_VECTOR(7 downto 0);
	signal BANC_REGISTRES : MEM_REG := (8 => "11111111", 
													2 => "10101010",
													others => "00000000");	
begin
	process 
	begin
		wait until CLK'event and CLK = '1';
		if (RST = '0') then 
			-- remettre le contenu de la mémoire en 0x00
			BANC_REGISTRES <= (others => x"00"); 
		else
			if W = '1' then
				-- mode écriture
				BANC_REGISTRES(CONV_INTEGER(ADDR_W)) <= DATA;
			end if;
		end if;
		-- mode lecture
		NA <= BANC_REGISTRES(CONV_INTEGER(ADDR_A));
		NB <= BANC_REGISTRES(CONV_INTEGER(ADDR_B));
	end process;
	QA <= NA;
	QB <= NB;

end Behavioral;

