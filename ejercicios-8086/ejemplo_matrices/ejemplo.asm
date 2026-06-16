%include "io.inc"

section .data
    ; 1. DEFINICIÓN DE LA MATRIZ
    ; Visualmente la armamos como 3x3, pero en memoria es lineal.
    ; Usamos 'dd' (Data Doubleword = 4 bytes por número).
    mi_matriz dd 10, 20, 30   ; Fila 0
              dd 40, 50, 60   ; Fila 1
              dd 70, 80, 90   ; Fila 2

    ; Guardamos la cantidad total de elementos (3 filas x 3 columnas = 9)
    total_elementos dd 9      

section .text
global CMAIN
CMAIN:
    mov ebp, esp             ; Preparación estándar de SASM para el depurador

    ; 2. PREPARACIÓN DEL BUCLE (Equivalente a: int i = 0;)
    mov esi, 0               ; ESI va a ser nuestro índice 'i'. Arranca en 0.
    mov ecx, [total_elementos] ; ECX = 9. Es el límite de nuestro bucle.

inicio_bucle:
    ; 3. CONDICIÓN DEL BUCLE (Equivalente a: i < 9)
    cmp esi, ecx             ; Comparamos ESI (índice actual) con ECX (9)
    jge fin_programa         ; JGE (Jump Greater or Equal): Si ESI es >= 9, saltamos al final.

    ; 4. EXTRAER EL DATO DE LA MEMORIA
    ; Usamos nuestro truco mágico: Base + (Índice * Tamaño)
    ; Como caminamos linealmente, ESI va de 0 a 8. 
    ; *4 porque cada número 'dd' pesa 4 bytes.
    mov eax, [mi_matriz + esi*4]

    ; 5. IMPRIMIR EN PANTALLA
    PRINT_DEC 4, eax         ; Macro de SASM: Imprime el número entero guardado en EAX
    NEWLINE                  ; Macro de SASM: Imprime un 'Enter' para que no queden pegados

    ; 6. INCREMENTAR Y REPETIR (Equivalente a: i++)
    inc esi                  ; Le sumamos 1 a ESI
    jmp inicio_bucle         ; Salto incondicional: vuelve arriba para la siguiente vuelta

fin_programa:
    ; 7. LIMPIEZA Y CIERRE
    xor eax, eax             ; Ponemos EAX en 0 (Equivalente a: return 0;)
    ret                      ; Terminamos el programa