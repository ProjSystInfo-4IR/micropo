LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_micropo IS
END test_micropo;
 
ARCHITECTURE behavior OF test_micropo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT micropo
    PORT(
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
	constant period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: micropo PORT MAP (
          CLK => CLK
        );
		  
	CLK <= not CLK after period/2;
	
END;
