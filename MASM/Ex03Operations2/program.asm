.386
.MODEL flat, stdcall

.DATA
    var1 DWORD 10
    var2 DWORD 2
    var3 DWORD 0
    var4 DWORD 0

.CODE
main PROC
    MOV EAX, var1
    MUL var2
    MOV var3, EAX

    MOV EAX, var1
    DIV var2
    MOV var4, EAX
    
    RET
main ENDP

END main