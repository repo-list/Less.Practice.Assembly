ML /nologo /c /AT boot.asm
link16 /nologo /TINY /NOD boot.obj, boot.img, NUL, NUL, NUL
qemu-system-i386 -drive file=boot.img,format=raw,if=floppy