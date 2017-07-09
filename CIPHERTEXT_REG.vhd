LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY CIPHERTEXT_REG IS
	PORT
	(
		CLK		:IN STD_LOGIC;
		INIT		:IN STD_LOGIC;
		RD			:IN STD_LOGIC;
		DATA_WR	:IN STD_LOGIC;
		ADDR		:IN STD_LOGIC_VECTOR(31 downto 0);
		DIN		:IN STD_LOGIC_VECTOR(127 downto 0);
		DOUT		:OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END ENTITY;

ARCHITECTURE ARCH_CIPHERTEXT_REG OF CIPHERTEXT_REG IS
	TYPE MEMORY_BLOCK IS ARRAY (0 to 3) OF STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL CPTX		:MEMORY_BLOCK := (OTHERS => (OTHERS => '0'));
BEGIN
	PROCESS(CLK, INIT)
	BEGIN
		IF INIT = '1' THEN
			CPTX	<= (OTHERS => (OTHERS => '0'));
		ELSIF CLK = '1' AND CLK'EVENT THEN
			IF DATA_WR = '1' THEN
				CPTX(0)	<= DIN(127 downto 96);
				CPTX(1)	<= DIN(95 downto 64);
				CPTX(2)	<= DIN(63 downto 32);
				CPTX(3)	<= DIN(31 downto 0);
			END IF;
			IF RD = '1' THEN
				DOUT	<= CPTX(conv_integer(ADDR));
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;