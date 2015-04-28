library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ual is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_ALU : in  STD_LOGIC_VECTOR (2 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end ual;

architecture Behavioral of ual is
	
begin
	
	with Ctrl_ALU select S <= 
		A + B when "001",
	  "00000000" when others;
	  
--	if (Ctrl_ALU = "001") then 
--		S <= A + B;
--		N <= '0';
--		O <= '0';
--		Z <= '0';
--		C <= '0';
--	else 
--		S <= x"FF";
--		N <= '1';
--		O <= '1';
--		Z <= '1';
--		C <= '1';
--	end if;	

end Behavioral;
