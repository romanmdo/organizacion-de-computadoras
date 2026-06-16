#include <stdio.h>

extern void sumar_matriz(int *matriz_a, int *matriz_b, int *matriz_res, int cantidad);

int main() {
    // Matriz 1: (4 * 9: 26bytes)
    int matriz_A[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };

    // MAtriz 2: igual que la primera
    int matriz_B[3][3] = {
        {10, 10, 10},
        {10, 10, 10},
        {10, 10, 10}
    };

    // Matriz resultado: se rellena de 0s
    int matriz_R[3][3]; 

    printf("Llamando a la subrutina en Assembler...\n");

    sumar_matriz(&matriz_A[0][0], &matriz_B[0][0], &matriz_R[0][0], 9);

    printf("¡Subrutina terminada! Imprimiendo el resultado:\n\n");

    // Recorremos la matriz resultante
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d\t", matriz_R[i][j]); 
        }
        printf("\n"); 
    }

    return 0;
}