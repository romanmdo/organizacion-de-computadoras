    mov eax, 15
    mov ebx, 10

    ; 1. Comparamos los dos registros
    cmp eax, ebx

    ; 2. Preguntamos por lo CONTRARIO (¿Es menor o igual?)
    ; jle significa "Jump if Less or Equal"
    jle bloque_else       ; Si EAX <= EBX, salta al ELSE

    ; --- BLOQUE IF (Solo entra acá si EAX > EBX) ---
    mov ecx, 1            ; Guardamos el 1
    jmp fin_condicional   ; ¡CLAVE! Saltamos al final para no ejecutar el ELSE por accidente

    ; --- BLOQUE ELSE ---
    bloque_else:
        mov ecx, 0            ; Guardamos el 0

    ; --- FIN DEL CONDICIONAL ---
    fin_condicional:
        ; El programa sigue su curso acá...