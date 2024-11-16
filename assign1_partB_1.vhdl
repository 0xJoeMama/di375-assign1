library IEEE;

use IEEE.STD_LOGIC_1164.all;

entity Lab2_1 is
  port(
  a, b, c: in STD_LOGIC;
  y, z: out STD_LOGIC
  );
end Lab2_1;

architecture synth of Lab2_1 is
begin
  y <= (a and not b and not c) or (a and b and c) or not a;
  z <= (a and not b) or (not a and b);
end architecture synth;
