; This Program should be first assembled and linked to a .COM (= binary) file
; and then be written to a portable device such as USB in its MBR (Master Boot Record) area
; You can assemble this asm file in the CLI by typing "ML /nologo /c /AT boot.asm"
; Make sure the "masm32\bin" is added in PATH
; after that you can link the obj file by typing "link16 /nologo /TINY /NOD boot.obj, boot.img, NUL, NUL, NUL"
; which creates a "boot.img" file (.img is just a different naming, it's totally the same as .COM or .bin file)
; finally you can edit a device's MBR using HxD editor or using other tools.
; or you can test virtually through QEMU program or VMWare program by mounting the "boot.img" as floppy disk.
; if you're going to test on a real device (USB), change your boot priority in BIOS Settings to search for Legacy USB Floppy Drive.

.8087   ; Model -> Segment  / isSupported   / Memory    / Modes
        ; .8085 -> 8 bits   / not supported?/ ?         / Real (MS-DOS)
        ; .8086 -> 16 bits  / supported     / 1MB       / Real (MS-DOS)
        ; .8087 -> 16 bits  / supported     / 1MB       / Real (MS-DOS)
        ; .8088 -> 16 bits  / not supported?/ 1MB       / Real (MS-DOS)
        ; .286  -> 16 bits  / supported     / 16MBs     / Real & Protected (MS-DOS & Windows)
        ; .386+ -> 32 bits  / supported     / 4GBs      / Real & Protected (MS-DOS & Windows)
        
.MODEL tiny ; tiny : No EXE "MZ" Header. Used to create .COM(= .bin) file.
            ; small : tiny < small < flat
            ; flat : Includes "MZ" Header. Used to create .EXE file.
            ; Details link : https://stackoverflow.com/questions/47252660/what-is-meaning-of-model-small-in-8086-programs

; .STACK 32   ; modifies the stack size

OPTION SEGMENT: USE16   ; 16-bit addressing model.
                        ; All bootloaders should be first loaded as 16-bit for backwards compatibility.
                        ; or you can just type ".DOSSEG" instead of using OPTION SEGMENT instruction.

.CODE
    ORG 07C00h  ; 0000:7C00 -> memory address from which bootstrap codes are loaded

@start:
Main PROC
    ; Print O
    MOV AL, 'O'
    MOV AH, 0Eh
    INT 010h

    ; Prink K
    MOV AL, 'K'
    MOV AH, 0Eh
    INT 010h

    JMP $       ; Jump to current address. So the cursor just stops here.
Main ENDP

; the following 2 instructions should always be at the end of the file, just before the END keyword
DB 510 - ($ - @start) DUP(0) ; write 0s until the current memory space's pointer reaches 509th byte
DW 0AA55h ; 0x55, 0xAA -> Magic Number at 510th, 511th bytes of current memory space

END @start