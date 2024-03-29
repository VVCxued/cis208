; file: asm_main.asm
;
; 

%include "asm_io.inc"

segment .data
;
; Output strings
;
num1: db 0x3

segment .bss
input:   resb 100H


segment .text
        global  asm_main
asm_main:
        enter   0,0             ;setup routine
        pusha
;c ← 0
;while b ≠ 0
;    if (b and 1) ≠ 0
;        c ← c + a
;    left shift a by 1
;    right shift b by 1
;return c
        mov     ecx,0
        mov     eax,29
        mov     ebx,25
while:
        test    ebx,1
        jz      endif
        add     ecx,eax
endif:
        shl     eax,1
        shr     ebx,1
        cmp     ebx,0
        jne     while
endwhile:
        mov     eax,ecx
        call    print_int
        call    print_nl
b1:
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
