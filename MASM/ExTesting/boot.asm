; File 1 : boot.asm (should be saved at the MBR sector)
; File 2 : file.asm (should be saved right after the MBR sector)

.8087
.MODEL tiny

OPTION SEGMENT: USE16

.CODE
    ORG 07C00h

@start:
    ; What you should know before continuing
    ; link : https://stackoverflow.com/questions/43359327/default-registers-and-segments-value-on-booting-x86-machine
    
    MOV AX, CS
    MOV DS, AX  ; used for messages' offset
    MOV AX, 0
    MOV ES, AX  ; used for saving codes as a result of disk read process

Main PROC
    ; Read Disk (Reference : http://stanislavs.org/helppc/int_13-2.html)
    MOV SI, OFFSET loadingMsg
    CALL PrintStr

    MOV AH, 2   ; means we're going to read disk sectors
    ; don't need to specify the drive number (DL) because the value has already been saved by BIOS 
    
    MOV CH, 0   ; cylinder number (CHS Addressing - C)
    MOV DH, 0   ; head number (CHS Addressing - H)
    MOV CL, 2   ; sector number (CHS Addressing - S // sector 1 = MBR sector)
    MOV AL, 1   ; number of sectors to read (each disk sector is 512 bytes for magnetic disks)

    MOV BX, nextCodeAddr ; ES:BX => pointer to buffer (ES = 0, BX = 0x1000 -> Real Address : 0x1000)
    INT 013h

    ; Execute Boot
    ; MOV SI, OFFSET executingMsg
    ; CALL PrintStr
    
    CALL nextCodeAddr
    
    ; Codes below this point should not be run
    ; MOV SI, OFFSET dummyMsg
    ; CALL PrintStr

    JMP $
Main ENDP

PrintStr PROC
    XOR BX, BX
    MOV AH, 0Eh

@psLoop:
    MOV AL, BYTE PTR [SI + BX]
    CMP AL, 0
    JE @psEnd
    INT 010h
    INC BX
    JMP @psLoop

@psEnd:
    RETN
PrintStr ENDP

; Messages
loadingMsg DB "Loading... ", 0
executingMsg DB "complete.", 13,10, "Executing the next program...", 13,10,0
dummyMsg DB "Dummy test message. This msg should not appear on the screen", 13,10,0

; Address
nextCodeAddr WORD 01000h

DB 510 - ($ - @start) DUP(0)
DW 0AA55h

END @start