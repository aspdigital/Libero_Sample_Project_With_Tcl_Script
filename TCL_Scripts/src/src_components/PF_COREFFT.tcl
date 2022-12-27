# Exporting Component Description of PF_COREFFT to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component PF_COREFFT
create_and_configure_core -core_vlnv Actel:DirectCore:COREFFT:$COREFFTver -component_name {PF_COREFFT} -params {\
"CFG_ARCH:1"  \
"DATA_BITS:18"  \
"FFT_SIZE:256"  \
"FPGA_FAMILY:26"  \
"INVERSE:0"  \
"MEMBUF:1"  \
"ORDER:0"  \
"POINTS:256"  \
"SCALE:0"  \
"SCALE_EXP_ON:false"  \
"SCALE_ON:true"  \
"SCALE_SCH:255"  \
"STAGE_1:true"  \
"STAGE_2:true"  \
"STAGE_3:true"  \
"STAGE_4:true"  \
"STAGE_5:true"  \
"STAGE_6:true"  \
"STAGE_7:true"  \
"STAGE_8:true"  \
"STAGE_9:true"  \
"STAGE_10:true"  \
"TWID_BITS:18"  \
"URAM_MAXDEPTH:0"  \
"WIDTH:16"   }
# Exporting Component Description of PF_COREFFT to TCL done
