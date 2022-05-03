;Complete the program that declares 3 variables. 
;Name the variables a, b, c. 
;Initialize the three variables to 10, 20 and 30 respectively. 
;Declare and initialize the variable d to 100. 
;USE the largest data size possible for these values.
;Subtract a, b, c from d.

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
a dword 10
b dword 20
c1 dword 30
d dword 100

.code
main PROC

	mov EAX, a
	mov EBX, b
	mov ECX, c1
	mov EDX, d
	sub EDX, EAX
	sub EDX, EBX
	sub EDX, ECX

  INVOKE ExitProcess, eax
main ENDP

END main        ;specify the program's entry point