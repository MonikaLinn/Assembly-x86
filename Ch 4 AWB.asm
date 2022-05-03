.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	myBytes BYTE 10h,20h,30h,40h
    myWords WORD 3 DUP(?),2000h
    myString BYTE "ABCDE"

.code
main PROC
    ; 12. Align 2
    ; 13. 
    mov eax,TYPE myBytes        ; a.00000001 
    mov eax,LENGTHOF myBytes    ; b.00000004
    mov eax,SIZEOF myBytes      ; c.00000004 
    mov eax,TYPE myWords        ; d.00000002 
    mov eax,LENGTHOF myWords    ; e.00000004
    mov eax,SIZEOF myWords      ; f.00000008 
    mov eax,SIZEOF myString     ; g.00000005 
    ;14.
    mov dx, WORD PTR myBytes    ; 2010h
    ;15.
    mov al, BYTE PTR myWords + 1
    ;16.
    mov eax, DWORD PTR myBytes
    ;17.
    .data 
    myWordsD LABEL DWORD
    myWords2 WORD 3 DUP(?),2000h
    .code
    mov eax, myWordsD
    ;18.
    myBytesW LABEL WORD
    myBytes1 BYTE 10h,20h,30h,40h
    .code
    mov ax,myBytesW


  INVOKE ExitProcess, 0
main ENDP

END main        ;specify the program's entry point