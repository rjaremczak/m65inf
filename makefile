PROJECT= 	m65inf

CC=			$(LLVM_MOS_PATH)/bin/mos-clang --config mos-mega65.cfg
COPTS=		-Os -Wall
LOPTS=		-lexit-return -Wl','-Map','$(PROJECT).map

SOURCES=	src/main.c src/hyppo.asm

HEADERS=	makefile 

all: $(PROJECT).prg $(HEADERS)

$(PROJECT).prg:	$(SOURCES) 
	$(CC) $(COPTS) -o $@ $^ $(LOPTS)

asm: $(SOURCES)
	$(CC) $(COPTS) -o $(PROJECT).asm $^ -Wl','--lto-emit-asm

test: src/test.asm
	$(LLVM_MOS_PATH)/bin/llvm-mc --mcpu=mos45gs02 --filetype=asm --show-encoding $^
	# $(LLVM_MOS_PATH)/bin/llvm-objdump --disassemble test.o

clean:
	rm -f *.s *.prg *.o *.map *.mem *.out *.elf *.asm *.hex *.bin

xemu: $(PROJECT).prg
	xmega65 -prg $(PROJECT).prg -besure

mega: $(PROJECT).prg
	$(MEGA65_TOOLS)/m65 -r $(PROJECT).prg

ether_mega: $(PROJECT).prg
	$(MEGA65_TOOLS)/etherload -r $(PROJECT).prg

dump:
	$(LLVM_MOS_PATH)/bin/llvm-objdump -d --print-imm-hex $(PROJECT).prg.elf > $(PROJECT).dump.asm