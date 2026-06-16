%include "asm_io.inc" 

section .data

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, 1
    mov ecx, 5

    while_fact:
        mul ecx
        loop while_fact
    
    call print_int
    call print_nl

    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              