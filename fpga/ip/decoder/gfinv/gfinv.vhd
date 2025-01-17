library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gfinv is
  port (
  	-- Inputs
  	clk : in std_logic;
  	rst : in std_logic;
  	operand : in std_logic_vector(7 downto 0);
	
	-- Outputs
	rslt : out std_logic_vector(7 downto 0));
end entity ; -- gfinv

architecture rtl of gfinv is
	
	type int_array is array (natural range <>) of integer;
	constant inv : int_array(1 to 254) := (1,142,244,71,167,122,186,
		173,157,221,152,61,170,93,150,216,114,192,88,224,62,76,102,
		144,222,85,128,160,131,75,42,108,237,57,81,96,86,44,138,112,
		208,31,74,38,139,51,110,72,137,111,46,164,195,64,94,80,34,207,
		169,171,12,21,225,54,95,248,213,146,78,166,4,48,136,43,30,22,
		103,69,147,56,35,104,140,129,26,37,97,19,193,203,99,151,14,55,
		65,36,87,202,91,185,196,23,77,82,141,239,179,32,236,47,50,40,
		209,17,217,233,251,218,121,219,119,6,187,132,205,254,252,27,
		84,161,29,124,204,228,176,73,49,39,45,83,105,2,245,24,223,68,
		79,155,188,15,92,11,220,189,148,172,9,199,162,28,130,159,198,52,
		194,70,5,206,59,13,60,156,8,190,183,135,229,238,107,235,242,191,
		175,197,100,7,123,149,154,174,182,18,89,165,53,101,184,163,158,
		210,247,98,90,133,125,168,58,41,113,200,246,249,67,215,214,16,
		115,118,120,153,10,25,145,20,63,230,240,134,177,226,241,250,116,
		243,180,109,33,178,106,227,231,181,234,3,143,211,201,66,212,232,
		117,127,255,126);

begin

	process(clk,rst) is
	begin
		if rst = '0' then
			rslt <= (others=>'0');
		elsif clk'event and clk = '1' then
			if to_integer(unsigned(operand)) > 0 then
				rslt <= std_logic_vector(to_unsigned(inv(to_integer(unsigned(operand))),rslt'length));
			end if;
		end if;
	end process;

end architecture ; -- rtl