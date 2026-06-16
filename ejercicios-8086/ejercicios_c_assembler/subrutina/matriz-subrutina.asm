section .data
    ; Creamos el texto de formato para printf: "%d\n"
    ; 10 es el código ASCII del "Enter" (salto de línea)
    ; 0 es el caracter nulo obligatorio para terminar textos en C
    formato db "%d", 10, 0 

section .text
    global imprimir_matriz
    extern printf           ; ¡Importamos la función printf desde C!

imprimir_matriz:
    ; --- PRÓLOGO ---
    push ebp
    mov ebp, esp
    push esi                ; Por convención de C, si usamos ESI debemos guardarlo

    ; --- CAPTURAR PARÁMETROS ---
    mov eax, [ebp + 8]      ; EAX = Puntero a la matriz (Dirección del número 10)
    mov ecx, [ebp + 12]     ; ECX = Cantidad de elementos (9)
    mov esi, 0              ; ESI = Nuestro índice (i = 0)

inicio_bucle:
    cmp esi, ecx            ; ¿Llegamos a 9?
    jge fin_bucle           ; Si es mayor o igual, terminamos

    ; --- EXTRAER EL NÚMERO ---
    ; EAX tiene la dirección base. Le sumamos (Índice * 4 bytes).
    mov edx, [eax + esi*4]  ; EDX = El número actual a imprimir

    ; --- PREPARAR LA LLAMADA A PRINTF ---
    ; Como printf es una función, puede sobreescribir nuestros registros EAX y ECX.
    ; Por seguridad, los guardamos en la pila antes de llamar a printf.
    push ecx                
    push eax                

    ; Le pasamos los parámetros a printf (en x86 se pasan al revés, de derecha a izquierda)
    push edx                ; 2do parámetro de printf: el número (ej: 10)
    push formato            ; 1er parámetro de printf: el texto "%d\n"
    call printf             ; Ejecutamos printf
    
    add esp, 8              ; "Limpiamos" los 2 parámetros que le pasamos a printf (4+4 bytes)

    ; Restauramos nuestros registros para seguir el bucle tranquilos
    pop eax                 
    pop ecx                 

    ; --- SIGUIENTE VUELTA ---
    inc esi                 ; i++
    jmp inicio_bucle        ; Volvemos arriba

fin_bucle:
    ; --- EPÍLOGO ---
    pop esi                 ; Restauramos el ESI original para no romper C
    mov esp, ebp
    pop ebp
    ret