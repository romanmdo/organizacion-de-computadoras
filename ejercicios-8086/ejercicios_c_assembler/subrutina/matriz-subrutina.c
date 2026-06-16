#include <stdio.h>

// Le decimos a C que esta subrutina existe en el archivo .asm
// Recibe un puntero (la dirección de memoria) y un entero (el límite)
extern void imprimir_matriz(int *puntero_matriz, int cantidad);

int main() {
    // Creamos nuestra matriz 3x3 en la memoria de C
    int mi_matriz[3][3] = {
        {10, 20, 30},
        {40, 50, 60},
        {70, 80, 90}
    };

    printf("Iniciando la impresión desde Assembler...\n");

    // Llamamos a Assembler. 
    // &mi_matriz[0][0] le entrega la dirección exacta del número 10.
    imprimir_matriz(&mi_matriz[0][0], 9);

    printf("Impresión finalizada.\n");

    return 0;
}