
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ppl_li_di is
	Port (
		Ain : in STD_LOGIC_VECTOR(7 downto 0);
		Bin : in STD_LOGIC_VECTOR(7 downto 0);
		OPin : in STD_LOGIC_VECTOR(7 downto 0);
		Cin : in STD_LOGIC_VECTOR(7 downto 0);
		Aout : out STD_LOGIC_VECTOR(7 downto 0);
		Bout : out STD_LOGIC_VECTOR(7 downto 0);
		OPout : out STD_LOGIC_VECTOR(7 downto 0);
		Cout : out STD_LOGIC_VECTOR(7 downto 0);
		CLK : in STD_LOGIC
		);
end ppl_li_di;

architecture Behavioral of ppl_li_di is

begin
	process 
	begin
		wait until CLK'event and CLK = '1';
		Aout <= Ain;
		Bout <= Bin;
		Cout <= Cin;
		OPout <= OPin;
	end process;

end Behavioral;

