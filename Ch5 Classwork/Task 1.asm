.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD


Include Irvine32.inc

.data

	COUNT = 4
	BlueTextOnGray = blue + (lightGray * 16)
	DefaultColor = lightGray + (black * 16)
	arrayD SDWORD 12345678h,1A4B2000h,3434h,7AB9h
	prompt BYTE "Enter a 32-bit signed integer: ",0
.code
main PROC
; Select blue text on a light gray background
	mov eax,BlueTextOnGray
	call SetTextColor
	call Clrscr ; clear the screen
; Display an array using DumpMem.
	mov esi,OFFSET arrayD ; starting OFFSET
	mov ebx,TYPE arrayD ; doubleword = 4 bytes
	mov ecx,LENGTHOF arrayD ; number of units in arrayD
	call DumpMem ; display memory
; Ask the user to input a sequence of signed integers
	call Crlf ; new line
	mov ecx,COUNT
	L1: mov edx,OFFSET prompt
	call WriteString
	call ReadInt ; input integer into EAX
	call Crlf ; new line
; Display the integer in decimal, hexadecimal, and binary
	call WriteInt ; display in signed decimal
	call Crlf
	call WriteHex ; display in hexadecimal
	call Crlf
	call WriteBin ; display in binary
	call Crlf
	call Crlf
	Loop L1 ; repeat the loop
; Return the console window to default colors
	call WaitMsg ; "Press any key..."
	mov eax,DefaultColor
	call SetTextColor
	call Clrscr

  INVOKE ExitProcess, 0
main ENDP

END main        ;specify the program's entry point