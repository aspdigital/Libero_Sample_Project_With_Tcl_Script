set PF_CCCver {2.2.214}
set COREUARTver {5.7.100}
set PF_INIT_MONITORver {2.0.304}
set PF_TPSRAMver {1.1.108}
set CORERESET_PFver {2.3.100}
set COREFIR_PFver {2.3.100}
set COREFFTver {8.0.107}


#tool profiles
set synprofile1 {Synplify Pro ME}
#set synprofile2 {Synplify Pro ME}

#set synprofile1 {sym_cap}
#set synprofile2 {sym_cap}

set simuprofile1 {ModelSim ME Pro}
#set simuprofile2 {ModelSim ME Pro}
#set simuprofile1 {model}
#set simuprofile2 {model}


#added for Rev F

#set die {MPF300T}
set die_eval {MPF300TS}
#set die_splash {MPF300TS_ES}
set die_splash {MPF300T}
set eval_package {FCG1152}
set splash_package {FCG484}
set eval_part_range {IND}
set splash_part_range {EXT}
#set splash_part_range {IND}

set die_devkit {RT4G150}
set devkit_package {1657 CG}
set devkit_part_range {MIL}


# A common procedure called by all tests.

# Computes the runtime for each command run in Libero

#

proc run_tool_wrapper { cmd } {

 

  # get tool name from the command

  #

  regexp {run_tool\s+-name\s+\{*(\w*)\}*} $cmd full1 tool;

 

  puts "Starting $tool command";

  set full_cmd "time \{ $cmd \}";

  set TIME_start [clock seconds];
  set runtime [ eval $full_cmd ];
  set TIME_taken [expr [clock seconds] - $TIME_start];
  puts "\nRUNTIME:$tool=$TIME_taken secs\n";
 	

  set runtime_secs [ expr [lindex $runtime 0]/1000000 ];

  puts "\nRUNTIME_bytime:$tool=$runtime_secs secs\n";

 

}

