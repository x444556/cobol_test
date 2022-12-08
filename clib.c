#include <stdio.h>
#include <stdint.h>

void ctest(int* nr){
    printf("[C-TEST] param{int nr=%i} ^ 2 = %i\n", *nr, *nr * *nr);
}
