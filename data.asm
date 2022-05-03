;Data Definitions

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
a byte 5
b sbyte 6
c1 word 7
d sword 8
e dword 9
f sdword 10
g fword 11
h qword 12
i tbyte 13
j real4 14.0
k real8 15.0
l real10 16.0

.code
main PROC

  INVOKE ExitProcess, eax
main ENDP

END main        ;specify the program's entry point