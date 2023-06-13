float* logmap_perm(int dt, float x,float mu)
{
    float* vlogmap = (float *)malloc(BSIZE*sizeof(float));     // Allocate memory for the array
    if (vlogmap == NULL) {printf("Error! Low memory\n");}

    float x_at = x;
    float y_at = x;

    for (int i = 0; i < dt; i++)
    {
        long double logmap1 = (long double) mu * x_at * (1.0 - x_at);
        long double logmap2 = (long double) mu * y_at - mu * pow(y_at,2);

        x_at = modf(logmap1, NULL);
        y_at = modf(logmap2, NULL);
    }

    for (int i = 0; i < BSIZE; i++)
    {
        long double logmap1 = (long double) mu * x_at * (1.0 - x_at);
        long double logmap2 = (long double) mu * y_at - mu * pow(y_at,2);

        x_at = modf(logmap1, NULL);
        y_at = modf(logmap2, NULL);

        vlogmap[i] = fabs(modf(logmap1, NULL)-modf(logmap2, NULL));
    }
    return vlogmap;
}

uint8_t* permutation(float* v)
{
       int* sorted_index =  (int *)malloc(BSIZE * sizeof(int));                   // Allocate memory for the array

       if (to_ord == NULL) {printf("Error! Low memory\n");}
       if (sorted_index == NULL) {printf("Error! Low memory\n");}

       uint8_t* img = (uint8_t *)malloc(BSIZE * sizeof(uint8_t));          // Allocate memory for the array
       if (img == NULL) {printf("Error! Low memory\n");}

       for (int i = 0; i < BSIZE; i++)
       {
            to_ord[i].value = v[i];
            to_ord[i].index = i;
       }
       qsort(to_ord, BSIZE, sizeof(to_ord[0]), cmp);
       for (int i = 0; i < BSIZE; i++)
       {
            sorted_index[i]=to_ord[i].index;
            img[i] = image[to_ord[i].index];
       }

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
    if (cipher_image == NULL) {printf("Error! Low memory\n");}

    for (int i = 0; i < BSIZE; i++)
    {
           cipher_image[i] =  permuted_image[i] ^ precipher[i];
    }
    return cipher_image;
}