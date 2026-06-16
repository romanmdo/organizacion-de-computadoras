section .text
    global sumar_numeros    ; Hacemos la función pública para que C la vea

; Firma equivalente en C: int sumar_numeros(int a, int b);
sumar_numeros:
    ; 1. Prólogo estándar (Armamos nuestro marco de la pila)
    push ebp
    mov ebp, esp

    ; 2. Buscamos los parámetros que nos mandó C
    ; [ebp + 8] es el primer parámetro (a)
    ; [ebp + 12] es el segundo parámetro (b)
    mov eax, [ebp + 8]      ; EAX = a
    mov ecx, [ebp + 12]     ; ECX = b

    ; 3. Hacemos el cálculo
    add eax, ecx            ; EAX = EAX + ECX (El resultado SIEMPRE debe quedar en EAX)

    ; 4. Epílogo estándar (Desarmamos el marco y volvemos a C)
    mov esp, ebp
    pop ebp
    ret