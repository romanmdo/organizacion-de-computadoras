
;Test 1
; Prueba del caso positivo x negativo (8 x -3).

;Cargamos los operandos a los registros.
LOAD A multiplicador 
LOAD B multiplicando  

;Llamamos a la instruccion.
MULTBA    
STOP

;Datos.
multiplicador: .data 2 -3 
multiplicando: .data 2 8