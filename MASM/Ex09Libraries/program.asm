.386

.MODEL flat, stdcall

OPTION casemap: none ; for enabling to use Win32 API functions (which are generally case-sensitive)
INCLUDE \masm32\include\windows.inc ; relative path can also be used
INCLUDE \masm32\include\user32.inc 
INCLUDELIB \masm32\lib\user32.lib

.DATA
msgBoxCaption   DB      "MessageBox", 0
msgBoxText      DB      "Click Button!", 0
msgClickYes     DB      "Clicked Yes!", 0
msgClickNo      DB      "Clicked No!", 0
returnValue     DWORD   0

.CODE
Main PROC
    INVOKE MessageBox, NULL, ADDR msgBoxText, ADDR msgBoxCaption, MB_YESNO
    MOV returnValue, EAX
    XOR EAX, EAX

    CMP returnValue, 6
    JE clickYes
    JNE clickNo
    
clickYes:
    INVOKE MessageBox, NULL, ADDR msgClickYes, ADDR msgBoxCaption, MB_OK
    JMP finally
    
clickNo:
    INVOKE MessageBox, NULL, ADDR msgClickNo, ADDR msgBoxCaption, MB_OK
    JMP finally
    
finally:
    RET
Main ENDP

END Main