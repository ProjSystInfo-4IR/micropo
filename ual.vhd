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
	signal TMP_S : STD_LOGIC_VECTOR (15 downto 0);
	signal TMP_A : STD_LOGIC_VECTOR (15 downto 0);
	signal TMP_B : STD_LOGIC_VECTOR (15 downto 0);
begin

	TMP_A(7 downto 0) <= A;
	TMP_A(15 downto 8) <= "00000000";
	TMP_B(7 downto 0) <= B;
	TMP_B(15 downto 8) <= "00000000";
	
	with Ctrl_ALU select TMP_S <=
		TMP_A + TMP_B when "001",
		TMP_A - TMP_B when "011",
		A * B when "010",
		CONV_STD_LOGIC_VECTOR(CONV_INTEGER(TMP_A) / CONV_INTEGER(TMP_B), 16) when "100",
	  "0000000000000000" when others;
	  
	  S <= TMP_S(7 downto 0);
	  N <= TMP_S(7);
	  with TMP_S select Z <=
		'1' when "0000000000000000",
		'0' when others;
	  with TMP_S(15 downto 8) select O <=
		'0' when "00000000",
		'1' when others;	
	  C <= TMP_S(8);
end Behavioral;
