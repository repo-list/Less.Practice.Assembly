.386
.MODEL flat, stdcall

.DATA
    var1 DB 00101101b   ; declares an 8-bit global variable with binary value 00101101
    var2 DB 10100111b
    var3 DB 00000000b
    var4 DB 00000000b
    var5 DB 00000000b
    var6 DB 00000000b

.CODE
main PROC
    MOV CL, var1        ; copy var1's value to AL register
    SHL CL, 2           ; Left-shift AL register's value by 2
    MOV var3, CL        ; copy AL register's value to var3

    MOV CL, var2
    SHR CL, 1           ; Right-shift AL register's value by 1
    MOV var4, CL

    MOV CL, var2
    ROL CL, 3           ; Left-rotate AL register's value by 3
    MOV var5, CL

    MOV CL, var1
    ROR CL, 4           ; Right-rotate AL register's value by 4
    MOV var6, CL

    RET
main ENDP

END main