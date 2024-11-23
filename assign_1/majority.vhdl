library ieee;
use ieee.std_logic_1164.all;


entity majority is
  port(
  a, b, c: in STD_LOGIC;
  y: out STD_LOGIC
  );
end entity majority;

architecture dataflow of majority is
begin
  y <= (a nand (b or c)) nand (b nand c);
end architecture dataflow;
