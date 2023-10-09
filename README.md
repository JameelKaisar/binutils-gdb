# binutils-gdb
gdb and binutils with new assembly instructions added for RISCV


## Added Instructions
- mod
- factx
- fact (alias)
- comb

| Parameter | Length | mod instr | factx instr | comb instr |
| - | - | - | - | - |
| MASK | 32 | 0xfe00707f | 0x707f | 0xfe00707f |
| MATCH | 32 | 0x6b | 0x106b | 0x200006b |
| OPCODE | 7 | 0x6b | 0x6b | 0x6b |
| QUARDRANT | 2 | 0x3 | 0x3 | 0x3 |
| OPCODE5 | 5 | 0x1a | 0x1a | 0x1a |
| FUNC3 | 3 | 0x0 | 0x1 | 0x0 |
| FUNC7 | 7 | 0x0 | - | 0x1 |

- The values for `QUARDRANT`, `OPCODE5`, `FUNC3` and `FUNC7` were decided after determining the empty slots in `gem5/src/arch/riscv/isa/decoder.isa` file.
- `OPCODE` = `OPCODE5` + `QUARDRANT`
- `MATCH` = `<instruction>` & `MASK`


## RISCV Instructions Format
| Type | Format | MASK |
| - | - | - |
| R | FUNC7 + RS2 + RS1 + FUNC3 + RD + OPCODE | 0xfe00707f |
| I | IMMI + RS1 + FUNC3 + RD + OPCODE | 0x707f |
