LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.NUMERIC_STD.ALL;

ENTITY KEY_SCHEDULE_TB IS END ENTITY;

ARCHITECTURE ARCH_KEY_SCHEDULE_TB OF KEY_SCHEDULE_TB IS
	COMPONENT KEY_SCHEDULE IS PORT
	(
		CLK			:IN STD_LOGIC;
		INIT			:IN STD_LOGIC;
		RUN_SCHEDULE:IN STD_LOGIC;
		KEY			:IN STD_LOGIC_VECTOR(127 downto 0);
		ROUND_KEY	:OUT STD_LOGIC_VECTOR(127 downto 0)
	);
	END COMPONENT;

	SIGNAL CLK			: STD_LOGIC := '0';
	SIGNAL INIT			: STD_LOGIC := '0';
	SIGNAL RUN_SCHEDULE: STD_LOGIC := '0';
	SIGNAL KEY			: STD_LOGIC_VECTOR(127 downto 0) := (OTHERS => '0');
	SIGNAL ROUND_KEY	: STD_LOGIC_VECTOR(127 downto 0) := (OTHERS => '0');
	
	SIGNAL CLKp :time := 40 ns;
BEGIN
	tb: KEY_SCHEDULE PORT MAP (CLK, INIT, RUN_SCHEDULE, KEY, ROUND_KEY);

	PROCESS
	BEGIN
		CLK <= '0'; wait for CLKp / 2;
		CLK <= '1'; wait for CLKp / 2;
	END PROCESS;

	PROCESS
	BEGIN
		INIT <= '1'; RUN_SCHEDULE <= '0'; KEY <= X"5468617473206D79204B756E67204675"; wait for CLKp;
		INIT <= '0'; RUN_SCHEDULE <= '1'; KEY <= X"5468617473206D79204B756E67204675"; wait for 33*CLKp;
		
		wait;
	END PROCESS;
END ARCHITECTURE;