library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controleur_aleas is
	port 
	(
		li_di_OP : in std_logic_vector(7 downto 0);
		li_di_B : in std_logic_vector(7 downto 0);
		li_di_C : in std_logic_vector(7 downto 0);
		li_di_in_OP : out std_logic_vector(7 downto 0);
		di_ex_in_OP : in std_logic_vector(7 downto 0);
		di_ex_in_A : in std_logic_vector(7 downto 0);
		ex_mem_OP : in std_logic_vector(7 downto 0);
		ex_mem_A : in std_logic_vector(7 downto 0);
		enable : out std_logic
	);
end controleur_aleas;

architecture Behavioral of controleur_aleas is
	signal non_aleas : std_logic := '1';
begin
	non_aleas <= 
	'0' when 
			not(li_di_OP = x"06") and 
			not(li_di_OP = x"07") and 
			not(li_di_OP = x"00") and
			not(li_di_OP = "UUUUUUUU") and
			((	
				not(di_ex_in_OP = x"08") and
				not(di_ex_in_OP = x"00") and
				not(di_ex_in_OP = "UUUUUUUU") and
				(li_di_B = di_ex_in_A or li_di_C = di_ex_in_A)
			) 
			or
			(
				not(ex_mem_OP = x"08") and
				not(ex_mem_OP = x"00") and
				not(ex_mem_OP = "UUUUUUUU") and
				(li_di_B = ex_mem_A or li_di_C = ex_mem_A)
			))
	else '1';
	
	enable <= non_aleas;

   li_di_in_OP <= li_di_OP when non_aleas = '1' else x"00";
	
end Behavioral;

