#ifndef _REGISTER_H_
#define _REGISTER_H_


#include "app.h"

#define REGISTER_PIN_MASK    (1 << 0)   // PA0 对应 bit0
#define REGISTER_TRIS	TRISA	
#define REGISTER_PORT	PORTA	

/*宏定义*/


/*函数声明*/
void REGISTER_Init(void);
void Regiser_Low(void);
void Regiser_High(void);
void REGISTER_Detect(void);
void REGISTER_Control(void);
void REGISTER_Task(void);

#endif