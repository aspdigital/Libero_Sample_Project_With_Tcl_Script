source ./common.tcl
set Prjname "Libero_Project"
set PrjLocation "./$Prjname"

#variable used in the design
set SimTime 100us
set Effort_Level True
set Repair_Min_Delay True
set Multi_Pass_Layout false


# Remove existing project if present
#file delete -force ${PrjLocation}

#if {[file isdirectory ./Libero_Project]} {
    if {[file isdirectory ./Libero_Project]} {
    puts stdout "Synthesis & PnR is already done";
	open_project -file {./Libero_Project/Libero_Project.prjx};
	
} else {
    puts stdout "Create a New Project.";
# Create and configure new project
new_project \
    -name "$Prjname" \
    -location "$PrjLocation" \
    -family "PolarFire" \
    -die $die_eval \
    -package $eval_package \
    -die_voltage "1.05" \
    -speed "-1" \
    -part_range $eval_part_range \
    -hdl "VERILOG"

# Set VHDL language version for this project
#project_settings \
    -vhdl_mode VHDL_2008

select_profile -name $synprofile1
select_profile -name $simuprofile1

puts "Project created successfully"

# Create design
source ./src/1_create_design.tcl

# Constrain design
source ./src/2_constrain_design.tcl

# Simulation flow
#source ./src/3_sim_flow.tcl

# Implement design
source ./src/4_implement_design.tcl
#puts stdout "Run";
# Program design
#source ./src/5_program_design.tcl

# Close project
#close_project -save 1 
}
