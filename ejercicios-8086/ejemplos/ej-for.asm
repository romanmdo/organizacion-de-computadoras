mov eax, 0           ; EAX va a ser nuestro acumulador total
    mov ecx, 5           ; ¡CLAVE! Cargamos en ECX la cantidad de repeticiones

inicio_for:
    ; --- Cuerpo del bucle ---
    add eax, 10          ; Sumamos 10 al acumulador

    ; La instrucción 'loop' hace DOS cosas automáticamente al mismo tiempo:
    ; 1. Le resta 1 a ECX (decrementa el índice).
    ; 2. Si ECX no llegó a cero, salta a la etiqueta 'inicio_for'.
    ; Si ECX llega a cero, no salta y el programa sigue hacia abajo.
    
    loop inicio_for      ; ¡El bucle se maneja solo!

fin_for:
    ; Cuando llega acá, ECX vale 0 y EAX vale 50.