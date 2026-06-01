%include "asm_io.inc" 

section .data
    L1 db 0
    L6 db 18h
    L2 dd 1Ah

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    ; a)
    mov eax, L1 ; te queda 0 en EAX
                ; EAX = L1

    ; b)
    mov eax, [L6] ; Busca en la direcciòn L6 y lo copia al EAX
    add eax, [L6] ; Suma lo que haya en EAX con lo que tenga la direccion L6
                  ; EAX = 30h

    ; c)
    mov AL, [L2] ; Copia lo que haya en la direccion L2 y se lo da a AL
                 ; EAX = 1Ah

    ; d)
    mov ax, 5h ; Copia 5h a ax
    shl ax, 1  ; shifteas un 1 a la izquierda 
    shr ax, 1  ; shifteas un 1 a la derecha
               ; EAX = 5h

    ; e)
    mov eax, 0110b ; Le copiamos el 0110 a EAX
    rol ax, 1 ; Rotamos AX para la izquierda 1 vez
    ror ax, 2 ; Rotamos AX para la derecha 2 veces
              ; EAX = 0011b

    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret              