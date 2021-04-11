# TD4

## opcodes

|ins|opcode|carry|desc|
|-|-|-|-|
|mov a, imm|`0b0011`|0||
|mov b, imm|`0b0111`|0||
|mov a, b|`0b0001`|0||
|mov b, a|`0b0100`|0||
|add a, imm|`0b0000`|0/1||
|add b, imm|`0b0101`|0/1||
|in a|`0b0010`|0||
|in b|`0b0110`|0||
|out imm|`0b1011`|0||
|out b|`0b1001`|0||
|jmp imm|`0b1111`|0||
|jnc imm|`0b1110`|0||
