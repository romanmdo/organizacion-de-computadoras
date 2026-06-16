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
    mov ebx, 7 ; Numero a sumar
    mov ecx, 4 ; Contador de vueltas

    while:
        cmp ecx, 0
        jz fin_while
        
        add eax, ebx
        sub ecx, 1
        jmp while

    fin_while:
        call print_int
        call print_nl


    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              