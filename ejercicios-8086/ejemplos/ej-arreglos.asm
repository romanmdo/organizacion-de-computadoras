section .data
    ; dd = 4 bytes cada número. 
    ; Están en las posiciones 0, 4 y 8 respectivamente.
    mi_arreglo dd 10, 20, 30  

section .text
    ; Preparativos
    mov eax, 0      ; EAX va a ser nuestro Acumulador (Suma Total)
    mov ebx, 0      ; EBX va a ser nuestro Índice (arranca en la posición 0)
    
    mov ecx, 3      ; ECX es el contador mágico de la instrucción LOOP (da 3 vueltas)

ciclo_suma:
    ; Acá ocurre la magia: Base + (Indice * Tamaño)
    ; En la 1ra vuelta: ebx = 0 -> mi_arreglo + 0  (Trae el 10)
    ; En la 2da vuelta: ebx = 1 -> mi_arreglo + 4  (Trae el 20)
    ; En la 3ra vuelta: ebx = 2 -> mi_arreglo + 8  (Trae el 30)
    add eax, [mi_arreglo + ebx * 4] 

    ; Preparamos todo para la siguiente vuelta
    inc ebx         ; Subimos el índice (ahora vale 1)

    ; La instrucción LOOP hace dos cosas automáticamente:
    ; 1. Le resta 1 a ECX.
    ; 2. Si ECX no llegó a cero, salta a "ciclo_suma" y da otra vuelta.
    loop ciclo_suma 

    ; Cuando ECX llega a 0, el loop se rompe y el código sigue por acá.
    ; En EAX quedó guardado el 60.