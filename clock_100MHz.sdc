create_clock -name CLK -period 10.000 [get_ports {CLK}]
derive_clock_uncertainty
set_input_delay  -clock {CLK} 1 [all_inputs]
set_output_delay -clock {CLK} 1 [all_outputs]
