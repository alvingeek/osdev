.code16
.section .data
.global _start

SCREEN_CHAR_NUM=25*80

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
msg:
    .string "Loading a simple OS!!!^,^"
