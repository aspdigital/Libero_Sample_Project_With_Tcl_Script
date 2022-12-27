# Exporting Component Description of PF_COREUART_0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component PF_COREUART_0
create_and_configure_core -core_vlnv Actel:DirectCore:COREUART:$COREUARTver -component_name {PF_COREUART_0} -params {\
"BAUD_VAL_FRCTN_EN:true"  \
"RX_FIFO:0"  \
"RX_LEGACY_MODE:0"  \
"TX_FIFO:0"  \
"USE_SOFT_FIFO:0"   }
# Exporting Component Description of PF_COREUART_0 to TCL done
