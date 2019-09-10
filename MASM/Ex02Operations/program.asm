.386
.MODEL flat, stdcall

.DATA
    var1 DWORD 10       ; declares a 32-bit global variable var1, initializing its value to 10
    var2 DWORD 20       ; declares var2 with a value 20
    var3 DWORD 0        ; declares var3 with a value 0
    var4 DWORD 0        ; declares var4 with a value 0
    var5 DWORD 0        ; declares var5 with a value 0

.CODE
main PROC
    MOV EAX, var1       ; copy var1's value to EAX register
    ADD EAX, var2       ; add var2's value to EAX register
    MOV var3, EAX       ; copy EAX register's value to var3

    INC EAX             ; increase EAX register's value by 1
    SUB EAX, var1       ; decrease EAX register's value by var1's value
    MOV var4, EAX       ; copy EAX register's value to var4

    MOV EAX, var3       ; copy var3's value to EAX register
    DEC EAX             ; decrease EAX register's value by 1
    MOV var5, EAX       ; copy EAX register's value to var5

    RET
main ENDP

END main