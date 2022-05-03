;Q1. The difference between INC and ADD operations 
;is that they both update flag registers but INC does 
;not affect the CF flag, while ADD does.


;Algorithm Workbench Questions 
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	test1 dword 456789ABh 
	fake1 dword ? 
	byte 45h, 67h, 89h, 0ABh 
	dec1 = 25; 25d 
	hex1 = 19h 
	oct1 = 31o 
	bin1 = 11001b 
	testpos1 dword ? 
	testptr dword $ 
	numarray dword 120 dup(?) 
	size1 = ( $ - numarray) 
	numarrayptr dword $ 
	endnum word ? 
	fivelet1 byte "a", "b", "c", "d", "e" 
	fivelet2 byte  "abcdef"
	small dword 80000000h 

.code
main PROC
	mov eax, testptr 
	mov eax, size1 
	mov ebx, numarrayptr 
	sub ebx, eax
	Mov eax, Test1
 
	mov eax, 5 
	mov ebx, 5 
	mov ecx, 5 
	mov edx, 5  


  INVOKE ExitProcess, 0
main ENDP

END main

