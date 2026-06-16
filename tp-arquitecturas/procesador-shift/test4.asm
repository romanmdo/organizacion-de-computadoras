
;Test 2
; Prueba del caso de overflow (-128 x 128).
; El resultado deberia ser erroneo.

;Cargamos los operandos a los registros.
LOAD A multiplicador 
LOAD B multiplicando  

;Llamamos a la instruccion.
MULTBA    
STOP

;Datos.
multiplicador: .data 2 128
multiplicando: .data 2 -128