#include "LB.h"

/*
	输出高时STANDBY灯亮
    输出低是LB灯亮
    输入时为高阻，都不亮


*/
/*-------------------------------------------------
 *  函数名LB_Init
 *	功能：  
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void LB_Init(void)
{
	TRISB  |= 0B00100000;	//高阻输入都不亮
}
/*-------------------------------------------------
 *  函数名STNADBY_Control
 *	功能：  打开STANDBY灯
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void STNADBY_Control(void)
{
	if(SYS.STANDBY_Value)
    {
		TRISB  &= ~0B00100000;	//
        PB5 = 1;
    }
}
/*-------------------------------------------------
 *  函数名LB_Control
 *	功能：  打开LB灯
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void LB_Control(void)
{
	if(SYS.LB_Value)
    {
		TRISB  &= ~0B00100000;	//
        PB5 = 0;
    }
}
/*-------------------------------------------------
 *  函数名LB_STANDBY_Close
 *	功能：  使LB,STANDBY灯熄灭
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void LB_STANDBY_Close_Control(void)
{
	if(SYS.Standby_Work_State)
    {
		TRISB  |= 0B00100000;	//高阻输入都不亮
    }
	
}

/*-------------------------------------------------
 *  函数名Work_State_Change
 *	功能：  控制待机状态和工作状态的切换
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void Work_State_Change(void)
{
	/*如何进入工作状态?
		1.不报警的前提下按键导通或者是没有松脱
        
       
       如何退出工作状态:
       1.发生报警
       2.发生夹子松脱.
    */

	if(!SYS.Standby_Work_State)//待机状态下
    {
		if(!SYS.INT_Value && !SYS.LB_Value)//不报警的前提下先STANDBY
		{
			SYS.STANDBY_Value = 1;
		}
        
        if(SYS.STANDBY_Value && (!SYS.Relay_Release || SYS.KEY_Value))//连接或者是按键导通,进入工作状态
		{
			SYS.Standby_Work_State = 1;
			SYS.READY_Value = 1;
            SYS.STANDBY_Value = 0;
            SYS.KEY_Value = 0;//工作状态下，按键失效

		}

    }
	else
	{
        /*报警或者是松脱以及超时就会退出工作状态*/
        if(SYS.INT_Value || SYS.LB_Value || SYS.Relay_Release || SYS.Long_Time_Change)
        {
			SYS.Standby_Work_State = 0;//进入待机状态       
        }      
	}
    


}

void LB_ST_Task(void)
{
	STNADBY_Control();
    LB_Control();
    LB_STANDBY_Close_Control();
    Work_State_Change();
}
