section .data
    num1 dd 100
    num2 dd 250

section .text
global asm_main

asm_main:
    ; ... prólogo ...

    ; Apilamos las direcciones (Los punteros)
    push num2       ; Apilo la dirección de num2
    push num1       ; Apilo la dirección de num1
    
    call INTERCAMBIAR
    
    add esp, 8      ; Limpiamos la pila (2 parámetros de 4 bytes)

    ; ... epílogo ...

INTERCAMBIAR:
    ; --- Prólogo de la subrutina ---
    push ebp
    mov ebp, esp
    pusha           ; Salvamos todos los registros por las dudas

    ; 1. Rescatamos las DIRECCIONES de la pila
    mov esi, [ebp + 8]   ; ESI ahora tiene la dirección de num1
    mov edi, [ebp + 12]  ; EDI ahora tiene la dirección de num2

    ; ==========================================
    ; 🔥 ZONA CALIENTE: TU TURNO 🔥
    ; ==========================================
    ; Misión: 
    ; Usá EAX y EBX (u otros) para agarrar los valores reales
    ; a los que apuntan ESI y EDI, e intercambialos en la memoria.
    
    mov eax, [esi]  ; EAX ahora tiene el 100
    mov ebx, [edi]  ; EBX ahora tiene el 250

    mov [esi], ebx  ; Metemos el 250 en la casa original del 100
    mov [edi], eax  ; Metemos el 100 en la casa original del 250


    ; ==========================================

    ; --- Epílogo de la subrutina ---
    popa            ; Restauramos los registros
    pop ebp
    ret