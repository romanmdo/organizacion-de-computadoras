
;Test 0
; Prueba del caso simple, positivo x positivo (2 x 10).

;Cargamos los operandos a los registros.
LOAD A multiplicador 
LOAD B multiplicando  

;Llamamos a la instruccion.
MULTBA    
STOP

;Datos.
multiplicador: .data 2 10 
multiplicando: .data 2 2