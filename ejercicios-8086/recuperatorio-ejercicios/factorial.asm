%include "io.inc"
section .data
    numero dd 5
    
section .bss

section .text
global CMAIN

CMAIN:
    ; Prologo
    push ebp
    mov ebp, esp
    
    mov eax, 5      ; Valor que queremos usar tq 5!
    push eax        ; Apilamos el 5 en la pila
    
    call subrutina
    
    add esp, 4      ; Borramos el parametro
    
    PRINT_DEC 4, eax
    NEWLINE
    
    ; Epilogo
    pop ebp
    ret
    
subrutina:
    ; Prologo
    push ebp
    mov ebp, esp
    
    mov eax, 1
    mov ebx, [ebp + 8]  ; Empezamos con 1 porque sino daria siempre 0
    
    factorial:        
        imul eax, ebx
        dec ebx
        cmp ebx, 1
        ja factorial
    
    ; Epilogo
    pop ebp
    ret