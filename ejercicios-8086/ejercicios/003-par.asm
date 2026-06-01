%include "asm_io.inc" 

section .data
    pares dw 2, 4, 5, 6

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, 0 ; Acumulador
    mov ebx, 0 ; Indice logico
    mov ecx, 4 ; Vueltas

    while:
        mov edx, [pares + ebx * 2]
        push edx
        and edx, 1
        jz numero_impar 
        pop edx
        add eax, edx
        jmp siguiente
        
    numero_impar:
        pop edx

    siguiente:
        inc ebx
        loop while


    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              