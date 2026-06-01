%include "asm_io.inc" 

section .data
    precios dd 100, 200, 300

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, [precios + 0]
    add eax, [precios + (2 * 4)]

    call print_int
    call print_nl

    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              