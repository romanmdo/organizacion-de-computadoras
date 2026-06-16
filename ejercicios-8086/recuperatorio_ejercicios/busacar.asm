%include "io.inc"

section .data
    arreglo dd 15, 4, 1, 5, 6 ,7, 8, 9
    buscado dd 2
    
    
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    
    mov ecx, 8
    mov edx, 0
    
    ciclo:
    
        mov eax, [arreglo + edx * 4] ; 4 porque cada instrucción usa 4 celdas
        mov ebx, buscado
        
        push eax
        push ebx
        
        call buscar
        add sp, 4 ; Borramos nuestro parametro
        inc edx        
        
    loop ciclo
            
                                   
    xor eax, eax
    pop ebp
    ret

buscar:
    ; Prologo
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 12] ; Ahora EAX tiene el elemento del arreglo
    mov ebx, [ebp + 8]  ; Y EBX tiene el elemento buscado
    
    cmp eax, ebx

   
      
            
    ; Epilogo
    pop ebp
    ret 