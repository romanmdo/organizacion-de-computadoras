%include "asm_io.inc" 

section .data

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, 20
    mov ebx, 5
    mov ecx, ebx
    add eax, ecx
       
    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              