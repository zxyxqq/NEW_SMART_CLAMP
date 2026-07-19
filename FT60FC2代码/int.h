#ifndef _INT_H_
#define _INT_H_

#include "app.h"

/*宏定义*/
#define INT_PIN_MASK    (1 << 4)   // PA4 对应 bit4
#define INT_TRIS 	TRISA
#define INT_PORT	PORTA
	



/*函数声明*/

void INT_Init(void);
void INT_Read(void);
void INT_Task(void);

#endif