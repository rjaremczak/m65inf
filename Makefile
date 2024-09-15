PROJECT= 	m65inf

CC=			$(LLVM_MOS_PATH)/bin/mos-mega65-clang
COPTS=		-Os -Wall
LOPTS=		-lexit-return -Wl','-Map','$(PROJECT).map

SOURCES=	main.c 

HEADERS=	Makefile 

all: $(PROJECT).prg $(HEADERS)

$(PROJECT).prg:	$(SOURCES) 
	$(CC) $(COPTS) -o $@ $^ $(LOPTS)

asm: $(SOURCES)
	$(CC) $(COPTS) -o $(PROJECT).asm $^ -Wl','--lto-emit-asm

clean:
	rm -f *.s *.prg *.o *.map *.mem *.out *.elf

run: $(PROJECT).prg
	xmega65 -prg $(PROJECT).prg -besure

dump:
	$(LLVM_MOS_PATH)/bin/llvm-objdump -d --print-imm-hex $(PROJECT).prg.elf