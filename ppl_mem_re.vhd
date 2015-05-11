
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ppl_mem_re is
	Port (
		Ain : in STD_LOGIC_VECTOR(3 downto 0);
		Bin : in STD_LOGIC_VECTOR(3 downto 0);
		OPin : in STD_LOGIC_VECTOR(3 downto 0);
		Aout : out STD_LOGIC_VECTOR(3 downto 0);
		Bout : out STD_LOGIC_VECTOR(3 downto 0);
		OPout : out STD_LOGIC_VECTOR(3 downto 0);
		CLK : in STD_LOGIC
		);
end ppl_mem_re;

architecture Behavioral of ppl_mem_re is

begin
	process 
	begin
		wait until CLK'event and CLK = '1';
		Aout <= Ain;
		Bout <= Bin;
		OPout <= OPin;
	end process;

end Behavioral;

