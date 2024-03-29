import sys
from typing import List

args = sys.argv

def to_opcode(num: int) -> int:
    return int(num) << 4

def to_bin(num: str, width: int) -> str:
    return bin(num).zfill(width)

def _tokenize(opcode, operands: str) -> List[str]:
    if opcode == 'mov' or opcode == 'add':
        first, second = operands.split(', ')
        return [opcode, first, second]
    if opcode == 'in' or opcode == 'out' or opcode == 'jmp' or opcode == 'jnc':
        return [opcode, operands]

def _generate(tokens: List[str]) -> int:
    # "mov" or "add"
    if len(tokens) == 3:
        opcode, first, second = tokens
        if opcode == 'mov':
            if first == 'a':
                if second == 'b':
                    # mov a, b
                    return to_opcode(0b0001) + 0b0000
                else:
                    # mov a, imm
                    return to_opcode(0b0011) + int(second)
            if first == 'b':
                if second == 'a':
                    # mov b, a
                    return to_opcode(0b0100) + 0b0000
                else:
                    # mov b, imm
                    return to_opcode(0b0111) + int(second)
        if opcode == 'add':
            if first == 'a':
                # add a, imm
                return to_opcode(0b0000) + int(second)
            if first == 'b':
                # add b, imm
                return to_opcode(0b0101) + int(second)
    # "in" or "out" or "jmp" or "jnc"
    elif len(tokens) == 2:
        opcode, first = tokens
        if opcode == 'in':
            if first == 'a':
                # in a
                return to_opcode(0b0010) + 0b0000
            if first == 'b':
                # in b
                return to_opcode(0b0110) + 0b0000
        if opcode == 'out':
            if first == 'b':
                # out b
                return to_opcode(0b1001) + 0b0000
            else:
                # out imm
                return to_opcode(0b1011) + int(first)
        if opcode == 'jmp':
            # jmp imm
            return to_opcode(0b1111) + int(first)
        if opcode == 'jnc':
            # inc imm
            return to_opcode(0b1110) + int(first)

def compile_asm(lines: List[str]) -> List[int]:
    code_list = []
    for line in lines:
        # get opcode and operands
        items = line.rstrip().split(' ', 1)
        opcode = items[0]
        operands = ''
        if len(items) > 1:
            operands = items[1]

        tokens = _tokenize(opcode, operands)
        code = _generate(tokens)
        code_list.append(code)
    return code_list

if __name__ == '__main__':
    # read assembly
    asm = args[1]
    fd = open(asm)
    codes = fd.readlines() # assembly program
    bins = compile_asm(codes) # byte code

    print("   // {:<6} {:<8} {}".format("addr", "binary", "assembly"))
    for i, (b, c) in enumerate(zip(bins, codes)):
        print("{} // 0x{:04X} {} {}".format(hex(b)[2:], i, bin(b)[2:].zfill(8), c.rstrip()))
