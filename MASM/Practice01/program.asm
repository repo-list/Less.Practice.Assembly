.386
.MODEL flat, stdcall

.DATA
    result DWORD 0

.CODE
GetPowerOf PROC
    MOV EAX, [ESP+4]
    MOV EBX, EAX
    MOV ECX, [ESP+8]

calc:
    CMP ECX, 0
    JE atlast
    MUL EBX
    DEC ECX
    JMP calc

atlast:
    RET
GetPowerOf ENDP

Main PROC
    PUSH 20
    PUSH 2
    CALL GetPowerOf
    MOV result, EAX
    XOR EAX, EAX
    ADD ESP, 8

    RET
Main ENDP
END Main