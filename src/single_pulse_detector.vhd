library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity single_pulse_detector is
    port (
        clk : in std_logic;
        rst : in std_logic;
        input_signal : in std_logic;
        output_pulse : out std_logic);
end single_pulse_detector;

architecture Behavioral of single_pulse_detector is
    signal ff0 : std_logic;
    signal ff1 : std_logic;

begin

    process (clk, rst)
    begin
        if (rst = '1') then
            ff0 <= '0';
            ff1 <= '0';
        elsif rising_edge(clk) then
            ff0 <= input_signal;
            ff1 <= ff0;
            -- avoid to put else statement as the tool will synthesize but will end up creating random stuff
        end if;
    end process;

    output_pulse <= ff0 xor ff1; --rising edge detection

end Behavioral;


