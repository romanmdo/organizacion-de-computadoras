%include "io.inc"
section .data 
    numeros dd 10, 4, 5, -1, 2, 0, -5, -3 ; La suma de los positivos da 21
    cantidad dd 8
    
section .bss

section .text
global CMAIN

CMAIN:
    ; Prologo
    push ebp
    mov ebp, esp
    
    mov ecx, [cantidad]     ; ECX = 8
    mov edx, 0              ; Indice logico
    mov eax, 0
    
    ciclo:
        mov ebx, [numeros + edx * 4]
        push ebx
        
        call suma_positivos
        
        add esp, 4
        inc edx
        loop ciclo
    
    PRINT_DEC 4, eax
    NEWLINE
    
    ; Epilogo
    pop ebp
    ret
    
suma_positivos:
    ; Prologo
    push ebp
    mov ebp, esp
    push edi
    
    mov edi, [ebp + 8]
    
    cmp edi, 0  ; EDI = [EBP + 8] = 10
    jl salir 
    add eax, edi
    
    salir: 
    ; Epilogo
    pop edi
    pop ebp
    ret