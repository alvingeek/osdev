.code16
.section .text
.global _start

SCREEN_PIXEL = 25*80

_start:
    mov $0xb800, %ax
    mov %ax, %es
    xor %di, %di
    mov $0b00010000, %ah
    mov $0, %al
    mov $SCREEN_PIXEL, %cx
    cld #df=0
    rep stosw

    mov $0xb800, %ax
    mov %ax, %ds
    movb $'H', 0
    movb $0b00011010, 1
    movb $'E', 2
    movb $0b00011010, 3
    movb $'L', 4
    movb $0b00011010, 5
    movb $'L', 6
    movb $0b00011010, 7
    movb $'O', 8
    movb $0b00011010, 9
    movb $',', 0xa
    movb $0b00011010, 0xb
    movb $'W', 0xc
    movb $0b00011010, 0xd
    movb $'O', 0xe
    movb $0b00011010, 0xf
    movb $'R', 0x10
    movb $0b00011010, 0x11
    movb $'L', 0x12
    movb $0b00011010, 0x13
    movb $'D', 0x14
    movb $0b00011010, 0x15
    //movb $0x01100000, 1
    //movb $0x1e, 1
idle:
    jmp idle
