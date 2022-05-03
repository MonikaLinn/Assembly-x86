;Write a complete MASM program that has two variables declared len and wid. 
;They should be of type word. Initialize len to 10d and wid to 20d.

;Calculate: the perimeter and the area of the rectangle. Create these variables.

;Take an image of the memory area that has the variables.

.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc

.data
len word 10d
wid word 20d
per word ?

.code
main PROC
	mov ax, 0
	add ax, len
	add ax, wid
	mov dx, 2
	mul dx

	mov per, ax ;perimeter

	mov ax, len
	sub ax, 0
	mov dx, wid
	sub dx, 0
	mul dx
	add ax, 0

	mov bx, per

  exit
main ENDP

END main        ;specify the program's entry point
;I dont think it would change anything 
	;if they were doublewords, i think that it would still yield the same amount of work. 
