%include "asm_io.inc" 

section .data
    mensaje db "Arrancando programa...", 0  
    mi_numero dd 42

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    INC eax ; REGISTRO
    MOV ebx, [etiqueta] ; INMEDIATO
    ADD eax, 200 ; INMEDIATO
    MOV ax, [ebx]

    mov eax, [etiqueta2]  
    imul eax, [ebx]
       
    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              