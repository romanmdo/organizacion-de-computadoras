; Programa principal
;  ADD trabaja con operandos DIRECTOS

Inicio:
    LOAD NumeroA A
    CALL Imprimir
    
    LOAD NumeroB B
    CALL Imprimir

    ADD A Dos
    CALL Imprimir    

    ADD B Dos
    CALL Imprimir
    STOP

; Subrutina
Imprimir:
    OUT A
    RET

NumeroA: .data 2 2
NumeroB: .data 2 4
Dos: .data 2 2