#ifndef PARAMETERS_H
#define PARAMETERS_H

#include <stdint.h>
#include "xaxidma.h"
#include "xtop_module.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xdebug.h"
#include "encrypto.h"
#include "xtop_module.h"


#include "AxiTimer.h"
#include "parameters.h"
#ifdef XPAR_UARTNS550_0_BASEADDR
#include "xuartns550_l.h"       /* to use uartns550 */
#endif



/* Timeout loop counter for reset
 */
#define RESET_TIMEOUT_COUNTER	10000

#define TEST_START_VALUE	0xC
/*
 * Buffer and Buffer Descriptor related constant definition
 */

#define NUMBER_OF_TRANSFERS	10

/* The interrupt coalescing threshold and delay timer threshold
 * Valid range is 1 to 255
 *
 * We set the coalescing threshold to be the total number of packets.
 * The receive side will only get one completion interrupt for this example.
 */

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/




#define WIDTH 512
#define HEIGHT 512
#define BSIZE HEIGHT*WIDTH


extern AxiTimer TimeResults;
typedef union {
    float f;
    uint32_t   i;
} condIn;



#endif