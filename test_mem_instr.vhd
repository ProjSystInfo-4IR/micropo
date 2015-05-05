
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_mem_instr IS
END test_mem_instr;
 
ARCHITECTURE behavior OF test_mem_instr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem_instr
    PORT(
         ADDR : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         VALUE_OUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADDR : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal VALUE_OUT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mem_instr PORT MAP (
          ADDR => ADDR,
          CLK => CLK,
          VALUE_OUT => VALUE_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;
	
	ADDR <= "00000001" after 12ns;

END;
