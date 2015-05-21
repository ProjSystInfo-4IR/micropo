library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_banc-reg is
    Port ( 
		Bin : in STD_LOGIC_VECTOR(7 downto 0);
		OPin : in STD_LOGIC_VECTOR(7 downto 0);
		Qin : in STD_LOGIC_VECTOR(7 downto 0);
		Bout : out STD_LOGIC_VECTOR(7 downto 0);
		OPout : out STD_LOGIC_VECTOR(7 downto 0);
		);
end mux_banc-reg;

architecture Behavioral of mux_banc-reg is

begin
with OPin select Bout <=
	  Bin  when x"06",
	  Qin	 when others;

end Behavioral;

