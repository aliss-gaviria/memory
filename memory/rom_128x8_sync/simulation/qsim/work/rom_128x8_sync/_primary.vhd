library verilog;
use verilog.vl_types.all;
entity rom_128x8_sync is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0)
    );
end rom_128x8_sync;
