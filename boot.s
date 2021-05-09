.intel_syntax noprefix

.align 4
.section .multiboot
.long 0x1BADB002
.long 0
.long -(0x1BADB002 + 0)




.section .text
.global _start
_start:
    lea esp, [stack_top]

    lgdt [gdt_desc]
    mov ax, 0x10
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    jmp 0x8:.load_cs
    
.load_cs:
    
    push 0xF
    push 0x4
    call vga_set_color
    add esp, 0x8

    lea eax, [my_brain_text]
    push eax
    call vga_print
    add esp, 0x4

    push 0x4
    push 0xF
    call vga_set_color
    add esp, 0x8
    
    lea eax, [hurts_text]
    push eax
    call vga_print
    add esp, 0x4

    hlt

my_brain_text:
.ascii "My brain\n\0"
hurts_text:
.ascii "Hurts\n\0"

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

.section .bss
stack_bottom:
.skip 16384
stack_top:
