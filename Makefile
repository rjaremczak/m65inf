PROJECT= 	m65inf

CC=			$(LLVM_MOS_PATH)/bin/mos-c64-clang
CCOPTS=		-Os -Wall
LDOPTS=		-lexit-return -Wl','-Map','$(PROJECT).map

SOURCES=	main.c 

HEADERS=	Makefile 

all: $(PROJECT).prg $(HEADERS)

$(PROJECT).prg:	$(SOURCES) 
	$(CC) $(CCOPTS) -o $@ $^ $(LDOPTS)

clean:
	rm -f *.s *.prg *.o *.map *.mem *.out *.elf

run: $(PROJECT).prg
	xmega65 -prg $(PROJECT).prg -besure

dump:
	$(LLVM_MOS_PATH)/bin/llvm-objdump -d --print-imm-hex $(PROJECT).prg.elf