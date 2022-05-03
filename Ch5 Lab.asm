.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

Include Irvine32.inc

.data
myString Byte "Please enter a number: ", 0
v1 dword ?
v2 byte ?
cols byte ?
rows byte ?

.code
main PROC

	call prtNums
	call prtNums1
	call prtNumsC
	call prtletNum

main ENDP

inputPr proc

	mov edx, offset myString
	call writestring
	call readint
	ret

inputPr endp

prtNums proc
	call inputPr

	mov ecx, eax
	mov al, '1'

	LP:
	push ecx
	mov al, '1'
		LP1:
			call writechar
			inc al
		loop LP1

		call crlf
		pop ecx
	loop LP
	call crlf
prtNums endp

prtNums1 proc
	
	call inputPr

	mov v1, 1
	mov ecx, eax
	mov edx, eax
	mov al, '1'

	LP:
		push ecx
		mov ecx, v1
		mov al, '1'
		LP1:
			call writechar
			inc al
		loop LP1

		inc v1
		mov ecx, edx
		dec edx
		call crlf
	loop LP
	pop ecx
prtNums1 endp

prtNumsC proc
	call inputPr

	mov v2, al
	mov ecx, eax
	mov al, '1'

	movzx ecx, v2
	LP:
		push ecx
		movzx ecx, v2

		LP1:
			call writechar
		loop LP1

		inc al
		call crlf
		pop ecx
	loop LP
	call crlf

prtNumsC endp

prtletNum proc

	mov ecx, 10 ; after 10 the digits become symbols
	mov al, 'A'

	mov dl, '0'
	LP:
		call writeChar
		inc al
		mov bl, al
		mov al, dl
		call writeChar
		inc al
		mov dl, al
		mov al, ' '
		call writeChar
		mov al, bl
		
	loop LP
	call crlf

prtletNum endp



  INVOKE ExitProcess, 0

END main        ;specify the program's entry point