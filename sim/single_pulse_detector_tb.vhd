library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity single_pulse_detector_tb is

end single_pulse_detector_tb;

architecture Behavioral of single_pulse_detector_tb is

    component single_pulse_detector is
        port (
            clk : in std_logic;
            rst : in std_logic;
            input_signal : in std_logic;
            output_pulse : out std_logic);
    end component;

    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal input_signal_tb : std_logic := '0';
    signal output_pulse_tb : std_logic := '0';

    constant CP : time := 10 ns;

begin
    uut : single_pulse_detector port map(clk => clk_tb, rst => rst_tb, input_signal => input_signal_tb, output_pulse => output_pulse_tb);

    --clock generation process
    clk_gen : process
    begin
        clk_tb <= '0';
        wait for CP/2;
        clk_tb <= '1';
        wait for CP/2;
    end process;

    --input vector
    input_gen : process
    begin
        rst_tb <= '1';
        wait for CP;
        rst_tb <= '0';
        wait for 2 * CP;

        input_signal_tb <= '1';
        wait for 5 * CP;
        input_signal_tb <= '0';
        wait for 5 * CP;
        input_signal_tb <= '1';
        wait for 5 * CP;
        input_signal_tb <= '0';
        wait for 5 * CP;
        input_signal_tb <= '1';
        wait for 5 * CP;
        input_signal_tb <= '0';
        wait;
    end process;

end Behavioral;