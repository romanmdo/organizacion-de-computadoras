%include "asm_io.inc" 

section .data
    NumA dd 15
    NumB dd 25


section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, [NumA] ; 15
    mov ebx, [NumB] ; 25
    cmp eax, ebx ; Comparas 15 y 25
    jl bloque_else ; EAX es menor a EBX

    sub eax, ebx
    jmp fin_condicional

bloque_else:
    sub ebx, eax
    mov eax, ebx
    jmp fin_condicional

fin_condicional:
    call print_int
    call print_nl

    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              