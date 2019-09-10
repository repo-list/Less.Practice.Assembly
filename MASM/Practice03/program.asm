.386

.MODEL flat, stdcall

.DATA
result  DWORD   0
array   DWORD   2,5,1,3,4
count   DWORD   5

.CODE
FindExceptedNumber PROC
    MOV ECX, count
    INC ECX
    XOR EAX, EAX
    
temp1:
    ADD EAX, ECX
    DEC ECX
    CMP ECX, 0
    JNE temp1

    MOV ECX, count
    XOR EBX, EBX
    
loop1:
    DEC ECX
    ADD EBX, [array + ECX * 4]
    CMP ECX, 0
    JNE loop1

    SUB EAX, EBX
    
    RET
FindExceptedNumber ENDP

Main PROC
    CALL FindExceptedNumber
    
    MOV result, EAX
    XOR EAX, EAX
    
    RET
Main ENDP

END Main