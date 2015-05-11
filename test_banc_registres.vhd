
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_banc_registres IS
END test_banc_registres;
 
ARCHITECTURE behavior OF test_banc_registres IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT banc_registres
    PORT(
         ADDR_A : IN  std_logic_vector(3 downto 0);
         ADDR_B : IN  std_logic_vector(3 downto 0);
         ADDR_W : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADDR_A : std_logic_vector(3 downto 0) := (others => '0');
   signal ADDR_B : std_logic_vector(3 downto 0) := (others => '0');
   signal ADDR_W : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: banc_registres PORT MAP (
          ADDR_A => ADDR_A,
          ADDR_B => ADDR_B,
          ADDR_W => ADDR_W,
          W => W,
          DATA => DATA,
          RST => RST,
          CLK => CLK,
          QA => QA,
          QB => QB
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

	RST <= '1', '0' after 120ns, '1' after 130ns;
	ADDR_W <= x"A" after 50ns;
	W <= '0', '1' after 50ns, '0' after 60ns;
	DATA <= x"51" after 50ns;
	ADDR_A <= x"A" after 100ns;
END;
