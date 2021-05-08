.intel_syntax noprefix

.align 4
.section .multiboot
.long 0x1BADB002
.long 0
.long -(0x1BADB002 + 0)

.section .bss
.align 16
stack_bottom:
.skip 16384
stack_top:


.section .text
.global _start
_start:
    lea esp, [stack_top]

    lgdt [gdt_desc]
    mov ax, 0x10
    mov ss, ax
    jmp 0x8:.load_cs
    
.load_cs:
    
    
    lea eax, [cool_str]
    push eax
    call vga_print
    pop eax

    hlt


gdt:
    .long 0x0
    .long 0x0

code_entry:
    .word 0xffff
    .word 0x0
    .byte 0x0
    .byte 0x9a
    .byte 0xcf
    .byte 0x0
data_entry:
	.word 0xffff
	.word 0
	.byte 0
	.byte 0x92
	.byte 0xcf
	.byte 0

gdt_desc:
    .word (gdt_desc - gdt - 1)
    .long gdt

cool_str:
.ascii "hello world\0"
