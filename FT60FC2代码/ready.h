#ifndef _READY_H_
#define _READY_H_


#include "app.h"


/*宏定义*/

#define	READY_PIN_MASK	(1 << 5)
#define READY_TRIS	TRISC
#define	READY_PORT	PORTC


/*继电器导通关断操作变量*/
#define	Open_Time		 600	//5ms*600 = 3s
#define	Close_Time		 20		//5ms*20 = 100ms
#define	Delay_Time		 200	//5ms*200 = 1s
#define	CYCLIC_START_POINT	400//跳过当前的导通时间


 typedef enum {
    ST_PRE_ON,    // 初始3s导通
    ST_OFF,       // 100ms关断
    ST_FINAL_ON,  // 2s导通
    ST_DETECT     // 检测
} TaskState_t;


/*函数声明*/
void Ready_Init(void);
void Ready_Control(uint8_t on);
void READY_Task(void);


#endif