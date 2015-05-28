library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
	
	component mux_banc_reg is
    Port ( 
		Bin : in STD_LOGIC_VECTOR(7 downto 0);
		OPin : in STD_LOGIC_VECTOR(7 downto 0);
		Qin : in STD_LOGIC_VECTOR(7 downto 0);
		Bout : out STD_LOGIC_VECTOR(7 downto 0)
		);
   end component;
	
	component ip 
		port (
			INSTR_PTR : out STD_LOGIC_VECTOR(7 downto 0);
			CLK : in STD_LOGIC;
			ENABLE : in STD_LOGIC
			);
	end component;
	
	component lc_reg
		port (
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC
		);
	end component;
	
	component mem_instr
		port ( ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           VALUE_OUT : out STD_LOGIC_VECTOR (31 downto 0);
			  ENABLE : in STD_LOGIC
			  );
	end component;
	
	component ppl_di_ex
		port (
			Ain : in STD_LOGIC_VECTOR(7 downto 0);
			Bin : in STD_LOGIC_VECTOR(7 downto 0);
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			Cin : in STD_LOGIC_VECTOR(7 downto 0);
			Aout : out STD_LOGIC_VECTOR(7 downto 0);
			Bout : out STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC_VECTOR(7 downto 0);
			Cout : out STD_LOGIC_VECTOR(7 downto 0);
			CLK : in STD_LOGIC
		);
	end component;
	
	component ppl_ex_mem
		port (
			Ain : in STD_LOGIC_VECTOR(7 downto 0);
			Bin : in STD_LOGIC_VECTOR(7 downto 0);
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			Aout : out STD_LOGIC_VECTOR(7 downto 0);
			Bout : out STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC_VECTOR(7 downto 0);
			CLK : in STD_LOGIC
			);
	end component;
	
	component ppl_li_di
		port (
			Ain : in STD_LOGIC_VECTOR(7 downto 0);
			Bin : in STD_LOGIC_VECTOR(7 downto 0);
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			Cin : in STD_LOGIC_VECTOR(7 downto 0);
			Aout : out STD_LOGIC_VECTOR(7 downto 0);
			Bout : out STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC_VECTOR(7 downto 0);
			Cout : out STD_LOGIC_VECTOR(7 downto 0);
			CLK : in STD_LOGIC
			);
	end component;
	
	component ppl_mem_re
		port (
			Ain : in STD_LOGIC_VECTOR(7 downto 0);
			Bin : in STD_LOGIC_VECTOR(7 downto 0);
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			Aout : out STD_LOGIC_VECTOR(7 downto 0);
			Bout : out STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC_VECTOR(7 downto 0);
			CLK : in STD_LOGIC
			);
	end component;
	
	component lc_ual is
		port (
				OPin : in STD_LOGIC_VECTOR(7 downto 0);
				OPout : out STD_LOGIC_VECTOR(2 downto 0)
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
	
	
	component mux_ual is
		port ( 
			Bin : in STD_LOGIC_VECTOR(7 downto 0);
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			Sin : in STD_LOGIC_VECTOR(7 downto 0);
			Bout : out STD_LOGIC_VECTOR(7 downto 0)
			);
	end component;
	
	component mux_mem_donnees_in is
	port ( 
		Ain : in STD_LOGIC_VECTOR(7 downto 0);
		Bin : in STD_LOGIC_VECTOR(7 downto 0);
		OPin : in STD_LOGIC_VECTOR(7 downto 0);
		Bout : out STD_LOGIC_VECTOR(7 downto 0)
	);
	end component;
	
	component lc_mem is
		port (
			OPin : in STD_LOGIC_VECTOR(7 downto 0);
			OPout : out STD_LOGIC
		);
	end component;
	
	component mem_donnees is 
		port (
			ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
			CLK : in  STD_LOGIC;
			RW : in STD_LOGIC;
			RST : in STD_LOGIC;
			VALUE_IN : in STD_LOGIC_VECTOR (7 downto 0);
			VALUE_OUT : out STD_LOGIC_VECTOR (7 downto 0)); 
	end component;
	
	component mux_mem_donnees_out is 
	port ( 
		Bin : in STD_LOGIC_VECTOR(7 downto 0);
		MEMin : in STD_LOGIC_VECTOR(7 downto 0);
		OPin : in STD_LOGIC_VECTOR(7 downto 0);
		Bout : out STD_LOGIC_VECTOR(7 downto 0)
	);
	end component;
	
	component controleur_aleas is
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
	end component;

	
	type ppl_io is 
	record 
		A : STD_LOGIC_VECTOR(7 downto 0);
		B : STD_LOGIC_VECTOR(7 downto 0);
		OP : STD_LOGIC_VECTOR(7 downto 0);
		C : STD_LOGIC_VECTOR(7 downto 0);
	end record ; 
	
	signal instr_ptr_out : STD_LOGIC_VECTOR(7 downto 0);
	signal mem_instr_out : std_logic_vector(31 downto 0);
	signal ppl_li_di_out : ppl_io;
	signal ppl_di_ex_out : ppl_io;
	signal ppl_ex_mem_out : ppl_io;
	signal ppl_mem_re_out : ppl_io;
	signal lc_reg_out : std_logic;
	signal banc_registres_addr_b : std_logic_vector(3 downto 0);
	signal banc_registres_qa : std_logic_vector(7 downto 0);
	signal banc_registres_qb : std_logic_vector(7 downto 0);
	signal mux_banc_reg_b_out : std_logic_vector(7 downto 0);
	signal ual_Ctrl_ALU : std_logic_vector(2 downto 0);
	signal ual_S : std_logic_vector(7 downto 0);
	signal mux_banc_ual_b_out : std_logic_vector(7 downto 0);
	signal mem_donnees_rw_in : std_logic;
	signal mem_donnees_value_out : std_logic_vector(7 downto 0);
	signal mem_donnees_addr : std_logic_vector(7 downto 0);
	signal mux_mem_donnees_b_out : std_logic_vector(7 downto 0);
	signal ppl_li_di_in_OP : std_logic_vector(7 downto 0);
	
	-- signal de gestion l'execution du code (gestion incrémentation de ip)
	signal enable : std_logic := '1';
begin
	comp_ip : ip port map
	(
		INSTR_PTR => instr_ptr_out, 
		CLK => CLK,
		ENABLE => enable
	);
	
	comp_mem_instr : mem_instr port map 
	(
		ADDR => instr_ptr_out, 
		CLK => CLK, 
		VALUE_OUT => mem_instr_out,
		ENABLE => enable
	);
	
	comp_ppl_li_di : ppl_li_di port map 
		(Ain => mem_instr_out(23 downto 16),
		 OPin => ppl_li_di_in_OP, 
		 Bin => mem_instr_out(15 downto 8),
		 Cin =>  mem_instr_out(7 downto 0),
		 Aout => ppl_li_di_out.A,
		 OPout => ppl_li_di_out.OP, 
		 Bout => ppl_li_di_out.B,
		 Cout => ppl_li_di_out.C,
		 CLK => CLK);
	
	comp_ppl_di_ex : ppl_di_ex port map
		(Ain => ppl_li_di_out.A,
		 OPin => ppl_li_di_out.OP, 
		 Bin => mux_banc_reg_b_out,
		 Cin => banc_registres_qb,
		 Aout => ppl_di_ex_out.A,
		 OPout => ppl_di_ex_out.OP, 
		 Bout => ppl_di_ex_out.B,
		 Cout => ppl_di_ex_out.C,
		 CLK => CLK);
	
	comp_ppl_ex_mem : ppl_ex_mem port map
		(Ain => ppl_di_ex_out.A,
		 OPin => ppl_di_ex_out.OP, 
		 Bin => mux_banc_ual_b_out,
		 Aout => ppl_ex_mem_out.A,
		 OPout => ppl_ex_mem_out.OP, 
		 Bout => ppl_ex_mem_out.B,
		 CLK => CLK);
	
	comp_ppl_mem_re : ppl_mem_re port map
		(Ain => ppl_ex_mem_out.A,
		 OPin => ppl_ex_mem_out.OP, 
		 Bin => mux_mem_donnees_b_out,
		 Aout => ppl_mem_re_out.A,
		 OPout => ppl_mem_re_out.OP, 
		 Bout => ppl_mem_re_out.B,
		 CLK => CLK);
	
	comp_lc_reg : lc_reg port map 
		(OPin => ppl_mem_re_out.OP,
		 OPout => lc_reg_out);
	
	comp_banc_registres : banc_registres port map 
		(ADDR_A => ppl_li_di_out.B(3 downto 0),
		ADDR_B => ppl_li_di_out.C(3 downto 0),
		ADDR_W => ppl_mem_re_out.A(3 downto 0),
		W => lc_reg_out,
		DATA => ppl_mem_re_out.B,
		RST => '1',
		CLK => CLK,
		QA => banc_registres_qa,
		QB => banc_registres_qb);
		
	comp_mux_banc_reg : mux_banc_reg port map
   (Bin  => ppl_li_di_out.B,
	 OPin => ppl_li_di_out.OP,
	 Qin => banc_registres_qa,
	 Bout => mux_banc_reg_b_out 
	);
	
	comp_ual : ual port map 
	( A => ppl_di_ex_out.B,
	  B => ppl_di_ex_out.C,
	  Ctrl_ALU => ual_Ctrl_ALU,
	  N => open,
	  O => open,
	  Z => open,
	  C => open,
	  S => ual_S
   );
	
	comp_lc_ual : lc_ual port map 
	(
		OPin => ppl_di_ex_out.OP,
		OPout => ual_Ctrl_ALU
	);

	comp_mux_ual : mux_ual port map 
	(
		Bin => ppl_di_ex_out.B,
		OPin => ppl_di_ex_out.OP,
		Sin => ual_S,
		Bout => mux_banc_ual_b_out
	);
		
	comp_lc_mem : lc_mem port map
	(
		OPin => ppl_ex_mem_out.OP,
		OPout => mem_donnees_rw_in
	);
	
	comp_mem_donnees : mem_donnees port map 
	(
		ADDR => mem_donnees_addr,
		CLK => CLK,
		RW => mem_donnees_rw_in,
		RST => '0',
		VALUE_IN => ppl_ex_mem_out.B,
		VALUE_OUT => mem_donnees_value_out
	);
	comp_mux_mem_donnees_out : mux_mem_donnees_out port map
	(
		Bin => ppl_ex_mem_out.B,
		MEMin => mem_donnees_value_out,
		OPin => ppl_ex_mem_out.OP,
		Bout => mux_mem_donnees_b_out
	);
	
	comp_mux_mem_donnees_in : mux_mem_donnees_in port map
	(
		Ain => ppl_ex_mem_out.A,
		Bin => ppl_ex_mem_out.B,
		OPin => ppl_ex_mem_out.OP,
		Bout => mem_donnees_addr
	);
	
	comp_controleur_aleas : controleur_aleas port map
	(
		li_di_OP =>  mem_instr_out(31 downto 24), 
		li_di_B =>  mem_instr_out(15 downto 8), 
		li_di_C =>  mem_instr_out(7 downto 0), 
		li_di_in_OP => ppl_li_di_in_OP,
		di_ex_in_OP => ppl_li_di_out.OP,
		di_ex_in_A => ppl_li_di_out.A,
		ex_mem_OP => ppl_di_ex_out.OP,
		ex_mem_A => ppl_di_ex_out.A,
		enable => enable
	);
end Structural;

