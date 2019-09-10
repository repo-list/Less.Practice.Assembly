.8087
.MODEL tiny

OPTION SEGMENT: USE16

.CODE
    ORG 07C00h

@start:
    MOV AX, CS
    MOV DS, AX

Main PROC
    MOV SI, OFFSET message1
    CALL PrintStr
    MOV SI, OFFSET message2
    CALL PrintStr
    MOV SI, OFFSET message3
    CALL PrintStr
    MOV SI, OFFSET message4
    CALL PrintStr
    MOV SI, OFFSET singleChar ; 'A' - Trick to print the same result both in VMs and in real devices
    CALL PrintStr
    MOV AL, 8 ; backspace - Trick to print the same result both in VMs and in real devices
    CALL PrintCh
    MOV AL, 'A' ; Trick to print the same result both in VMs and in real devices
    CALL PrintCh
    MOV AL, 8 ; backspace ; Trick to print the same result both in VMs and in real devices
    CALL PrintCh
    MOV SI, OFFSET message5
    CALL PrintStr
    MOV SI, OFFSET message6
    CALL PrintStr
    MOV SI, OFFSET message7
    CALL PrintStr
    MOV SI, OFFSET message8
    CALL PrintStr

    JMP $
Main ENDP

PrintCh PROC
    MOV AH, 0Eh
    INT 010h
    RETN
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
    RETN
PrintStr ENDP

; Messages
message1 DB "This is the first line.", 13,10,0
message2 DB "This is the second line.", 13,10,0
message3 DB "This is the third line.", 13,10,0
message4 DB "This is the fourth line.", 13,10,0
singleChar DB 'A',0
message5 DB "This is the fifth line.", 13,10,0
message6 DB "This is the sixth line.", 13,10,0
message7 DB "This is the seventh line.", 13,10,0
message8 DB "This is the eighth line.", 13,10,0

DB 510 - ($ - @start) DUP(0)
DW 0AA55h

END @start