;Fibonacci Numbers
.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc

.data 
fibArray Dword 7 DUP (1,1,?,?,?,?,?) ;fib array
var1 Dword 5 ;loops

.code
main PROC
	
  mov ecx, var1
  mov ESI, OFFSET fibArray
  Add ESI, TYPE fibArray
  Add ESI, TYPE fibArray

  L1:
 MOV EAX,[ESI-4]
 MOV EBX,[ESI-8]
 ADD EAX,EBX
 MOV [ESI],EAX
 ADD ESI, TYPE fibArray
 call readint
  Loop L1

  exit
main ENDP

END main        ;specify the program's entry point