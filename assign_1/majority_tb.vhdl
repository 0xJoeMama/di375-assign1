library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity majority_tb is
end entity majority_tb;

architecture structural of majority_tb is
  component majority is
    port(
    a, b, c: in STD_LOGIC;
    y: out STD_LOGIC
    );
  end component majority;
  signal inSi : STD_LOGIC_VECTOR(2 downto 0);
  signal yOut: STD_LOGIC;
begin
  uut: majority port map(inSi(2), inSi(1), inSi(0), yOut);

  process
  begin
    for i in 0 to 7 loop
      inSi <= STD_LOGIC_VECTOR(to_unsigned(i, 3));
      wait for 10 ns;
      if i < 3 or i = 4 then
        assert yOut = '0' report "Bad result" severity FAILURE;
      else
        assert yOut = '1' report "Bad result" severity FAILURE;
      end if;
    end loop;
    report "Tests passed" severity NOTE;
    wait;
  end process;

end architecture structural;
