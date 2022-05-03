.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

Include Irvine32.inc
COUNT = 16
.data
	prompt BYTE "Enter an integer: ",0
	prompt2 BYTE "Enter another integer: ",0
	prompt3 BYTE "The sum of your integers is: ",0
.code
main PROC
mov ecx,3
L1:
call Clrscr
	mov dh,12 ;row
	mov dl,39 ;column
	call Gotoxy ;locate cursor
	mov edx, offset prompt
	call WriteString
	call ReadDec
	mov ebx,eax
	mov dh,13 ;row
	mov dl,39 ;column
	call Gotoxy ;locate cursor
	mov edx, offset prompt2
	call WriteString
	call ReadDec
	mov dh,14 ;row
	mov dl,39 ;column
	call Gotoxy ;locate cursor
	mov edx, offset prompt3
	call WriteString
	add eax,ebx
	call WriteDec
	mov dh,15 ;row
	mov dl,39 ;column
	call Gotoxy ;locate cursor
	call WaitMsg
Loop L1
  INVOKE ExitProcess, 0
main ENDP

END main        ;specify the program's entry point