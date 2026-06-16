%include "asm_io.inc" 

section .data
    n1 dd 15
    n2 dd 42
    n3 dd 8

section .bss

section .text
    global asm_main        

asm_main:     
    ; PROLOGO             
    enter   0,0            
    pusha                  

    mov eax, [n1]          ; n1 es el Rey inicial

; --- COMBATE 1 ---
    cmp [n2], eax          ; Comparamos al retador n2 contra el Rey (eax)
    jle comparacion        ; Si n2 es MENOR O IGUAL (jle), saltamos y ESQUIVAMOS el cambio.

    ; Si la CPU lee esta línea, es porque n2 era MAYOR.
    mov eax, [n2]          ; ¡n2 destrona al Rey!

comparacion:
; --- COMBATE 2 ---
    cmp [n3], eax          ; Comparamos al retador n3 contra el Rey actual
    jle fin_condicional    ; Si n3 es MENOR O IGUAL, saltamos directo al final.

    ; Si la CPU lee esta línea, es porque n3 era MAYOR.
    mov eax, [n3]          ; ¡n3 destrona al Rey!
    
fin_condicional:
    call print_int         ; Se imprime el ganador definitivo que quedó en EAX
    call print_nl

    ; EPILOGO
    popa                   
    leave                  
    xor     eax, eax       
    ret           