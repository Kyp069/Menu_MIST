derive_pll_clocks
derive_clock_uncertainty

create_clock -name CLOCK_27 -period 20.000 [get_ports CLOCK_27]
create_clock -name SPI_SCK  -period 41.666 -waveform { 20.8 41.666 } [get_ports SPI_SCK]

set_clock_groups -asynchronous \
	-group [get_clocks SPI_SCK] \
	-group [get_clocks CLOCK_27] \
	-group [get_clocks pll|altpll_component|auto_generated|pll1|clk[*]]

set_false_path -to   {LED}
set_false_path -to   {VGA*}
set_false_path -to   {SPI*}
set_false_path -to   {UART*}
set_false_path -to   {AUDIO*}
set_false_path -to   {SDRAM*}

set_false_path -from {SPI*}
set_false_path -from {CONF*}
set_false_path -from {UART*}
set_false_path -from {SDRAM*}
