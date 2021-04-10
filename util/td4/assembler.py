import sys

args = sys.argv

if __name__ == '__main__':
    asm = args[1]
    
    fd = open(asm)
    lines = fd.readlines()

    print(lines)