# Configure and run Synthesis
configure_tool -name {SYNTHESIZE} \
    -params {AUTO_COMPILE_POINT:false} \
    -params {BLOCK_MODE:false} \
    -params {BLOCK_PLACEMENT_CONFLICTS:ERROR} \
    -params {BLOCK_ROUTING_CONFLICTS:LOCK} \
    -params {CLOCK_ASYNC:800} \
    -params {CLOCK_DATA:5000} \
    -params {CLOCK_GLOBAL:2} \
    -params {PA4_GB_COUNT:24} \
    -params {PA4_GB_MAX_RCLKINT_INSERTION:16} \
    -params {PA4_GB_MIN_GB_FANOUT_TO_USE_RCLKINT:1000} \
    -params {RAM_OPTIMIZED_FOR_POWER:0} \
    -params {RETIMING:false} \
    -params {ROM_TO_LOGIC:true} \
    -params {SEQSHIFT_TO_URAM:1} \
    -params {SYNPLIFY_OPTIONS:} \
    -params {SYNPLIFY_TCL_FILE:} 

## run_tool -name SYNTHESIZE
run_tool_wrapper "run_tool -name SYNTHESIZE"

puts "Synthesize completed successfully\n"
                  
# Configure and run Place and Route for max timing optimization
# In this phase, the goal is to meet max timing requirements
# Recommendations:
#   - Start with regular effort (EFFORT_LEVEL:false)
#   - Try high effort (EFFORT_LEVEL:true) if timing is not met with regular effort
#   - If you are still not meeting timing, consider optimizing your RTL next
#   - Do not run multi-pass unless absolutely necessary and the design is close to completion
#   - Do not run Min-delay-repair until max timing has been met
configure_tool -name {PLACEROUTE} \
    -params {TDPR:true} \
    -params {PDPR:false} \
    -params EFFORT_LEVEL:$Effort_Level \
    -params {GB_DEMOTION:true} \
    -params {REPLICATION:false} \
    -params {IOREG_COMBINING:false} \
    -params {INCRPLACEANDROUTE:false} \
    -params REPAIR_MIN_DELAY:$Repair_Min_Delay \
    -params MULTI_PASS_LAYOUT:$Multi_Pass_Layout \
    -params {NUM_MULTI_PASSES:5} \
    
## run_tool -name PLACEROUTE
run_tool_wrapper "run_tool -name PLACEROUTE"

puts "Placeroute completed successfully\n"
    
# Configure and run Place and Route for min timing optimization
# Note that we Place and Route is configured to run incrementally for this phase
#configure_tool -name {PLACEROUTE} \
    -params {TDPR:true} \
    -params {PDPR:false} \
    -params {EFFORT_LEVEL:false} \
    -params {GB_DEMOTION:false} \
    -params {REPLICATION:false} \
    -params {IOREG_COMBINING:false} \
    -params {INCRPLACEANDROUTE:true} \
    -params {REPAIR_MIN_DELAY:true} \
    -params {MULTI_PASS_LAYOUT:false}

#run_tool -name PLACEROUTE

# Configure and run Timing Verification
# Notes: 
#   You should enable all corners for final timing sign-off
#   If you want to know that there are violations or not, just enable the *TIMING_VIOLATIONS* options. You will not get detailed timing reports in that case
configure_tool -name {VERIFYTIMING} \
    -params {CONSTRAINTS_COVERAGE:1} \
    -params {FORMAT:XML} \
    -params {MAX_TIMING_FAST_HV_LT:1} \
    -params {MAX_TIMING_SLOW_LV_HT:1} \
    -params {MAX_TIMING_SLOW_LV_LT:1} \
    -params {MIN_TIMING_FAST_HV_LT:1} \
    -params {MIN_TIMING_SLOW_LV_HT:1} \
    -params {MIN_TIMING_SLOW_LV_LT:1} \
    -params {MAX_TIMING_VIOLATIONS_FAST_HV_LT:1} \
    -params {MAX_TIMING_VIOLATIONS_SLOW_LV_HT:1} \
    -params {MAX_TIMING_VIOLATIONS_SLOW_LV_LT:1} \
    -params {MIN_TIMING_VIOLATIONS_FAST_HV_LT:1} \
    -params {MIN_TIMING_VIOLATIONS_SLOW_LV_HT:1} \
    -params {MIN_TIMING_VIOLATIONS_SLOW_LV_LT:1} 

## run_tool -name VERIFYTIMING
run_tool_wrapper "run_tool -name VERIFYTIMING"

puts "Verifytiming completed successfully\n"

save_project
