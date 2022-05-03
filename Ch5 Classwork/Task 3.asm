.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD


Include Irvine32.inc
COUNT = 16
.data
msg BYTE "Displayed text in every foreground/background color combination.",0
accumulate DWORD 0
.code
main PROC
	mov ecx, COUNT
Foreground:
	mov eax, ecx
	sub eax, 1
	push ecx
	mov ecx,COUNT
Background:
	call SetTextColor
	add eax,COUNT
	mov edx, OFFSET msg
	call WriteString
	call Crlf
loop Background
pop ecx
loop Foreground
  INVOKE ExitProcess, 0
main ENDP

END main        ;specify the program's entry point