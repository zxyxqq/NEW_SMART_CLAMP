#ifndef	_APP_H_
#define	_APP_H_

#include "syscfg.h"
#include "POWER.h"
#include "task.h"
#include "adc.h"
#include "delay.h"
#include "Timer.h"
#include "ready.h"
#include "Int.h"
#include "BUZZTT.h"
#include "LB.h"
/*函数声明*/

void Initial(void);


/*变量声明*/
typedef struct{

uint8_t Standby_Work_State;	//0:待机状态；1：工作状态

uint8_t LB_Value;		//LB报警标志位;0:不报警;l:报警

uint8_t INT_Value;		//LB报警标志位;0:不报警;l:报警

uint8_t Relay_Release;	//夹子松脱标志位

uint8_t KEY_Value;		//按键长按导通标志位(待机)

uint8_t Vadc_Value;		//电池端高低压报警标志位

uint8_t Cadc_Value;		//电瓶端低电压报警标志位

uint8_t READY_Value;	//继电器开关标志位

uint8_t STANDBY_Value;	//STANDBY就绪标志位,1:打开；0：关闭

uint16_t Vbattery_Adc;	//电池端模拟电压

uint16_t Cbattery_Adc;	//电瓶端模拟电压

uint8_t	 Long_Time_Change;//电瓶长时间连接变更标志位,1：退出工作状态

}sys;

extern sys SYS;


#endif

