ML /nologo /c /AT boot.asm
ML /nologo /c /AT file.asm
link16 /nologo /TINY /NOD boot.obj, boot.img, NUL, NUL, NUL
link16 /nologo /TINY /NOD file.obj, file.img, NUL, NUL, NUL
type boot.img file.img > result.img
qemu-system-i386 -drive file=result.img,format=raw,if=floppy