%include "asm_io.inc" 

section .data

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, 0 ; Acumulador
    mov ecx, 5 ; Contador de vueltas

    bucle:
        add eax, 10
        loop bucle
    
    call print_int
    call print_nl

    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              