; Semi-colon based comments

.386                    ; gonna be using 386 processor's instruction set
.MODEL flat, stdcall    ; gonna be sharing one memory space & be using "stdcall" calling convention

INCLUDELIB  C:\masm32\lib\kernel32.lib      ; including library file to the project
INCLUDE     C:\masm32\include\kernel32.inc  ; including other files to the project
                                            ; you can now use kernel32's procedures
                                            ; (not used in this project, though)

.DATA                   ; the DATA section
    temp DWORD 10       ; assign an integer value 10 to the 32-bit global variable "temp"

.CODE                   ; the CODE section (includes procedures and the program's starting point)

HelloWorld PROC         ; beginning of the procedure "HelloWorld"
    ADD temp, 3         ; increase temp by 3
Label1:                 ; adding a label (you can jump here or do some other things using its name)
    SUB temp, 2         ; decrease temp by 2
    RET                 ; return
HelloWorld ENDP         ; end of the procedure "HelloWorld"

main PROC               ; beginning of the procedure "main"
    CALL HelloWorld     ; calling the procedure "HelloWorld"
    RET                 ; return (since there's nowhere to return, it begins ending current process)
main ENDP               ; end of the procedure "main"

END main                ; denotes the end of the file, setting "main" as the program's starting point
                        ; starting point can either be a procedure name or a label name