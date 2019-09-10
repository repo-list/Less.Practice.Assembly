; You should choose to "Console Assemble & Link", if you're using masm32 editor.

.386

.MODEL flat, stdcall

OPTION casemap: none

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.DATA
firstMsg    DB  "Hello, World 1!", 0Dh, 0Ah, 0
secondMsg   DB  "Hello, World 2!", 0Dh, 0Ah, 0
thirdMsg    DB  "Hello, WOrld 3!", 0Dh, 0Ah, 0

noticeMsg   DB  "Enter Integer Value : ", 0
inputFormat DB  "%d", 0
inputData   DWORD   0

resultMsg1  DB  "Case 1", 0Dh, 0Ah, 0
resultMsg2  DB  "Case 2", 0Dh, 0Ah, 0

.CODE
Main PROC
    ;; Print to Console
    ; Way 1
    PUSH OFFSET firstMsg ; OFFSET is only for global variables (intended as "starting address + offset")
    CALL crt_printf
    ADD ESP, 4

    ; Way 2
    INVOKE crt_printf, OFFSET secondMsg ; INVOKE -> stdcall (callee changes the stack pointer)

    ; Way 3
    INVOKE crt_printf, ADDR thirdMsg ; ADDR is for both global and local variables

    ;; Scan Inputs
    ; scan
    INVOKE crt_printf, OFFSET noticeMsg
    INVOKE crt_scanf, OFFSET inputFormat, OFFSET inputData

    ; print result
    MOV EAX, inputData
    CMP EAX, 10
    JE case1
    JNE case2

case1:
    INVOKE crt_printf, OFFSET resultMsg1
    JMP finally
    
case2:
    INVOKE crt_printf, OFFSET resultMsg2
    JMP finally
    
finally:
    RET
Main ENDP

END Main