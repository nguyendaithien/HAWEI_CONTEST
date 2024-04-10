set current_design CONV_ACC
#set ::env(CLOCK_PORT) [get_pins {pclk}]
#set ::env(CLOCK_NET) {core.CLK}

create_clock clk -name CLK -period 10.0

puts "\[INFO\]: Setting clock uncertainty to: 20% CLK"
set_clock_uncertainty [expr 10.0*0.2] [get_clocks clk]

set input_delay_value [expr 10.0*0.25]
set output_delay_value [expr 10.0*0.25]
puts "\[INFO\]: Setting output delay to: $output_delay_value"
puts "\[INFO\]: Setting input delay to: $input_delay_value"

set_input_delay $input_delay_value  -clock [get_clocks clk] [all_inputs]
set_output_delay $output_delay_value -clock [get_clocks clk] [all_outputs]
