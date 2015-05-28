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
           VALUE_OUT : out STD_LOGIC_VECTOR (31 downto 0));
end mem_instr;

architecture Behavioral of mem_instr is

--type INDEX1 is INTEGER range 0 to 255;
type MEM_TAB is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);

signal N : STD_LOGIC_VECTOR(31 downto 0);
signal MEM : MEM_TAB := (--0 => x"06010200",  -- AFC 1 2
								-- cas écriture et lecture simultané
								 --3 => x"05020100",  -- COP 2 1
								 --4 => x"06030200",  -- AFC 3 2
								 --6 => x"01040102",  -- ADD 4 1 2
								 --7 => x"03050802",  -- SOU 5 8 2
								 --10 => x"02060304", -- MUL 6 3 4
								 --11 => x"04070804", -- DIV 7 8 3,
								 12 => x"07090100", -- LOAD 9 1,
								 13 => x"08010200",   -- STR 1 2  
						  others => x"00000000");	
begin
	process 
	begin
	wait until CLK'event and CLK = '1';
		N <= MEM(CONV_INTEGER(ADDR));
	end process;
	VALUE_OUT <= N;

end Behavioral;

