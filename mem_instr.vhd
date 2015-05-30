library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_instr is
    Port ( ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           VALUE_OUT : out STD_LOGIC_VECTOR (31 downto 0);
			  ENABLE : in STD_LOGIC 
			 );
end mem_instr;

architecture Behavioral of mem_instr is

--type INDEX1 is INTEGER range 0 to 255;
type MEM_TAB is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);

signal N : STD_LOGIC_VECTOR(31 downto 0);
signal MEM : MEM_TAB := 
	(
		0 => x"06010200",   -- AFC  1  2
		1 => x"05020100",   -- COP  2  1
		2 => x"06030100",   -- AFC  3  1
		3 => x"01040102",   -- ADD  4  1  2
		4 => x"03050403",   -- SOU  5  4  3
		5 => x"02060405",   -- MUL  6  4 5
		6 => x"04070602",   -- DIV  7  6 2 
		7 => x"08020700",   -- STR  2  7
		8 => x"07090200",   -- LOAD 9  2    
		9 => x"060A0500",   -- AFC  10 5
		10 => x"060B0800",  -- AFC  11 8
		11 => x"010C0A0B",  -- ADD  12 10 11		   
		others => x"00000000"
	);	
begin
	process 
	begin
	wait until CLK'event and CLK = '1';
		if (ENABLE = '1') then
			N <= MEM(CONV_INTEGER(ADDR));
		else 
			N <= N;
		end if;
	end process;
	VALUE_OUT <= N;

end Behavioral;

