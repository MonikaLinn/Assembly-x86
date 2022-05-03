.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD


Include Irvine32.inc

.data

	TAB = 9 ; ASCII code for Tab
.code
main PROC
	call Randomize ; init random generator
	;call Rand1
	;call Rand2
	call DiceThrow
	call DiceThrow
  INVOKE ExitProcess, 0
main ENDP

DiceThrow PROC
	mov ecx,2
	L1: 
		mov eax,6 ; values 0 -5
		call RandomRange ; generate random int
		add eax, 1 ;  values from 1 - 6
		call WriteInt ; write signed decimal
		mov al,TAB ; horizontal tab
		call WriteChar ; write the tab
	loop L1
	call Crlf
	ret
DiceThrow ENDP

Rand1 PROC ; Generate ten pseudo-random integers.
	mov ecx,10 ; loop 10 times
	L1: call Random32 ; generate random int
	call WriteDec ; write in unsigned decimal
	mov al,TAB ; horizontal tab
	call WriteChar ; write the tab
	loop L1
	call Crlf
	ret
Rand1 ENDP

Rand2 PROC ; Generate ten pseudo-random integers from -50 to +49
	mov ecx,10 ; loop 10 times
	L1: mov eax,100 ; values 0-99
	call RandomRange ; generate random int
	sub eax,50 ; values -50 to +49
	call WriteInt ; write signed decimal
	mov al,TAB ; horizontal tab
	call WriteChar ; write the tab
	loop L1
	call Crlf
	ret
Rand2 ENDP

END main        ;specify the program's entry point