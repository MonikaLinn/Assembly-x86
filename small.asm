;Complete the program that declares 3 variables. 
;Name the variables a, b, c. 
;Initialize the three variables to 10, 20 and 30 respectively. 
;Declare and initialize the variable d to 100. 
;USE the smallest data size possible for these values.
;Subtract a, b, c from d.

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
a byte 10
b byte 20
c1 byte 30
d byte 100

.code
main PROC

	mov AL, a
	mov BL, b
	mov CL, c1
	mov DL, d
	sub DL, AL
	sub DL, BL
	sub DL, CL

  INVOKE ExitProcess, eax
main ENDP

END main        ;specify the program's entry point