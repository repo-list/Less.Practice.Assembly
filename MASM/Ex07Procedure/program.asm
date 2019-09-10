.386
.MODEL flat, stdcall

.DATA
    result DWORD 0
    
.CODE
AddNumbers PROC
    MOV EAX, [ESP+4]    ; copy the value 1 (ESP+4 ~ ESP+1) to EAX register
    ADD EAX, [ESP+8]    ; add  the value 2 (ESP+8 ~ ESP+5) to EAX register
                        ; operations in [] brackets are calculated before runtime    
    RET
AddNumbers ENDP

Main PROC               ; start of Main Procedure. Let's suppose that current ESP is #88
    PUSH 2              ; push 2 onto the stack (ESP -> #84)
    PUSH 1              ; push 1 onto the stack (ESP -> #80)
    CALL AddNumbers     ; calls another procedure
    
    MOV result, EAX     ; copy EAX register's value to result
                        ; (this is something commonly known as "return value" of a C function)
    XOR EAX, EAX        ; Set EAX register's value to 0
    ADD ESP, 8          ; reset stack pointer to its previous state
    
    RET
Main ENDP

END Main