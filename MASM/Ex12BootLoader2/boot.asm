.8087
.MODEL tiny

OPTION SEGMENT: USE16

.CODE
    ORG 07C00h

@start:
    ; Always set DS to CX (Actual value of CS is 0 in tiny model)
    ; initial address for "Data Section" can be different across machines
    ; without this init process, OFFSET command can produce different values in different environments
    MOV AX, CS
    MOV DS, AX

    ; INT 010h which is in First PROC crashes from 7th call
    ; INT 010h which is in Second PROC crashes from 6th call
    ; INT 010h which is in Third PROC crashes from 5th call
    ; ...
Main PROC 
    ; Print Characters
    MOV AL, '1'
    CALL PrintCh
    MOV AL, '2'
    CALL PrintCh
    MOV AL, '3'
    CALL PrintCh
    MOV AL, '4'
    CALL PrintCh
    MOV AL, '5'
    CALL PrintCh
    CALL PrintCh ; PrintCh is the second PROC and this is the 6th call
    CALL PrintCh
    CALL PrintCh
    MOV AL, '6'
    CALL PrintCh
    MOV AL, '7'
    CALL PrintCh
    MOV AL, '8'
    CALL PrintCh
    MOV AL, '9'
    CALL PrintCh

    MOV SI, OFFSET lineBreak
    CALL PrintStr
    MOV SI, OFFSET message1
    CALL PrintStr
    MOV SI, OFFSET message2
    CALL PrintStr
    MOV SI, OFFSET message3
    CALL PrintStr

    JMP $
Main ENDP

PrintCh PROC
    MOV AH, 0Eh
    INT 010h
    RET         ; return to a near address. RETN : Near, RETF : Far, RET : Auto-Detect (By Assembler)
PrintCh ENDP

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
    RET
PrintStr ENDP

; Messages
lineBreak DB 13,10,0
message1 DB "Welcome!", 13,10,0
message2 DB "PrintStr is behaving correctly", 13,10,0
message3 DB "Program Stopped", 0

DB 510 - ($ - @start) DUP(0)
DW 0AA55h

END @start