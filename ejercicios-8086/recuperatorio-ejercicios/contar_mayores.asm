%include "io.inc"

section .data
    arreglo dd 15, 8, 22, 4, 19, 30, 2, 10
    umbral dd 15

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
        
    mov ecx, 8 ; Vueltas que va a dar el bucle
    mov edx, 0 ; Indice
    mov esi, 0
    
    ciclo:
        mov eax, [arreglo + edx * 4]  
        push eax        ; Pusheamos el EAX al Stack
        push [umbral]   ; Pusheo lo que haya en la dirección umbral
        
        
        call contar_mayores
        
        
        add sp, 8
        add esi, eax
        
        
        ind edx
    loop ciclo
        
    xor eax, eax
    pop ebp
    ret

contar_mayores:
    ; Prologo
    push ebp
    move ebp, esp
    
    mov eax, [ebp + 12] ; EAX tiene el elemento del arreglo
    mov ebx, [ebp + 8]  ; Ahora EBX tiene el umbral    
    
    cmp eax, ebx
    jbe umbral_menor
    mov eax, 1
    jmp salir
    
    umbral_menor:
    mov eax, 0
   
    salir:
    ; Epilogo
    pop ebp
    ret 