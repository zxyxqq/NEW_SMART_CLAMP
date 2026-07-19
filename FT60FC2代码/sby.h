#ifndef _SBY_H_
#define _SBY_H_


#include "app.h"

/*宏定义*/
#define LED_PIN_MASK    (1 << 1)   // PA2 对应 bit2
#define LED_TRIS	TRISA	
#define LED_PORT	PORTA	


/*函数声明*/
void SBY_Init(void);
void RC_Open(void);
void STANDBY_Open(void);
void RC_STANDBY_Close(void);
void SBY_Task(void);
void SBY_Control(void);
void SBY_Detect(void);

#endif