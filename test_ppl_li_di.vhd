
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_ppl_li_di IS
END test_ppl_li_di;
 
ARCHITECTURE behavior OF test_ppl_li_di IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ppl_li_di
    PORT(
         Ain : IN  std_logic_vector(3 downto 0);
         Bin : IN  std_logic_vector(3 downto 0);
         OPin : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic_vector(3 downto 0);
         Aout : OUT  std_logic_vector(3 downto 0);
         Bout : OUT  std_logic_vector(3 downto 0);
         OPout : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic_vector(3 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(3 downto 0) := (others => '0');
   signal Bin : std_logic_vector(3 downto 0) := (others => '0');
   signal OPin : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal Aout : std_logic_vector(3 downto 0);
   signal Bout : std_logic_vector(3 downto 0);
   signal OPout : std_logic_vector(3 downto 0);
   signal Cout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ppl_li_di PORT MAP (
          Ain => Ain,
          Bin => Bin,
          OPin => OPin,
          Cin => Cin,
          Aout => Aout,
          Bout => Bout,
          OPout => OPout,
          Cout => Cout,
          CLK => CLK
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

	Ain <= "0001" after 50ns, "0000" after 100ns;
	Bin <= "0011" after 50ns, "0000" after 100ns;
	Cin <= "0111" after 50ns, "0000" after 100ns;
	OPin <= "1111" after 50ns, "0000" after 100ns;
END;
