library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity majority_tb is
  -- no ports since we don't communicate with anything from the outside
end entity majority_tb;

architecture Structural of majority_tb is
  -- declare the majority component so we can use it
  component majority is
    port(
    a, b, c: in STD_LOGIC;
    y: out STD_LOGIC
    );
  end component majority;

  -- signals connected to the inputs of our component
  signal a_in, b_in, c_in: STD_LOGIC;
  -- signal connected to the output of our component
  signal res: STD_LOGIC;
begin
  -- assign the signals we use to ports
  major1: majority port map(
    a => a_in, 
    b => b_in, 
    c => c_in,
    y => res
  );

  process
    variable inSi: STD_LOGIC_VECTOR(2 downto 0);
  begin
    -- loop through all 3 bit numbers
    for i in 0 to 7 loop
      -- turn the number into an std logic vector so we can access every bit separately
      inSi := STD_LOGIC_VECTOR(TO_UNSIGNED(i, 3));
      -- a is LSB
      a_in <= inSi(0);
      -- b is the middle bit
      b_in <= inSi(1);
      -- c is MSB
      c_in <= inSi(2);
      -- wait so that the signals change values here
      wait for 20 ns;

      -- numbers less than 3 are 000, 001, 010 and 4 is 100 which are the only cases that majority is 0
      if i < 3 or i = 4 then
        -- make sure res is 0 otherwise something went incredibly bad
        assert res = '0' report "Bad result" severity FAILURE;
      else
        -- otherwise we are either 3 = 011 or 5 = 101 or 6 = 110 or 7 = 111 which all have at least 2 1s in them so that means majority should be one
        -- make sure res is 1 otherwise something went incredibly bad
        assert res = '1' report "Bad result" severity FAILURE;
      end if;
    end loop;

    report "Tests passed" severity NOTE;
    wait;
  end process;
end architecture Structural;
