LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE IEEE.NUMERIC_STD.ALL;

ENTITY CONTROL IS
	PORT (
		CLK			:IN STD_LOGIC;
		INIT			:IN STD_LOGIC;
		RD				:IN STD_LOGIC;
		WR				:IN STD_LOGIC;
		MAX_COUNTER	:IN STD_LOGIC;
		ADDR			:IN STD_LOGIC_VECTOR(31 downto 0)
	);
END ENTITY;

ARCHITECTURE ARCH_CONTROL OF CONTROL IS
BEGIN
	PROCESS(CLK)
	BEGIN
		IF CLK = '1' AND CLK'EVENT THEN
			
		END IF;
	END PROCESS;
END ARCHITECTURE;