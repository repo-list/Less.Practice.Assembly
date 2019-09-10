; File 1 : boot.asm (should be saved at the MBR sector)
; File 2 : file.asm (should be saved right after the MBR sector)

.8087
.MODEL tiny

OPTION SEGMENT: USE16

.CODE
    ORG 01000h

@start:
    MOV AX, CS
    MOV DS, AX

Main PROC
    MOV AH, 0Eh

    MOV AL, 'O'
    INT 010h
    MOV AL, 'K'
    INT 010h
    
    JMP $
Main ENDP

DB 510 - ($ - @start) DUP(0)
DW 0AA55h

END @start