%include "asm_io.inc" 

section .data
    secreto dd 5

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, [Secreto];
    shl eax, 3 ; Multiplicamos por 8
    add eax, 3

    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              