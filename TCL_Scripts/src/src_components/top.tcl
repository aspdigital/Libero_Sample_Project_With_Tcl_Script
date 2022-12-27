# Creating SmartDesign top
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {switch_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}



# Add Debounce_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {Debounce} -hdl_file {hdl\Debounce.v} -instance_name {Debounce_0}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add PF_ccc_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_ccc_0} -instance_name {PF_ccc_0_0}



# Add PF_COREUART_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_COREUART_0} -instance_name {PF_COREUART_0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:BIT8} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:CSN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:ODD_N_EVEN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:OVERFLOW}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:PARITY_EN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:FRAMING_ERR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:BAUD_VAL} -value {0000001101011}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_COREUART_0_0:BAUD_VAL_FRACTION} -value {100}



# Add PF_DSP_FLOW_DEMO_TOP_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DSP_FLOW_DEMO_TOP} -instance_name {PF_DSP_FLOW_DEMO_TOP_0}



# Add PF_init_monitor_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_init_monitor_0} -instance_name {PF_init_monitor_0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_init_monitor_0_0:AUTOCALIB_DONE}



# Add reset_sync_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {reset_sync} -instance_name {reset_sync_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_sync_0:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {reset_sync_0:PLL_POWERDOWN_B}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Debounce_0:clk_i" "PF_COREUART_0_0:CLK" "PF_DSP_FLOW_DEMO_TOP_0:CLK" "PF_ccc_0_0:OUT0_FABCLK_0" "reset_sync_0:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Debounce_0:interrupt_o" "INV_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Debounce_0:resetn_i" "PF_init_monitor_0_0:DEVICE_INIT_DONE" "reset_sync_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Debounce_0:switch_i" "switch_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INV_0:Y" "reset_sync_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:OEN" "PF_DSP_FLOW_DEMO_TOP_0:OEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:RESET_N" "PF_DSP_FLOW_DEMO_TOP_0:RESET_N" "reset_sync_0:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:RXRDY" "PF_DSP_FLOW_DEMO_TOP_0:RX_RDY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:TX" "TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:TXRDY" "PF_DSP_FLOW_DEMO_TOP_0:TX_RDY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:WEN" "PF_DSP_FLOW_DEMO_TOP_0:WEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DSP_FLOW_DEMO_TOP_0:SLOWCLK" "PF_ccc_0_0:OUT1_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_ccc_0_0:PLL_LOCK_0" "reset_sync_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_ccc_0_0:REF_CLK_0" "REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_init_monitor_0_0:BANK_6_VDDI_STATUS" "reset_sync_0:BANK_x_VDDI_STATUS" "reset_sync_0:BANK_y_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_init_monitor_0_0:FABRIC_POR_N" "reset_sync_0:FPGA_POR_N" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:DATA_IN" "PF_DSP_FLOW_DEMO_TOP_0:DATA_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_COREUART_0_0:DATA_OUT" "PF_DSP_FLOW_DEMO_TOP_0:DATA_IN" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}
