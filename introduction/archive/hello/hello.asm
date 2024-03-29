;**************************************
; print out hello world
; assemble and link using the following:
; nasm -f elf hello.asm
; ld -m elf_i386 -o hello hello.o
;***************************************

section .data
	hello: db 'Hello World!', 10
	helloLen: equ $-hello
	syswrite: equ 4
	stdout: equ 1
	exit: equ 1
	SUCCESS: equ 0
	kernelcall: equ 80h

section .text
	global _start

_start:  			; notice the _ in front of the label, this is convention for function names
	mov eax,syswrite	; 4 is the vector for the syswrite function
	mov ebx,stdout		; standard output, 1 is for stdout
	mov ecx,hello		; the address of the string
	mov edx,helloLen 	; size of the string (number of characters)
	int kernelcall		; call the interrupt to execute the syswrite function

end_start:	
	mov eax,exit		; vector for the exit function
	mov ebx,SUCCESS		; return code 0
	int kernelcall		; call the interrupt to execute the exit function
