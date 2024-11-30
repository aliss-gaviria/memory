library ieee;
use ieee.std_logic_1164.all;
entity memorytest is
port(
address: in std_logic_vector (7 downto 0);
data_in: in std_logic_vector (7 downto 0);
writes: in std_logic;
clock: in std_logic;
reset: in std_logic;
port_in_00: in std_logic_vector(7 downto 0);
port_in_01: in std_logic_vector(7 downto 0);
data_out: out std_logic_vector (7 downto 0);
port_out_00 : out std_logic_vector(7 downto 0);
port_out_01 : out std_logic_vector(7 downto 0);
deco0,deco1,deco2,deco3: out std_logic_vector (6 downto 0)

);
end memorytest;
architecture arch_memorytest of memorytest is
component memory 
port (
address: in std_logic_vector(7 downto 0);
data_in: in std_logic_vector (7 downto 0);
writes: in std_logic;
clock: in std_logic;
reset: in std_logic;
port_in_00: in std_logic_vector(7 downto 0);
port_in_01: in std_logic_vector(7 downto 0);
data_out: out std_logic_vector (7 downto 0);
port_out_00 : out std_logic_vector(7 downto 0);
port_out_01 : out std_logic_vector(7 downto 0));
end component;
component decobcda7segmentos
	
	port
	(
		-- Input ports
	A,B,C,D	: in  std_logic;
		-- Output ports
		S : out std_logic_vector(  6 downto 0 )
		
	);
end component;
signal data_outt: std_logic_vector (7 downto 0);
signal address_high: std_logic_vector (7 downto 4);
signal address_low: std_logic_vector (3 downto 0);
begin 
address_high<= address(7 downto 4);
address_low<= address (3 downto 0);
U0: memory port map (address, data_in, writes, clock, reset, port_in_00, port_in_01, data_outt, port_out_00,port_out_01);
U1: decobcda7segmentos port map (address_high(7),address_high(6),address_high(5),address_high(4),deco0);
U2: decobcda7segmentos port map (address_low(3), address_low(2),address_low(1),address_low(0), deco1);
U3: decobcda7segmentos port map (data_outt(7),data_outt(6), data_outt(5), data_outt(4),deco2);
U4: decobcda7segmentos port map (data_outt(3),data_outt(2),data_outt(1),data_outt(0),deco3);
end arch_memorytest;