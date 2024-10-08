PROJECT= 	m65inf

CC=			$(LLVM_MOS_PATH)/bin/mos-clang --config mos-mega65.cfg
COPTS=		-Os -Wall
LOPTS=		-lexit-return -Wl','-Map','$(PROJECT).map

SOURCES=	src/main.c src/hyppo.s

HEADERS=	Makefile 

all: $(PROJECT).prg $(HEADERS)

$(PROJECT).prg:	$(SOURCES) 
	$(CC) $(COPTS) -o $@ $^ $(LOPTS)

asm: $(SOURCES)
	$(CC) $(COPTS) -o $(PROJECT).asm $^ -Wl','--lto-emit-asm

clean:
	rm -f *.s *.prg *.o *.map *.mem *.out *.elf *.asm

xemu: $(PROJECT).prg
	xmega65 -prg $(PROJECT).prg -besure

upload: $(PROJECT).prg
	$(MEGA65_TOOLS)/etherload -r $(PROJECT).prg

dump:
	$(LLVM_MOS_PATH)/bin/llvm-objdump -d --print-imm-hex $(PROJECT).prg.elf > $(PROJECT).dump.asm