%include "asm_io.inc" 

section .data
section .bss

section .text
    global asm_main        

asm_main:     
    ; --- PROLOGO ---             
    enter   0,0            
    pusha                  

    mov eax, 1500
    mov ebx, 500
    call aplicar_descuento

    ; --- EPILOGO ---
    popa                   
    leave                  
    xor     eax, eax       
    ret              

; ==================================================
;             ZONA DE SUBRUTINAS
; ==================================================

aplicar_descuento:
    cmp ebx, eax
    jge bloque_else
    sub eax, ebx
    jmp fin_if

    bloque_else:
        mov eax, 0
        jmp fin_if

    fin_if:
        ret