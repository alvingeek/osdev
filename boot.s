.code16
.section .text
.global _start

SCREEN_PIXEL = 25*80

_start:

# VGA model 3
#+-------------------------------------------------------------+-------------------------------+
#|                          Attribute                          |           Character           |
#+-------------------------------------------------------------+-------------------------------+
#|     7     |   6  |  5  |  4  |     3     |   2  |  1  |  0  | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
#+-----------+------+-----+-----+-----------+------+-----+-----+---+---+---+---+---+---+---+---+
#|   Blink   | Background color | intensity | Foreground color |           Code point          |
#+-----------+------------------+-----------+------------------+-------------------------------+
clear_screen:
    mov $0xb800, %ax
    mov %ax, %es
    xor %di, %di
    mov $0b00010000, %ah
    mov $0, %al
    mov $SCREEN_PIXEL, %cx
    cld #df=0
    rep stosw

    mov $0xb800, %ax
    mov %ax,%ds
    movb $'A', 0
    movb $0x1e, 1

idle:
    jmp idle
msg:
    .string "Loading a simple OS!!!^,^"
