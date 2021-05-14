export MOD_NAME = vuln_driver
EXTRA_CFLAGS += -fno-stack-protector

export TOP:= $(shell pwd)
export KDIR:= /lib/modules/$(shell uname -r)/build

.PHONY: default exploit load display unload clean

default:
	$(MAKE) -C src
	$(MAKE) -C exploits

load:
	@sudo dmesg --clear
	@sudo insmod src/${MOD_NAME}.ko pid=${pid} addr=${addr}
	@sudo chmod 666 /dev/vulnerable_device
	@lsmod | grep ${MOD_NAME}

display:
	dmesg

unload:
	sudo rmmod ${MOD_NAME}.ko

clean:
	$(MAKE) -C src clean
	$(MAKE) -C exploits clean
	sudo dmesg --clear
