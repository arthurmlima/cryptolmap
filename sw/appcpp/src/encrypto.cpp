#include"encrypto.h"

extern uint8_t imagem[BSIZE];
float* logmap_perm(int dt, float x,float mu)
{
    float* vlogmap = (float *)malloc(BSIZE*sizeof(float));     // Allocate memory for the array
    if (vlogmap == NULL) {xil_printf("Error! Low memory 1\n");}

    float x_at = x;
    float y_at = x;

    for (int i = 0; i < dt; i++)
    {
        long double logmap1 = (long double) mu * x_at * (1.0 - x_at);
        long double logmap2 = (long double) mu * y_at - mu * powf(y_at,2);

        x_at = std::modf(logmap1, NULL);
        y_at = std::modf(logmap2, NULL);
    }

    for (int i = 0; i < BSIZE; i++)
    {
        long double logmap1 = (long double) mu * x_at * (1.0 - x_at);
        long double logmap2 = (long double) mu * y_at - mu * powf(y_at,2);

        x_at = std::modf(logmap1, NULL);
        y_at = std::modf(logmap2, NULL);

        vlogmap[i] = fabs(std::modf(logmap1, NULL)-std::modf(logmap2, NULL));
        //xil_printf("%f\n",vlogmap[i]);
    }
    return vlogmap;
}

uint8_t* permutation(float* v)
{
	   str* to_ord = (str *)malloc(BSIZE * sizeof(str));
       int* sorted_index =  (int *)malloc(BSIZE * sizeof(int));                   // Allocate memory for the array

       if (to_ord == NULL) {xil_printf("Error! Low memory 2\n");}
       if (sorted_index == NULL) {xil_printf("Error! Low memory 3\n");}

       uint8_t* img = (uint8_t *)malloc(BSIZE * sizeof(uint8_t));          // Allocate memory for the array
       if (img == NULL) {xil_printf("Error! Low memory 4\n");}
        
       for (int i = 0; i < BSIZE; i++)
       {
            to_ord[i].value = v[i];
            to_ord[i].index = i;
       }
       qsort(to_ord, BSIZE, sizeof(to_ord[0]), cmp);
       TimeResults.Get_end_perm_sort();
       for (int i = 0; i < BSIZE; i++)
       {
            sorted_index[i]=to_ord[i].index;
            img[i] = imagem[to_ord[i].index];
       }
         TimeResults.Get_end_perm_scramble();
       return  img;
}


int cmp(const void* a, const void* b)
{
    struct str* a1 = (struct str*)a;
    struct str* a2 = (struct str*)b;
    if ((*a1).value > (*a2).value)
        return -1;
    else if ((*a1).value < (*a2).value)
        return 1;
    else
        return 0;
}


uint8_t* cipherxor(uint8_t* permuted_image, uint8_t* precipher)
{
    uint8_t* cipher_image = (uint8_t *)malloc(BSIZE * sizeof(uint8_t));    // Allocate memory for the array
    if (cipher_image == NULL) {xil_printf("Error! Low memory\n");}

    for (int i = 0; i < BSIZE; i++)
    {
           cipher_image[i] =  permuted_image[i] ^ precipher[i];
    }
    return cipher_image;
}
