CROSS_COMPILE ?= maxq-coff-

AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy


ASFLAGS = -R
LDFLAGS = -Tlinker.ld

all: hello.bin dump_urom.bin xram.bin

%.bin: %.elf
	$(OBJCOPY) -Obinary $< $@

%.o: %.S
	$(AS) $(ASFLAGS) -o $@ $<

hello.elf: hello.o entry.o sigblock.o urom.o uart.o
	$(LD) $(LDFLAGS) -o $@ $^

dump_urom.elf: dump_urom.o entry.o sigblock.o urom.o uart.o
	$(LD) $(LDFLAGS) -o $@ $^

xram.elf: xram.o entry.o sigblock.o urom.o uart.o
	$(LD) $(LDFLAGS) -o $@ $^

clean:
	@rm -f *.o *.elf *.bin


.PHONY: clean
