
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test_mem_donnees IS
END test_mem_donnees;
 
ARCHITECTURE behavior OF test_mem_donnees IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem_donnees
    PORT(
         ADDR : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         RW : IN  std_logic;
         RST : IN  std_logic;
         VALUE_IN : IN  std_logic_vector(7 downto 0);
         VALUE_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADDR : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RW : std_logic := '0';
   signal RST : std_logic := '0';
   signal VALUE_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal VALUE_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mem_donnees PORT MAP (
          ADDR => ADDR,
          CLK => CLK,
          RW => RW,
          RST => RST,
          VALUE_IN => VALUE_IN,
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
	
	RW <= '1', '0' after 150ns, '1' after 300ns;
	VALUE_IN <= x"FF";
	ADDR <= x"00", x"01" after 25ns;
	RST <= '1' after 500ns, '0' after 510ns;

END;
