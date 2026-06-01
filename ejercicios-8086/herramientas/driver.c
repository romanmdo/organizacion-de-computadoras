#include <stdio.h>

// Le avisamos que la funcion en Assembly existe
int asm_main(void);

int main()
{
    int ret_status;
    ret_status = asm_main(); // Llamamos a tu código
    return ret_status;
}