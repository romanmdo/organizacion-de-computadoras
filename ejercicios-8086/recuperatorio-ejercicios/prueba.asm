%include "io.inc"
section .data
   A1 dw 5,2,3,4,5,1,2,8,3,5
   
section .bss
  

section .text
global CMAIN
CMAIN:
    ; Prologo
    push ebp     ; Guardamos el ancla del Sistema Operativo
    mov ebp, esp ; Seteamos nuestra propia ancla
    
    mov ecx, 10 ; vueltas
    mov edx, 0; indice
    mov ebx, edx
    
    ciclo:
        ; usamos ax porque son 16 bits, cada numero del arreglo esta representado en 16 bits
        mov ax, [A1 + edx * 2] 
        push ax
        call es_par
        add esp, 2
        inc edx
    loop ciclo

    ; Mostramos el resultado
    PRINT_STRING "Cantidad de pares: "
    PRINT_DEC 4, ebx
    NEWLINE
            
    ;Epilogo    
    xor eax, eax ; Retornamos 0 indicando que todo salió bien
    pop ebp      ; Restauramos el ancla del Sistema Operativo
    ret          ; Devolvemos el control

es_par:
    ; Prologo
    push ebp
    mov ebp, esp
       
    mov ax, [ebp + 8]
    and ax, 1
    jnz .salir
    inc ebx
    
    .salir:
    mov eax, 0
    pop ebp
    ret
    ; Epilogo