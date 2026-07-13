#ifndef _APP_H_
#define _APP_H_

#include "syscfg.h"
#include "Delay.h"
#include "POWER.h"
#include "task.h"
#include "Timer.h"
#include "ready.h"
#include "Int.h"
#include "RC.h"
#include "BUZZ.h"
#include "SBY.h"
#include "REGISTER.h"
/*函数声明*/

void Initial(void);

typedef enum{

RC_ST_led_Close,//高阻状态
RC_led_Open,//RC灯打开状态
STANDBY_led_Open//STANDBY灯打开状态

}SBY_State;//RC_SB状态控制

typedef enum{

High_Register,	//高阻
Low_Register	//低电平

}Register_State;//电阻控制位

/*变量声明*/
typedef struct{

uint8_t Standby_Work_State;	//0:待机状态；1：工作状态

uint8_t RC_Value;//RC报警状态

uint8_t INT_Value;//INT报警状态

uint8_t Ready_Value;//READY就绪状态

uint8_t STANDBY_Value;//STANDBY就绪状态

uint8_t	 Long_Time_Change;//电瓶长时间连接变更标志位,1：退出工作状态

uint8_t Key_Press_Value;//按键长按状态

uint8_t KEY_Value;//按键短按状态

SBY_State	SBY_Value;//RC_SB状态控制

Register_State	RES_Change;//电阻控制状态
}sys;

extern sys SYS;
#endif