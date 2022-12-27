# Creating SmartDesign PF_DSP_FLOW_DEMO_TOP
set sd_name {PF_DSP_FLOW_DEMO_TOP}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_RDY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SLOWCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_RDY} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {OEN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WEN} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_IN} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_OUT} -port_direction {OUT} -port_range {[7:0]}


# Add FILTERCONTROL_FSM_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {FILTERCONTROL_FSM} -hdl_file {hdl\FILTER_CONTROL_FSM.v} -instance_name {FILTERCONTROL_FSM_0}



# Add PF_COEF_BUF instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TPSRAM_0} -instance_name {PF_COEF_BUF}



# Add PF_COREFFT_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_COREFFT} -instance_name {PF_COREFFT_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREFFT_0:READ_OUTP} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREFFT_0:DATAO_VALID}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREFFT_0:BUF_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREFFT_0:PONG}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREFFT_0:DATAI_IM} -value {GND}



# Add PF_COREFIR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_COREFIR} -instance_name {PF_COREFIR_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_COREFIR_0:FIRO} -pin_slices {[13:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREFIR_0:FIRO[13:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_COREFIR_0:FIRO} -pin_slices {[29:14]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_COREFIR_0:FIRO} -pin_slices {[47:30]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREFIR_0:FIRO[47:30]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREFIR_0:RSTN} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREFIR_0:FIRO_VALID}



# Add PF_FFT_IM_BUF instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TPSRAM_3} -instance_name {PF_FFT_IM_BUF}



# Add PF_FFT_RE_BUF instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TPSRAM_4} -instance_name {PF_FFT_RE_BUF}



# Add PF_FIR_IN_BUF instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TPSRAM_1} -instance_name {PF_FIR_IN_BUF}



# Add PF_FIR_OUT_BUF instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TPSRAM_2} -instance_name {PF_FIR_OUT_BUF}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_FIR_OUT_BUF:R_ADDR} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_FIR_OUT_BUF:R_ADDR} -pin_slices {[9:8]}



# Add UART_IF_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {UART_IF} -hdl_file {hdl\UART_IF.v} -instance_name {UART_IF_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {UART_IF_0:COEF_WADDR} -pin_slices {[6:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {UART_IF_0:COEF_WADDR} -pin_slices {[7:7]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_IF_0:COEF_WADDR[7:7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {UART_IF_0:DATA_WADDR} -pin_slices {[10:10]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_IF_0:DATA_WADDR[10:10]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {UART_IF_0:DATA_WADDR} -pin_slices {[9:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {UART_IF_0:R_ADDR} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {UART_IF_0:R_ADDR} -pin_slices {[9:8]}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK" "FILTERCONTROL_FSM_0:CLK" "PF_COEF_BUF:CLK" "PF_COREFFT_0:CLK" "PF_COREFIR_0:CLK" "PF_FFT_IM_BUF:CLK" "PF_FFT_RE_BUF:CLK" "PF_FIR_IN_BUF:CLK" "PF_FIR_OUT_BUF:CLK" "UART_IF_0:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:COEF_I_VALID" "PF_COREFIR_0:COEFI_VALID" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:COEF_ON" "PF_COREFIR_0:COEF_ON" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:COEF_RD_ENABLE" "PF_COEF_BUF:R_EN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:DATA_I_VALID" "PF_COREFIR_0:DATAI_VALID" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:FFT_I_VALID" "PF_COREFFT_0:DATAI_VALID" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:FFT_START" "PF_COREFFT_0:OUTP_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:FFT_WR_ENABLE" "PF_FFT_IM_BUF:W_EN" "PF_FFT_RE_BUF:W_EN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:FILTER_COMPLETE" "UART_IF_0:FILTER_COMPLETE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:FIR_WR_ENABLE" "PF_FIR_IN_BUF:R_EN" "PF_FIR_OUT_BUF:W_EN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:RESET_N" "PF_COREFFT_0:NGRST" "PF_COREFIR_0:NGRST" "RESET_N" "UART_IF_0:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:SEL" "UART_IF_0:SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OEN" "UART_IF_0:OEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COEF_BUF:W_EN" "UART_IF_0:COEF_WEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREFFT_0:SLOWCLK" "SLOWCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FFT_IM_BUF:R_EN" "UART_IF_0:FFT_IM_REN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FFT_RE_BUF:R_EN" "UART_IF_0:FFT_RE_REN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FIR_IN_BUF:W_EN" "UART_IF_0:DATA_WEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FIR_OUT_BUF:R_EN" "UART_IF_0:FIR_OUT_REN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX_RDY" "UART_IF_0:RX_RDY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX_RDY" "UART_IF_0:TX_RDY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_IF_0:WEN" "WEN" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_IN" "UART_IF_0:DATA_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_OUT" "UART_IF_0:DATA_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:COEF_RADDR" "PF_COEF_BUF:R_ADDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:FFT_WADDR" "PF_FFT_IM_BUF:W_ADDR" "PF_FFT_RE_BUF:W_ADDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FILTERCONTROL_FSM_0:FIR_WR_ADDR" "PF_FIR_IN_BUF:R_ADDR" "PF_FIR_OUT_BUF:W_ADDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COEF_BUF:R_DATA" "PF_COREFIR_0:COEFI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COEF_BUF:W_ADDR" "UART_IF_0:COEF_WADDR[6:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COEF_BUF:W_DATA" "PF_FIR_IN_BUF:W_DATA" "UART_IF_0:WDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREFFT_0:DATAI_RE" "PF_COREFIR_0:FIRO[29:14]" "PF_FIR_OUT_BUF:W_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREFFT_0:DATAO_IM" "PF_FFT_IM_BUF:W_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREFFT_0:DATAO_RE" "PF_FFT_RE_BUF:W_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREFIR_0:DATAI" "PF_FIR_IN_BUF:R_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FFT_IM_BUF:R_ADDR" "PF_FFT_RE_BUF:R_ADDR" "PF_FIR_OUT_BUF:R_ADDR[7:0]" "UART_IF_0:R_ADDR[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FFT_IM_BUF:R_DATA" "UART_IF_0:FFT_IM_RDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FFT_RE_BUF:R_DATA" "UART_IF_0:FFT_RE_RDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FIR_IN_BUF:W_ADDR" "UART_IF_0:DATA_WADDR[9:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FIR_OUT_BUF:R_ADDR[9:8]" "UART_IF_0:R_ADDR[9:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_FIR_OUT_BUF:R_DATA" "UART_IF_0:FIR_OUT_RDATA" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign PF_DSP_FLOW_DEMO_TOP
generate_component -component_name ${sd_name}
