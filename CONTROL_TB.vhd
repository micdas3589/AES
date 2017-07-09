LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.NUMERIC_STD.ALL;

ENTITY CONTROL_TB IS END ENTITY;

ARCHITECTURE ARCH_CONTROL_TB OF CONTROL_TB IS
	COMPONENT CONTROL IS PORT
	(
		CLK			:IN STD_LOGIC;
		INIT			:IN STD_LOGIC;
		RD				:IN STD_LOGIC;
		WR				:IN STD_LOGIC;
		ADDR			:IN STD_LOGIC_VECTOR(31 downto 0);
		RUN			:OUT STD_LOGIC;
		LOAD_KEY		:OUT STD_LOGIC;
		DATA_WR		:OUT STD_LOGIC
	);
	END COMPONENT;

	SIGNAL CLK			: STD_LOGIC := '0';
	SIGNAL INIT			: STD_LOGIC := '0';
	SIGNAL RD				: STD_LOGIC := '0';
	SIGNAL WR				: STD_LOGIC := '0';
	SIGNAL ADDR			: STD_LOGIC_VECTOR(31 downto 0) := (OTHERS => '0');
	SIGNAL RUN			: STD_LOGIC := '0';
	SIGNAL LOAD_KEY	: STD_LOGIC := '0';
	SIGNAL DATA_WR		: STD_LOGIC := '0';
	
	SIGNAL CLKp :time := 40 ns;
BEGIN
	tb: CONTROL PORT MAP (CLK, INIT, RD, WR, ADDR, RUN, LOAD_KEY, DATA_WR);

	PROCESS
	BEGIN
		CLK <= '0'; wait for CLKp / 2;
		CLK <= '1'; wait for CLKp / 2;
	END PROCESS;

	PROCESS
	BEGIN
		INIT <= '1'; RD <= '0'; WR <= '0'; ADDR <= X"00000000"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000000"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000001"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000002"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000003"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000004"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000005"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000006"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '1'; ADDR <= X"00000007"; wait for CLKp;
		INIT <= '0'; RD <= '0'; WR <= '0'; ADDR <= X"00000000"; wait for 120*CLKp;


		wait;
	END PROCESS;
END ARCHITECTURE;