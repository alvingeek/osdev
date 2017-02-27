.code16
.section .text
.global _start

SCREEN_CHAR_NUM=24*80

_start:

clear_screen:
    mov $0xb800, %ax
    mov %ax, %es
    xor %di, %di
    xor %ax, %ax
    mov $0b00010000,%ah
    mov $SCREEN_CHAR_NUM, %cx
    cld
    rep stosw

    mov $0xb800, %ax
    mov %ax,%ds
    movb $'A', 0
    movb $0x1e, 1

idle:
    jmp idle

