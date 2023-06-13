#ifndef ENCRYPTO_H
#define ENCRYPTO_H
#include <iostream>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <time.h>

float* logmap_perm(int dt, float x,float mu);
uint8_t* permutation(float* v);
int cmp(const void* a, const void* b);


#endif

