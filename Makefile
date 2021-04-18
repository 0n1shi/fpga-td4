all: build_asm

build_asm:
	python3 util/td4/assembler.py util/td4/test/inc_b.s > bin/asm.mem
