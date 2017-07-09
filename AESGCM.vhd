-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 15.0.0 Build 145 04/22/2015 Patches 0.01we SJ Web Edition"
-- CREATED		"Sun Jul 09 14:23:59 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY AESGCM IS 
	PORT
	(
		INIT :  IN  STD_LOGIC;
		RD :  IN  STD_LOGIC;
		WR :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		ADDR :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DIN :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DOUT :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END AESGCM;

ARCHITECTURE bdf_type OF AESGCM IS 

COMPONENT ciphertext_reg
	PORT(CLK : IN STD_LOGIC;
		 INIT : IN STD_LOGIC;
		 RD : IN STD_LOGIC;
		 DATA_WR : IN STD_LOGIC;
		 ADDR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 DIN : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		 DOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT control
	PORT(CLK : IN STD_LOGIC;
		 INIT : IN STD_LOGIC;
		 WR : IN STD_LOGIC;
		 ADDR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 DATA_WR : OUT STD_LOGIC;
		 LOAD_KEY : OUT STD_LOGIC;
		 RUN : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT key_reg
	PORT(CLK : IN STD_LOGIC;
		 INIT : IN STD_LOGIC;
		 WR : IN STD_LOGIC;
		 ADDR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 DIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 DOUT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);
END COMPONENT;

COMPONENT key_schedule
	PORT(CLK : IN STD_LOGIC;
		 INIT : IN STD_LOGIC;
		 RUN : IN STD_LOGIC;
		 LOAD_KEY : IN STD_LOGIC;
		 KEY : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		 ROUND_KEY : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);
END COMPONENT;

COMPONENT message_reg
	PORT(CLK : IN STD_LOGIC;
		 INIT : IN STD_LOGIC;
		 WR : IN STD_LOGIC;
		 ADDR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 DIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 DOUT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);
END COMPONENT;

COMPONENT round
	PORT(CLK : IN STD_LOGIC;
		 INIT : IN STD_LOGIC;
		 RUN : IN STD_LOGIC;
		 ROUND_KEY : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		 STATE_IN : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		 STATE_OUT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	DATA_WR :  STD_LOGIC;
SIGNAL	LOAD_KEY :  STD_LOGIC;
SIGNAL	ROUND_KEY :  STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL	RUN :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(127 DOWNTO 0);


BEGIN 



b2v_CIPHERTEXT_REG : ciphertext_reg
PORT MAP(CLK => CLK,
		 INIT => INIT,
		 RD => RD,
		 DATA_WR => DATA_WR,
		 ADDR => ADDR,
		 DIN => SYNTHESIZED_WIRE_0,
		 DOUT => DOUT);


b2v_CONTROL : control
PORT MAP(CLK => CLK,
		 INIT => INIT,
		 WR => WR,
		 ADDR => ADDR,
		 DATA_WR => DATA_WR,
		 LOAD_KEY => LOAD_KEY,
		 RUN => RUN);


b2v_KEY_REG : key_reg
PORT MAP(CLK => CLK,
		 INIT => INIT,
		 WR => WR,
		 ADDR => ADDR,
		 DIN => DIN,
		 DOUT => SYNTHESIZED_WIRE_1);


b2v_KEY_SCHEDULE : key_schedule
PORT MAP(CLK => CLK,
		 INIT => INIT,
		 RUN => RUN,
		 LOAD_KEY => LOAD_KEY,
		 KEY => SYNTHESIZED_WIRE_1,
		 ROUND_KEY => ROUND_KEY);


b2v_MESSAGE_REG : message_reg
PORT MAP(CLK => CLK,
		 INIT => INIT,
		 WR => WR,
		 ADDR => ADDR,
		 DIN => DIN,
		 DOUT => SYNTHESIZED_WIRE_2);


b2v_ROUND : round
PORT MAP(CLK => CLK,
		 INIT => INIT,
		 RUN => RUN,
		 ROUND_KEY => ROUND_KEY,
		 STATE_IN => SYNTHESIZED_WIRE_2,
		 STATE_OUT => SYNTHESIZED_WIRE_0);


END bdf_type;