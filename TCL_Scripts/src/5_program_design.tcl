# Generate FPGA Array Data
## run_tool -name {GENERATEPROGRAMMINGDATA} 
run_tool_wrapper "run_tool -name {GENERATEPROGRAMMINGDATA} "


# Generate FPGA Array Data
## run_tool -name GENERATEPROGRAMMINGDATA
run_tool_wrapper "run_tool -name GENERATEPROGRAMMINGDATA"

                  
# Configure and generate Design Initialization Data and Memories
# The following can be configured:
#   - Design initialization source - sNVM/uPROM/SPI-Flash
#   - sNVM user clients
#   - uPROM user clients
#   - Fabric RAM initialization content
#   - SPI-Flash user clients
# Examples TBD
#
# Example for configuring user snvm clients 
# Note that if using relative path, the path to the mem file specified in the SNVM.cfg file is relative to the libero *.prjx file. So please adjust the path according to the project location and where the SNVM.cfg and mem files are located. 
#configure_snvm -cfg_file {../snvm/SNVM.cfg} 

generate_design_initialization_data
    
# Configure and generate programming file data
# Examples for configuring the programming files TBD
## run_tool -name GENERATEPROGRAMMINGFILE
run_tool_wrapper "run_tool -name GENERATEPROGRAMMINGFILE"


puts "Programmingfile generated successfully\n"
    
# Export STAPL file
export_bitstream_file \
    -file_name {top} \
    -export_dir ${PrjLocation}/designer/top/export \
    -format STP \
    -master_file 0 \
    -encrypted_uek1_file 0 \
    -encrypted_uek1_file_components {} \
    -encrypted_uek2_file 0 \
    -encrypted_uek2_file_components {} \
    -trusted_facility_file 1 \
    -trusted_facility_file_components "FABRIC SNVM"

puts "Exported bit stream successfully\n"

# Export Programming Job
# Programming job files can be imported in FlasPro Express standalone for programming the device
export_prog_job \
    -job_file_name {top} \
    -export_dir ${PrjLocation}/designer/top/export \
    -bitstream_file_type {TRUSTED_FACILITY} \
    -bitstream_file_components {FABRIC SNVM} \
    -program_design 1 \
    -program_spi_flash 0 \
    -include_plaintext_passkey 0 
	
puts "Exported job file successfully\n"
puts "Full design flow passed execution\n"	
