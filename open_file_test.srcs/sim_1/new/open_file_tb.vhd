library IEEE;
library STD; use STD.TEXTIO.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;


entity open_file_tb is
--  Port ( );
end open_file_tb;

architecture Behavioral of open_file_tb is

signal clk:std_logic:='0';
constant period: time:=50 ns;



--file vectors: text;

signal n_key,d_key,e_key,message, chipher: std_logic_vector(31 downto 0);
signal r_squared: std_logic_vector(32 downto 0);
signal id: integer range 0 to 100:=33;


begin
clk <= not clk after period/2;

read_file:process
	variable v_line: line;
	variable n_key_v,d_key_v,e_key_v,message_v, cipher_v: bit_vector(31 downto 0);
	variable r_squared_v: bit_vector(32 downto 0);
	variable id_v: integer range 0 to 100;
	variable v_space: character;
	file vectors: text open read_mode is "test_data.txt";
	

begin
--	file_open(vectors, "test_data.txt", read_mode);

	while not endfile(vectors) loop
		readline(vectors, v_line);
		read(v_line, id_v);
		read(v_line, v_space);
		read(v_line, e_key_v);
		read(v_line, v_space);
		read(v_line, d_key_v);
		read(v_line, v_space);
		read(v_line, n_key_v);
		read(v_line, v_space);
		read(v_line, message_v);
		read(v_line, v_space);
		read(v_line, cipher_v);
		read(v_line, v_space);
		read(v_line, r_squared_v);
		id<=id_v;
		e_key <= to_StdLogicVector(e_key_v);
		report "id is: "& integer'image(id);--&"e_key is: "& integer'image(to_integer(unsigned(e_key)));		
		wait for 10 ns;
	end loop; 

end process read_file;

comp1: entity work.open_file port map (id=>id);
end Behavioral;
