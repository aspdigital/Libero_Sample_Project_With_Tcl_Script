file copy -force "./src/src_stimulus/wave.do" "./$Prjname/simulation/wave.do"

import_files -stimulus "./src/src_stimulus/top.v" \

import_files \
         -convert_EDN_to_HDL 0 \
         -simulation "./src/src_stimulus/coe_file.dat" \
         -simulation "./src/src_stimulus/coe_file_Band_pass.dat" \
         -simulation "./src/src_stimulus/coe_file_Band_reject.dat" \
         -simulation "./src/src_stimulus/coe_file_High_pass.dat" \
         -simulation "./src/src_stimulus/coe_file_Low_pass.dat" \
         -simulation "./src/src_stimulus/data_file.dat" 

#import_files -stimulus "./src/src_stimulus/coe_file.dat" \
#import_files -stimulus "./src/src_stimulus/coe_file_Band_pass.dat" \
#import_files -stimulus "./src/src_stimulus/coe_file_Band_reject.dat" \
#import_files -stimulus "./src/src_stimulus/coe_file_High_pass.dat" \
#import_files -stimulus "./src/src_stimulus/coe_file_Low_pass.dat" \
#import_files -stimulus "./src/src_stimulus/data_file.dat" \


build_design_hierarchy 
organize_tool_files -tool {SIM_PRESYNTH} -file ./${Prjname}/stimulus/top.v -module {top::work} -input_type {stimulus}
set_modelsim_options -use_automatic_do_file 1 -sim_runtime $SimTime \
					 -tb_module_name {testbench} \
					 -log_all_signals 1 \
					 -include_do_file 1\
					 -disable_pulse_filtering 1 \
					 -resolution {1ps} \
					 -timeunit 1 \
					 -timeunit_base {ns} \
					 -precision 1 \
					 -precision_base {ps}			
					 
catch [run_tool -name {SIM_PRESYNTH}]
save_project
puts "Simulation completed successfully\n"
