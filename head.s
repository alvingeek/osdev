LATCH=11930
SCRN_SEL=0x18
TSSO_SEL=0x20
LDTO_SEL=0x28
TSS1_SEL=0x30
LDT1_SEL=0x38

.text
startup_32:
    mov $0x10, %eax
    mov %ax, %ds
    lss init_stack, %esp

