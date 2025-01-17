transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/gfmul/gfmul.vhd}
vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/gj_mulsubRow/gj_mulsubRow.vhd}

vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/gj_mulsubRow/gj_mulsubRowTb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  gj_mulsubRowTb

add wave *
view structure
view signals
run -all
