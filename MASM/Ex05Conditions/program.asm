.386
.MODEL flat, stdcall

.DATA
    var1 DWORD 10
    var2 DWORD 20
    var3 DWORD 0

.CODE
main PROC
    MOV EAX, var1
    CMP EAX, var2           ; compare EAX register's value with var2's value
                            ; and changes FLAGS register's value according to (EAX - var2)'s result
                            
    JG case1                ; jump to label "case1" if the result is "GREATER THAN"
    JE case2                ; jump to label "case2" if the result is "EQUAL TO"
    JL case3                ; jump to label "case3" if the result is "LESS THAN"

    MOV var1, 0DEADBEEFh    ; unreachable code // added for demonstrating the jumps actually work
    MOV var2, 0DEADBEEFh    ; unreachable code
    MOV var3, 0DEADBEEFh    ; unreachable code

case1:                      ; label case1
    MOV var3, 1
    JMP atlast              ; jump to label "atlast" (at the end of main procedure)
    
case2:                      ; label case2
    MOV var3, 2
    JMP atlast
    
case3:                      ; label case3
    MOV var3, 3
    JMP atlast

atlast:                     ; label atlast
    RET
main ENDP

END main