obj-m:=${MOD_NAME}.o

.PHONY: default clean

default: ${MOD_NAME}.ko
${MOD_NAME}.ko: $(wildcard *.c *.h)
	$(MAKE) -C $(KDIR) M=$(TOP)/src modules
	rm -rf .tmp_*

clean:
# rm -f ${MOD_NAME}.ko ${MOD_NAME}.mod* .${MOD_NAME}.*.cmd
# rm -f Module.symvers modules.order
	$(MAKE) -C $(KDIR) M=$(TOP)/src clean
	rm -rf .tmp_*