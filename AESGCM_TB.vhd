LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.NUMERIC_STD.ALL;

ENTITY AESGCM_TB IS END ENTITY;

ARCHITECTURE ARCH_AESGCM_TB OF AESGCM_TB IS
	COMPONENT AESGCM IS PORT
	(
		INIT :  IN  STD_LOGIC;
		RD :  IN  STD_LOGIC;
		WR :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		ADDR :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DIN :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DOUT :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
	END COMPONENT;

	SIGNAL INIT :  STD_LOGIC := '0';
	SIGNAL RD :    STD_LOGIC := '0';
	SIGNAL WR :   STD_LOGIC := '0';
	SIGNAL CLK :   STD_LOGIC := '0';
	SIGNAL ADDR :   STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL DIN :   STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL DOUT :   STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	
	SIGNAL CLKp :time := 40 ns;
BEGIN
	tb: AESGCM PORT MAP (INIT, RD, WR, CLK, ADDR, DIN, DOUT);

	PROCESS
	BEGIN
		CLK <= '0'; wait for CLKp / 2;
		CLK <= '1'; wait for CLKp / 2;
	END PROCESS;

	PROCESS
	BEGIN 
		INIT <= '1'; RD <= '0'; WR <= '0'; ADDR <= X"00000000"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000000"; DIN <= X"00010203"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000001"; DIN <= X"04050607"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000002"; DIN <= X"08090a0b"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000003"; DIN <= X"0c0d0e0f"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000004"; DIN <= X"00112233"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000005"; DIN <= X"44556677"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000006"; DIN <= X"8899aabb"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000007"; DIN <= X"ccddeeff"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '0'; ADDR <= X"00000000"; DIN <= X"00000000"; wait for 45*CLKp;
		INIT <= '0'; RD <= '1'; WR <= '0'; ADDR <= X"00000000"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; RD <= '1'; WR <= '0'; ADDR <= X"00000001"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; RD <= '1'; WR <= '0'; ADDR <= X"00000002"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; RD <= '1'; WR <= '0'; ADDR <= X"00000003"; DIN <= X"00000000"; wait for CLKp;

		wait;
	END PROCESS;
END ARCHITECTURE;