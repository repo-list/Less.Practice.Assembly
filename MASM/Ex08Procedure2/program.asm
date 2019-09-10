.386
.MODEL flat, stdcall

.DATA
    result DWORD 0

.CODE
AddNumbersCStyle PROC
; preparing new stack segment
    PUSH EBP                    ; save EBP's value to stack
    MOV EBP, ESP                ; copy ESP's value to EBP
    SUB ESP, 0CCh               ; new stack segment size : 0xCC
    PUSH EBX                    ; prepare EBX register for usage that may occur afterwards
    PUSH ESI                    ; prepare ESI register for usage that may occur afterwards
    PUSH EDI                    ; prepare EDI register for usage that may occur afterwards
    LEA EDI, [EBP-0CCh]         ; copy the address (EBP - 0CCh) to EDI register

    MOV ECX, 033h               ; set counter to 033h
    MOV EAX, 0CCCCCCCCh         ; preparation for setting stack segment to the array of "-858993460"
                                ; also known as "Garbage Value"
    REP STOSD                   ; copy EAX register's value to the pointer which EDI register points
                                ; and increase EDI register's pointer value by 4 and decrease ECX by 1
                                ; repeat this process until ECX register's value reaches 0

    MOV EAX, [EBP+8]            ; parameter 1
    ADD EAX, [EBP+12]           ; parameter 2
    ADD EAX, [EBP+16]           ; parameter 3

    POP EDI                     ; popping data vice versa
    POP ESI                     ; popping data vice versa
    POP EBX                     ; popping data vice versa
    MOV ESP, EBP                ; popping data vice versa
    POP EBP                     ; popping data vice versa

    RET
AddNumbersCStyle ENDP

Main PROC
    PUSH 3
    PUSH 2
    PUSH 1
    CALL AddNumbersCStyle
    
    MOV result, EAX
    XOR EAX, EAX
    ADD ESP, 12

    RET
Main ENDP

END Main