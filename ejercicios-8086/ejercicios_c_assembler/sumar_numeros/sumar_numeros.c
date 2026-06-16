#include <stdio.h>

// Le avisamos a C que esta función existe en el mundo exterior (en Assembler)
extern int sumar_numeros(int a, int b);

int main() {
    int numero1 = 15;
    int numero2 = 25;
    int resultado;

    printf("Llamando a la subrutina en Assembler...\n");

    // Llamamos a la función de Assembler como si fuera una de C normal
    resultado = sumar_numeros(numero1, numero2);

    printf("Assembler devolvió el resultado: %d\n", resultado);

    return 0;
}