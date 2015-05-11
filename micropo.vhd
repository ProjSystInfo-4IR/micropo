
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity micropo is
Port (
	CLK : in STD_LOGIC
	);
end micropo;

architecture Structural of micropo is

	component banc_registres
		port (
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
	end component;
	
	component ip 
		port (
			INSTR_PTR : out STD_LOGIC_VECTOR(7 downto 0);
			CLK : in STD_LOGIC
			);
	end component;
	
	component lc_reg
		port (
			OPin : in STD_LOGIC_VECTOR(3 downto 0);
			OPout : out STD_LOGIC
		);
	end component;
	
	component mem_donnees
		port (
			ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
			CLK : in  STD_LOGIC;
			RW : in STD_LOGIC;
			RST : in STD_LOGIC;
			VALUE_IN : in STD_LOGIC_VECTOR (7 downto 0);
			VALUE_OUT : out STD_LOGIC_VECTOR (7 downto 0)
		); 
	end component;
	
	component mem_instr
		port ( ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           VALUE_OUT : out STD_LOGIC_VECTOR (31 downto 0)
			  );
	end component;
	
	component ppl_di_ex
		port (
			Ain : in STD_LOGIC_VECTOR(3 downto 0);
			Bin : in STD_LOGIC_VECTOR(3 downto 0);
			OPin : in STD_LOGIC_VECTOR(3 downto 0);
			Cin : in STD_LOGIC_VECTOR(3 downto 0);
			Aout : out STD_LOGIC_VECTOR(3 downto 0);
			Bout : out STD_LOGIC_VECTOR(3 downto 0);
			OPout : out STD_LOGIC_VECTOR(3 downto 0);
			Cout : out STD_LOGIC_VECTOR(3 downto 0);
			CLK : in STD_LOGIC
		);
	end component;
	
	component ppl_ex_mem
		port (
			Ain : in STD_LOGIC_VECTOR(3 downto 0);
			Bin : in STD_LOGIC_VECTOR(3 downto 0);
			OPin : in STD_LOGIC_VECTOR(3 downto 0);
			Aout : out STD_LOGIC_VECTOR(3 downto 0);
			Bout : out STD_LOGIC_VECTOR(3 downto 0);
			OPout : out STD_LOGIC_VECTOR(3 downto 0);
			CLK : in STD_LOGIC
			);
	end component;
	
	component ppl_li_di
		port (
			Ain : in STD_LOGIC_VECTOR(3 downto 0);
			Bin : in STD_LOGIC_VECTOR(3 downto 0);
			OPin : in STD_LOGIC_VECTOR(3 downto 0);
			Cin : in STD_LOGIC_VECTOR(3 downto 0);
			Aout : out STD_LOGIC_VECTOR(3 downto 0);
			Bout : out STD_LOGIC_VECTOR(3 downto 0);
			OPout : out STD_LOGIC_VECTOR(3 downto 0);
			Cout : out STD_LOGIC_VECTOR(3 downto 0);
			CLK : in STD_LOGIC
			);
	end component;
	
	component ppl_mem_re
		port (
			Ain : in STD_LOGIC_VECTOR(3 downto 0);
			Bin : in STD_LOGIC_VECTOR(3 downto 0);
			OPin : in STD_LOGIC_VECTOR(3 downto 0);
			Aout : out STD_LOGIC_VECTOR(3 downto 0);
			Bout : out STD_LOGIC_VECTOR(3 downto 0);
			OPout : out STD_LOGIC_VECTOR(3 downto 0);
			CLK : in STD_LOGIC
			);
	end component;
	
	component ual
		port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_ALU : in  STD_LOGIC_VECTOR (2 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
	end component;
	
begin
	
end Structural;

