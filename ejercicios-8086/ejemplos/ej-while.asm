mov eax, 0           ; Nuestro contador arranca en 0

inicio_while:
    cmp eax, 5           ; Comparamos el contador con 5
    je fin_while         ; Si es IGUAL a 5 (Jump if Equal), salimos del bucle

    ; --- Cuerpo del bucle ---
    ; (Acá podrías imprimir el número, sumar otra cosa, etc.)
    inc eax              ; Le sumamos 1 a EAX

    jmp inicio_while     ; Salto incondicional: volvemos arriba a preguntar de nuevo

fin_while:
    ; El programa continúa por acá cuando EAX llega a 5...