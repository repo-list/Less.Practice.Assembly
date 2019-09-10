.386

.MODEL flat, stdcall

.DATA
result  DWORD   0
var1    DWORD   1
var2    DWORD   3
var3    DWORD   4

.CODE
FindExceptedNumber PROC
    MOV EAX, 10
    
    SUB EAX, [ESP+4]
    SUB EAX, [ESP+8]
    SUB EAX, [ESP+12]
    RET
FindExceptedNumber ENDP

Main PROC
    PUSH var3
    PUSH var2
    PUSH var1
    CALL FindExceptedNumber
    
    MOV result, EAX
    XOR EAX, EAX
    ADD ESP, 12
    
    RET
Main ENDP

END Main