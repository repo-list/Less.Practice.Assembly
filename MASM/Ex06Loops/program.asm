.386
.MODEL flat, stdcall

.DATA
    sum     DWORD 0
    a       DWORD 10
    count   DWORD 5

.CODE
main PROC
    MOV EAX, sum
    MOV EBX, a
    MOV ECX, count

loop1:                  ; NOTE : some label names are not usable (including "loop", "test", etc.)
    ADD EAX, EBX
    DEC ECX
    CMP ECX, 0
    JNE loop1

    MOV sum, EAX
    RET
main ENDP

END main