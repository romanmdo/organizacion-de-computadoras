section .text
    global sumar_matriz

sumar_matriz:
    ; Prologo
    push ebp
    mov ebp, esp
    
    push esi                        ; Indice
    push edi                        ; Lo vamos a usar como borrador
    push ebx                        ; ??
    
    ; Agarramos parametros
    mov eax, [ebp + 8]              ; Primer parametro
    mov ebx, [ebp + 12]             ; Segundo parametro
    mov edx, [ebp + 16]             ; Tercer parametro (0)
    
    mov ecx, [ebp + 20]             ; Cantidad
    mov esi, 0                      ; Indice 

    inicio_bucle:                       
        cmp esi, ecx                ; Comparamos el indice con las vueltas
        jge fin_bucle               ; Si es mayor o igual, break

        mov edi, [eax + esi * 4]    ; Nos traemos al EDI el PRIMER PARAMETRO (M1)
        add edi, [ebx + esi * 4]    ; Sumamos nuestro primer parametro con EL SEGUNDO
        mov [edx + esi * 4], edi    ; Nos movemos a la direccion EDX lo que tenga EDI

        inc esi                     ; Incrementamos nuestro indice
        jmp inicio_bucle            ; Volvemos al inicio del bucle
    
    fin_bucle:
        ; Epilogo
        pop ebx
        pop edi
        pop esi

        mov esp, ebp
        pop ebp
        ret
        

