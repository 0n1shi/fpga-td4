import sys
from typing import List

args = sys.argv

def dec2bin(num: str) -> str:
    return bin(int(num))[2:].zfill(4)

def tokenize(opcode, operands: str) -> List[str]:
    if opcode == 'mov' or opcode == 'add':
        first, second = operands.split(', ')
        return [opcode, first, second]
    if opcode == 'in' or opcode == 'out' or opcode == 'jmp' or opcode == 'jnc':
        return [opcode, operands]

def compile_asm(tokens: List[str]) -> str:
    # "mov" or "add"
    if len(tokens) == 3: 
        opcode, first, second = tokens
        if opcode == 'mov':
            if first == 'a':
                if second == 'b': 
                    # mov a, b
                    return '0001' + '0000'
                else:
                    # mov a, imm
                    return '0011' + dec2bin(second)
            if first == 'b':
                if second == 'a':
                    # mov b, a
                    return '0100' + '0000'
                else:
                    # mov b, imm
                    return '0111' + dec2bin(second)
        if opcode == 'add':
            if first == 'a':
                # add a, imm
                return '0000' + dec2bint(second)
            if first == 'b':
                # add b, imm
                return '0101' + dec2bin(second)
    # "in" or "out" or "jmp" or "jnc"
    elif len(tokens) == 2:
        opcode, first = tokens
        if opcode == 'in':
            if first == 'a':
                # in a
                return '0010' + '0000'
            if first == 'b':
                # in b
                return '0110' + '0000'
        if opcode == 'out':
            if first == 'b':
                # out b
                return '1001' + '0000'
            else:
                # out imm
                return '1011' + dec2bin(first)
        if opcode == 'jmp':
            # jmp imm
            return '1111' + dec2bin(first)
        if opcode == 'jnc':
            # inc imm
            return '1110' + dec2bin(first)

if __name__ == '__main__':
    # read assembly
    asm = args[1]
    fd = open(asm)
    lines = fd.readlines()

    for line in lines:
        # get opcode and operands
        items = line.rstrip().split(' ', 1)
        opcode = items[0]
        operands = ''
        if len(items) > 1:
            operands = items[1]

        tokens = tokenize(opcode, operands)
        code = compile_asm(tokens)
        print("8'0b" + code)
