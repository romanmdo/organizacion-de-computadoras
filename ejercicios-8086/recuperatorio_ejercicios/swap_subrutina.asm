%include "io.inc"
section .data
   N1 dd 4
   N2 dd 5 
   
section .bss
  

section .text
global CMAIN
CMAIN:
    ; Prologo
    push ebp     ; Guardamos el ancla del Sistema Operativo
    mov ebp, esp ; Seteamos nuestra propia ancla
    
    mov eax, N1
    mov ebx, N2
    
    push eax
    push ebx
    call .swap
    add esp, 8
    
    ;Epilogo    
    xor eax, eax ; Retornamos 0 indicando que todo salió bien
    pop ebp      ; Restauramos el ancla del Sistema Operativo
    ret          ; Devolvemos el control

.swap:
    ; Prologo
    push ebp
    mov ebp, esp
       
    ; Guardamos registros protegidos que vamos a usar como cadetes
    push ebx
    push esi
    push edi
    
    ; Nos guardamos las direcciones
    mov esi, [ebp + 8]
    mov edi, [ebp + 12]
    
    ; Buscamos valores reales
    mov eax, [esi]
    mov ebx, [edi]
    
    ; Swap
    mov [esi], ebx
    mov [edi], eax
    
    ; Restauramos
    pop edi
    pop esi
    pop ebx
  
    mov eax, 0
    pop ebp
    ret
    ; Epilogo
    
    
    