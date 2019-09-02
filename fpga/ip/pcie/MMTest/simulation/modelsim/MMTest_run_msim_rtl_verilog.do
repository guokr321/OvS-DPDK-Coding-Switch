transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib mm
vmap mm mm
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/mm.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_onchip_memory2_0.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/custom_master.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/write_master.v}
vlog -vlog01compat -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/latency_aware_read_master.v}
vlog -vlog01compat -work work +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/MMTest.v}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0_router_002.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/mm_mm_interconnect_0_router.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work mm +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/mm/synthesis/submodules/altera_merlin_master_translator.sv}
vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/prngen/prngen.vhd}
vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/net_encoder/net_encoder.vhd}
vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/gfmul/gfmul.vhd}
vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/fifo32x128/fifo32x128.vhd}

vlog -vlog01compat -work work +incdir+/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/pcie/MMTest/MMTestTB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L mm -voptargs="+acc"  MMTestTB

add wave *
view structure
view signals
run -all