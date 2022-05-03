;Using the AddTwo program from Section 3.2 as a reference, 
;write a program that calculates the following expression, 
;using registers: A = (A + B) − (C + D). 
;Assign integer values to the EAX, EBX, ECX, and EDX registers.

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
a word 10 ; 
b dword 10 ; 
c1 dword 10 ; 
d dword 10 ;

.code
main PROC
	mov EAX, a
	mov EBX, b
	mov ECX, c1
	mov EDX, d
    ADD EBX, EAX
	ADD ECX, EDX
	SUB EBX, ECX
	mov EAX, EBX

  INVOKE ExitProcess, 0
main ENDP

END main        ;specify the program's entry point