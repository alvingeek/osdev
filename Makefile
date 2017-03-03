SHELL=/bin/bash
AS		=	as
ASFLAGS	=	-f elf
CC		=	gcc
CFLAGS	=	-Wall -O
LD		=	ld
LDFLAGS	=	-Ttext 0x0 -e main --oformat binary -s -x -M

head.o: head.s
	as -c -o head.o head.s --32 -march i386
	#gcc -o head.o -c head.s

system: head.o
	$(LD) -m elf_i386 -Ttext 0 -e startup_32 -s -x -M  head.o -o system > System.map

boot.o:boot.s
	$(CC) -c -o boot.o boot.s

boot:boot.o
	$(LD) -o boot -Ttext 0x0 --oformat binary boot.o

boot.img:boot
	dd if=boot of=boot.img
	echo -ne "\x55\xaa" | dd seek=510 bs=1 of=boot.img

Image: boot.img system
	dd if=boot.img of=Image
	objcopy -O binary system head
	cat head >> Image

disk: Image
	dd bs=8192 if=Image of=Image.img

qemu: disk
	qemu-system-i386 Image.img

clean:
	$(RM) -f  boot boot.img head Image Image.img System.map core *.o system
