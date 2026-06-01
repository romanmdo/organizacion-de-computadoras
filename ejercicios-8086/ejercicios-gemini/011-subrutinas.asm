%include "asm_io.inc" 

section .data
section .bss

section .text
    global asm_main        

asm_main:     
    ; --- PROLOGO ---             
    enter   0,0            
    pusha                  

    mov eax, 15
    call duplicar

    call print_int
    call print_nl

    ; --- EPILOGO ---
    popa                   
    leave                  
    xor     eax, eax       
    ret              

; ==================================================
;             ZONA DE SUBRUTINAS
; ==================================================

duplicar:
    mov ebx, eax ; talque, ahora EBX = 15 & EAX = 15
    shl ebx, 1   ; Shifteamos 1 vez el EBX (Multiplicamos por 2)
    mov eax, ebx ; Dejamos el EAX con lo de EBX
    ret          ; Retornamos donde nos quedamos