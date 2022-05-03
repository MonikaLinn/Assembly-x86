include Irvine32.inc
; Demo Program

.386
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
Msg byte 'Hello World',0
Msg1 byte ' Goodbye Cruel World',0


.code
main proc
    mov edx, offset msg
	call writestring

	mov edx, offset msg1
	call writestring

	mov EBX, 0
	mov BL, 75

	mov BH, 62

	mov BX, 0037h

	mov EAX, 0
	mov AL, 0FFh
	add AL, 1

	mov Al, 1
	add AL, -2

	mov AL, 80h
	add AL, 1

	invoke ExitProcess,0
main endp
end main