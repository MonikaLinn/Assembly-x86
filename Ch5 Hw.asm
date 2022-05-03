.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

Include Irvine32.inc

.data
myString Byte "Please enter a number: ", 0
v1 dword ?
cols byte ?
rows byte ?
aName BYTE "Abraham Lincoln",0
nameSize = ($ - aName) - 1

.code
main PROC

	call prtAlpha
	call prtAlphaS
	call prtStars
	call prtStarsB
	call prtColumns

main ENDP

prtAlpha proc

	mov al, 'A'
	mov ecx,26
	L1:
	call writeChar
	inc al
	Loop L1
	call crlf

prtAlpha endp

prtAlphaS proc

	mov al, 'A'
	mov ecx,26
	L1:
	call writeChar
	inc al
	mov bl, al
	mov al, ' '
	call writeChar
	mov al, bl
	Loop L1
	call crlf

prtAlphaS endp

prtStars proc
	mov edx, offset myString
	call writestring
	call readint

	mov ecx, eax
	mov al, '*'

	LP:
	push ecx
		LP1:
			call writechar
		loop LP1

		call crlf
		pop ecx
	loop LP
	call crlf

prtStars endp

prtStarsB proc

		mov edx, offset myString
    call writeString
	call readint

	mov v1, 1
	mov ecx, eax
	mov edx, eax
	mov al,  '*'
	
	LP:
		push ecx
		mov ecx, v1
		LP1:

			call writechar
			
		loop LP1

		inc v1
		mov ecx, edx
		dec edx

		call crlf
	loop LP
	pop ecx
prtStarsB endp

prtColumns proc

	mov edx, offset myString
    call writeString
	call readint

	mov rows, al
	call writeString
	call readint
	mov cols, al

	movzx ecx, rows
	LP: 
		push ecx
		movzx ecx, cols
		mov al, '*'

		LP1:
			call writechar
		loop LP1
		call crlf
		pop ecx
	loop LP

prtColumns endp

prtReverse proc
; Push the name on the stack.
	mov ecx,nameSize
	mov esi,0

L1: movzx eax,aName[esi] ; get character
	push eax ; push on stack
	inc esi
	loop L1

; Pop the name from the stack, in reverse,
; and store in the aName array.
	mov ecx,nameSize
	mov esi,0

L2: pop eax ; get character
	mov aName[esi],al ; store in string
	inc esi
	loop L2
prtReverse endp


  INVOKE ExitProcess, 0

END main        ;specify the program's entry point