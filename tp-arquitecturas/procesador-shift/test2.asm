
;Test 2
; Prueba del caso borde de representacion (-128 x 127).

;Cargamos los operandos a los registros.
LOAD A multiplicador 
LOAD B multiplicando  

;Llamamos a la instruccion.
MULTBA    
STOP

;Datos.
multiplicador: .data 2 127
multiplicando: .data 2 -128