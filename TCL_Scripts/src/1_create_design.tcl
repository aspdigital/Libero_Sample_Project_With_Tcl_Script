# Import source files
import_files -hdl_source {./src/src_hdl/FILTER_CONTROL_FSM.v}
import_files -hdl_source {./src/src_hdl/UART_IF.v}
import_files -hdl_source {./src/src_hdl/Debounce.v}




build_design_hierarchy 

# Create, configure and generate core components
source ./src/src_components/PF_ccc_0.tcl
source ./src/src_components/PF_COREFFT.tcl
source ./src/src_components/PF_COREFIR.tcl
source ./src/src_components/PF_COREUART_0.tcl
source ./src/src_components/PF_init_monitor_0.tcl
source ./src/src_components/PF_TPSRAM_0.tcl
source ./src/src_components/PF_TPSRAM_1.tcl
source ./src/src_components/PF_TPSRAM_2.tcl
source ./src/src_components/PF_TPSRAM_3.tcl
source ./src/src_components/PF_TPSRAM_4.tcl
source ./src/src_components/reset_sync.tcl






# Generate SmartDesign Components

build_design_hierarchy 
source ./src/src_components/PF_DSP_FLOW_DEMO_TOP.tcl
build_design_hierarchy 
source ./src/src_components/top.tcl

# Set top level module
build_design_hierarchy 
set_root -module {top::work} 

save_project
puts "Design generated successfully\n"
