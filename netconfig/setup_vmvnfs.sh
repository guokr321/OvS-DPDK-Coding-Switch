#!/bin/bash

#Must be started after netconfig/setup_ovsdpdk.sh

vm_ram='1024M'

#Add encoder VNF port to OVS
sudo ovs-vsctl add-port br0 vhp_encodeVNF -- set Interface vhp_encodeVNF type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient9
#Add encoder VNF port to OVS
sudo ovs-vsctl add-port br0 vhp_decodeVNF -- set Interface vhp_decodeVNF type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient10

if ! pgrep -f "qemu-system-x86_64" > /dev/null
then
	#Start encoder VNF
	sudo qemu-system-x86_64 \
		-drive file=~/vm-images/encode_VNF_ubuntu18.04.qcow2 -accel kvm -display none -m size="$vm_ram" \
		-cpu host,+ssse3,+sse4.1,+sse4.2,+x2apic \
		-netdev user,id=encodenet,hostfwd=tcp::10029-:22 \
		-device e1000,netdev=encodenet \
		-chardev socket,id=char9,path=/tmp/dpdkvhostclient9,server \
		-netdev type=vhost-user,id=net9,chardev=char9,vhostforce \
		-device virtio-net-pci,mac=de:ad:be:ef:00:09,netdev=net9 \
		-object memory-backend-file,id=mem,size="$vm_ram",mem-path=/dev/hugepages,share=on \
		-numa node,memdev=mem -mem-prealloc &
	#Start decoder VNF
	sudo qemu-system-x86_64 \
		-drive file=~/vm-images/decode_VNF_ubuntu18.04.qcow2 -accel kvm -display none -m size="$vm_ram" \
		-cpu host,+ssse3,+sse4.1,+sse4.2,+x2apic \
		-netdev user,id=decodenet,hostfwd=tcp::10030-:22 \
		-device e1000,netdev=decodenet \
		-chardev socket,id=char10,path=/tmp/dpdkvhostclient10,server \
		-netdev type=vhost-user,id=net10,chardev=char10,vhostforce \
		-device virtio-net-pci,mac=de:ad:be:ef:00:10,netdev=net10 \
		-object memory-backend-file,id=mem,size="$vm_ram",mem-path=/dev/hugepages,share=on \
		-numa node,memdev=mem -mem-prealloc &
fi

#CD-rom boot for debug:
# -boot d \
# -cdrom ~/ISOs/ubuntu-18.04.2-live-server-amd64.iso 