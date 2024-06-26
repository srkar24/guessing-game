library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity rand_gen is
    generic (
        input_size : integer := 8;
        output_size : integer := 4
    );
    port (
        clk, rst : in std_logic;
        seed : in std_logic_vector(input_size - 1 downto 0);
        output : out std_logic_vector (output_size - 1 downto 0)
    );
end rand_gen;

architecture Behavioral of rand_gen is
    signal curr_state, next_state : std_logic_vector(input_size - 1 downto 0);
    signal feedback : std_logic;
    constant DEFAULT_NON_ZERO_VALUE : std_logic_vector(output_size - 1 downto 0) := (0 => '1', others => '0'); --we introduce this to ensure our output never turns 0. If it turns 0, then xor will not work.

begin
    StateReg : process (clk, rst)
    begin
        if (rst = '1') then
            curr_state <= seed; --seed is the starting point
        elsif rising_edge(clk) then
            curr_state <= next_state;
        end if;
    end process;

    feedback <= curr_state(4) xor curr_state(3) xor curr_state(2) xor curr_state(0);
    next_state <= feedback & curr_state(input_size - 1 downto 1); --working for LFSR where curr_state(0) is dropped.

    output <= DEFAULT_NON_ZERO_VALUE when unsigned(curr_state(input_size - 1 downto input_size - 4)) = 0
                                     else curr_state(input_size - 1 downto input_size - 4); --random number generated

end Behavioral;