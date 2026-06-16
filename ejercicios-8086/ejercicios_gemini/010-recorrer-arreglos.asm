%include "asm_io.inc" 

section .data
    precios dd 100, 250, 50, 150, 300

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, 0 ; Acumulador
    mov ebx, 0 ; Indice logico
    mov ecx, 5 ; Contador de vueltas

    sumar_arreglo:
        mov edx, [precios + ebx * 4]
        cmp edx, 150
        jle incrementar_indice
        add eax, edx


    incrementar_indice:
        inc ebx
        loop sumar_arreglo
    
    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              