library ieee;
use ieee.std_logic_1164.all;

entity majority is
  port(
  a, b, c: in STD_LOGIC;
  y: out STD_LOGIC
  );
end entity majority;

architecture Dataflow of majority is
begin
  -- initial implementation of the circuit using AND and OR instead of NAND and OR
  y <= (a and (b or c)) or (b and c);
end architecture Dataflow;
