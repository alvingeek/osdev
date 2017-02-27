.code16
.section .text
.global _start

_start:
    mov $0xb800, %ax
    mov %ax,%ds
    movb $'A', 0
    movb $0x1e, 1

idle:
    jmp idle
