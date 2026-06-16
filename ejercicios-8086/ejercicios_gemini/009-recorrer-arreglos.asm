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

    mov eax, 0 ; Acumulador
    mov ebx, 0 ; Indice logico
    mov ecx, 3 ; Arreglo tiene 3 elementos

    sumar_arreglo:
        add eax, [precios + ebx * 4]
        inc ebx
        loop sumar_arreglo
    
    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              