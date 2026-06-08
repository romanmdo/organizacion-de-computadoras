%include "io.inc"
section .data
    n1 dd 10
    n2 dd 15
    
section .bss

section .text
global CMAIN

CMAIN: 
    ; Prologo
    push ebp
    mov ebp, esp
    
    mov eax, n1
    mov ebx, n2
    
    push eax
    push ebx
    
    call swap
    
    add esp, 8      ; Borramos los parametros 
    
    ; Epilogo
    pop ebp
    ret
    
swap:
    ; Prologo
    push ebp
    mov ebp, esp
    sub esp, 12
   
    push edi
    push esi
    push ebx
    
    mov edi, [ebp + 8]  ; EDI = N1 = 10
    mov esi, [ebp + 12] ; ESI = N2 = 15
    
    mov eax, [edi]
    mov ebx, [esi]
    
    mov [edi], ebx
    mov [esi], eax
    
    
    pop ebx
    pop esi
    pop edi
    add esp, 12
    
    ; Epilogo
    pop ebp
    ret