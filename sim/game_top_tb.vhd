library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity number_guess_tb is

end number_guess_tb;

architecture Behavioral of number_guess_tb is

    component number_guess is
        generic (
            clk_freq : integer := 50_000_000; --system clock frequency in Hz
            stable_time : integer := 10;
            seed : std_logic_vector (7 downto 0) := b"0000_0001");
        port (
            clk : in std_logic;
            rst : in std_logic;
            show : in std_logic;
            enter : in std_logic;
            capture : in std_logic;
            switches : in std_logic_vector (3 downto 0);
            leds : out std_logic_vector (3 downto 0);
            red_led : out std_logic;
            blue_led : out std_logic;
            green_led : out std_logic
        );
    end component number_guess;

    signal clk_tb, rst_tb, show_tb, enter_tb, capture_tb : std_logic;
    signal switches_tb : std_logic_vector (3 downto 0);
    signal leds_tb : std_logic_vector (3 downto 0);
    signal red_led_tb, blue_led_tb, green_led_tb : std_logic;
    constant answer : integer := 12;
    constant CP : time := 10 ns;

begin

    uut : number_guess generic map(clk_freq => 1000, stable_time => 10, seed => "10110110")
    port map(clk => clk_tb, rst => rst_tb, show => show_tb, enter => enter_tb, capture => capture_tb, switches => switches_tb, leds => leds_tb, red_led => red_led_tb, blue_led => blue_led_tb, green_led => green_led_tb);

    clk_gen : process
    begin
        clk_tb <= '1';
        wait for CP/2;
        clk_tb <= '0';
        wait for CP/2;
    end process;

    reset_gen : process
    begin
        rst_tb <= '1';
        wait for CP;
        rst_tb <= '0';
        wait;
    end process;  

    input_gen : process
    begin
        switches_tb <= (others => '0');
        wait for 5 * CP;
        enter_tb <= '1';
        wait for 20 * CP;
        enter_tb <= '0';
        wait for CP;
--        capture_tb <= '1';
--        wait for CP;
        show_tb <= '1';
        wait for 20 * CP;
        show_tb <= '0';
        wait for CP;
        switches_tb <= "1111";
        wait for CP;
        enter_tb <= '1';
        wait for 20 * CP;
        enter_tb <= '0';
        wait for CP;
        switches_tb <= "0100";
        wait for CP;
        enter_tb <= '1';
        wait for 20 * CP;
        enter_tb <= '0';
        wait for CP;
        switches_tb <= "1100";
        wait for 20 * CP;
        enter_tb <= '0';
        wait for CP;
        wait;
--        show_tb <= '0';
--        wait for CP;
--        switches_tb <= "1101";
--        wait for CP;
--        wait for 5 * CP;
--        capture_tb <= '1';
--        enter_tb <= '1';
--        wait for 20 * CP;
        
--        enter_tb <= '0';
--        wait for CP;
--        enter_tb <= '1';
--        wait for 20 * CP;
--        switches_tb <= "0001";
--        wait for CP;
--        wait;
    end process;

end Behavioral;