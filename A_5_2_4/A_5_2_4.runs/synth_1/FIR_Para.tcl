# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Sanaullah/Documents/GitHub/Verilog/A_5_2_4/A_5_2_4.cache/wt [current_project]
set_property parent.project_path C:/Users/Sanaullah/Documents/GitHub/Verilog/A_5_2_4/A_5_2_4.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:ac701:part0:1.3 [current_project]
set_property ip_output_repo c:/Users/Sanaullah/Documents/GitHub/Verilog/A_5_2_4/A_5_2_4.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/Sanaullah/Documents/GitHub/Verilog/A_5_2_4/A_5_2_4.srcs/sources_1/imports/new/FIR_Para.v
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Sanaullah/Documents/GitHub/Verilog/A_5_2_4/A_5_2_4.srcs/constrs_1/imports/new/123.xdc
set_property used_in_implementation false [get_files C:/Users/Sanaullah/Documents/GitHub/Verilog/A_5_2_4/A_5_2_4.srcs/constrs_1/imports/new/123.xdc]


synth_design -top FIR_Para -part xc7a200tfbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef FIR_Para.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file FIR_Para_utilization_synth.rpt -pb FIR_Para_utilization_synth.pb"
