.386
.model flat, stdcall
.stack 4096
INCLUDE Irvine32.inc

.code
main PROC
   call Qone
    call Qtwo
     call Qthree

    exit
main ENDP

Qone proc
.data
    bVal  BYTE   100
    bVal2 BYTE   ?
    wVal  WORD   2
    dVal  DWORD  5
.code
   ; mov esi,wVal   ;= Invalid
   ; mov eip,dVal   ;= Invalid
   ; mov 25,bVal    ;= Invalid
   ; mov bVal2,bVal ;= Invalid
   ; mov ds,45      ;= Invalid
   ret
Qone endp

Qtwo proc
.data
    myByte BYTE 0FFh, 0
.code
    mov AL,myByte		; AL = 0FFh
	mov AH,[myByte+1]	; AH = 00h
	dec ah			    ; AH = FFh
	inc AL			    ; AL = 00h
	dec ax			    ; AX = FEFFh
   ret
Qtwo endp

Qthree proc
.data
    arrayB byte 1,2,3
	x Dword 12345678h
	y word 84h
.code
    mov AL, arrayB       ; 1, 2, 3
    xchg AL, [arrayB+1]  ; 2, 1, 3
    xchg AL, [arrayB+2]  ; 2, 1, 2
    mov arrayB, AL
    mov AL, 84h
    mov AH, 12h
    xchg AL,AH
   ret
Qthree endp

Qfive proc
.data
    Xval dword   17
	Yval dword   00001100b  ; 12
	Zval dword   2
	Rval dword   ?   ;   27= 1Bh
.code
    mov eax, Yval
    neg eax
    add eax, Zval
    mov edx, Xval
    sub edx,eax
    mov Rval, edx
   ret
Qfive endp

Qsix proc
.data
.code
    mov ax,00FFh
	add ax,1	; AX= 0100h SF= 0  ZF= 0  CF= 0
	sub ax,1	; AX= 00FFh SF= 0  ZF= 0 CF= 0
	add aL,1	; AL= 00h   SF= 0  ZF= 1 CF= 1
	mov bh,6Ch
	add bh,95h	; BH= 01h SF= 0  ZF= 0  CF= 1

	mov al,2
	sub al,3	; AL= FFh SF= 1 ZF= 0  CF= 1
   ret
Qsix endp

Qseven proc
.data
.code
    	mov aL,-128
	neg aL	        ; CF = 1 OF = 1 

	mov ax,8000h
	add ax,2	    ; CF = 0 OF = 0

	mov ax,0
	sub ax,2	    ; CF = 1 OF = 0

	mov aL,-5
	sub aL,+125	    ; OF = 1
   ret
Qseven endp

Qeight proc
.data
	varB BYTE 65h,31h,02h,05h
	varW WORD 6543h,1202h
	varD DWORD 12345678h

.code
	mov ax,WORD PTR [varB+2]  ; a.  AX = 0205h X AX =0502
	mov bl,BYTE PTR varD     ; b.  BL = 78h
	mov bl,BYTE PTR [varW+2] ; c.  BL = 02h
	mov ax,WORD PTR [varD+2] ; d.  AX = 1234h
	mov eax,DWORD PTR varW   ; e.  EAX = 12026543
   ret
Qeight endp

Qnine proc
.data
	var1 BYTE ?
	var2 WORD ?
	var3 DWORD ?
	var4 QWORD ?
.code
	mov eax,TYPE var1	; 1
	mov eax,TYPE var2	; 2
	mov eax,TYPE var3	; 4
	mov eax,TYPE var4	; 8

   ret
Qnine endp

Qten proc
.data
	byte1  BYTE 10,20,30         ;
	array1 WORD 30 DUP(?),0,0    ;
	array2 WORD 5 DUP(3 DUP(?))  ;
	array3 DWORD 1,2,3,4         ;
	digitStr BYTE "12345678",0   ;
.code
	mov ecx,SIZEOF array1; 64

   ret
Qten endp

Qeleven proc
.data
	array WORD 10,20,30,40,50,60
.code
	mov eax,LENGTHOF array	; EAX = 6
	mov ebx,SIZEOF array	; EBX = 12

   ret
Qeleven endp

Qtweleve proc
.data
.code
	;a) -128
	;b) 127

   ret
Qtweleve endp

Qthirteen proc
.data
.code
mov ax,6
mov ecx,4
L1:
inc ax
loop L1

	;AX = A
	mov ecx,0
X2:
	inc ax
	loop X2
	;Loop will execute 4 times

   ret
Qthirteen endp


Qfourteen proc
.data
	intarray WORD 100h,200h,300h,400h
.code
	mov edi,OFFSET intarray		; address of intarray
	mov ecx,LENGTHOF intarray	; loop counter
	mov ax,0					; zero the accumulator

L1:
	add ax,[edi] ; add an integer
	inc edi; point to next integer
	loop L1 ; repeat until ECX = 0

   ret
Qfourteen endp

Qfifteen proc
.data
	source  BYTE  "This is the source string",0
	target  BYTE  SIZEOF source DUP(0)
.code
	mov	 eax, OFFSET source    ; reference source to ah
	mov  esi,0			       ; index register
	mov  ecx,SIZEOF source	   ; loop counter
L1:
	mov  al,[eax+esi]		   ; get char from source
	mov  target[esi],al		   ; store it in the target
	inc  esi			       ; move to next character
	loop L1				       ; repeat for entire string
   ret
Qfifteen endp


END main       