; hello.asm
%include "asm_io.inc" 

; =================================================================
; 1. ZONA DE DATOS (Acá creás tus variables)
; =================================================================
section .data
    ; Acá definís textos o números con un valor inicial.
    ; Podés borrar lo de "hello" y poner los tuyos. Ejemplo:
    etiqueta dd 10010b
    etiqueta2 dd 52h

section .bss
    ; (Opcional) Acá reservás espacio para variables vacías 
    ; (ej. si vas a leer un número del teclado y guardarlo).
    ; variable_vacia resd 1

; =================================================================
; 2. ZONA DE CÓDIGO (La lógica)
; =================================================================
section .text
    global asm_main        ; SAGRADO: Le avisa a C por dónde arrancar.

asm_main:                  ; SAGRADO: La puerta de entrada.
    ; --- INICIO DEL PRÓLOGO (¡NO TOCAR!) ---
    enter   0,0            ; Clava el Base Pointer (BP) de x86.
    pusha                  ; Guarda TODOS los registros actuales en la pila.
    ; ---------------------------------------


    ; 👇👇👇 TU ZONA DE JUEGOS 👇👇👇
    ; Acá borrás lo que tenías y escribís tu programa real.
    ; Podés usar eax, ebx, ecx, edx a tu gusto, total 
    ; el "pusha" de arriba ya los guardó a salvo en la pila.

    INC eax ; REGISTRO
    MOV ebx, [etiqueta] ; INMEDIATO
    ADD eax, 200 ; INMEDIATO
    MOV ax, [ebx]

    mov eax, [etiqueta2]  
    imul eax, [ebx]


    ; 👆👆👆 FIN DE TU ZONA DE JUEGOS 👆👆👆


    ; --- INICIO DEL EPÍLOGO (¡NO TOCAR!) ---
    popa                   ; Restaura TODOS los registros a como estaban.
    leave                  ; Desarma el Base Pointer y limpia variables locales.
    xor     eax, eax       ; Pone eax en 0 (es el "return 0" de C).
    ret                    ; Salta de vuelta al driver.c.
    ; ---------------------------------------