%include "asm_io.inc" 

section .data
    num dd 4b ; Elems
section .bss

section .text
    global asm_main        

asm_main:     
    ; --- PROLOGO ---             
    enter   0,0            
    pusha                  

    mov eax, [num]
    mov ebx, 32 ; vueltas
    mov ecx, 0 ; Acc

    .while:
        shr eax, 1
        jnc .es_cero
        inc ecx
        inc ebx
    
    .es_cero:
        sub ecx, ecx
        loop .while

    ; --- EPILOGO ---
    popa                   
    leave                  
    xor     eax, eax       
    ret              

; ==================================================
;             ZONA DE SUBRUTINAS
; ==================================================