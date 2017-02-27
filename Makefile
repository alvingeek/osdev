SHELL=/bin/bash
CC=gcc
CCFLAGS=
AS=as
ASFLAGS=
LD=ld
LDFLAGS=
RM=rm

boot.o:boot.s
	$(CC) -c -o boot.o boot.s

boot:boot.o
	$(LD) -o boot -Ttext 0x0 --oformat binary boot.o

boot.img:boot
	dd if=boot of=boot.img
	echo -ne "\x55\xaa" | dd seek=510 bs=1 of=boot.img

qemu:boot.img
	qemu-system-i386 boot.img

clean:
	$(RM) -f  boot.o boot boot.img