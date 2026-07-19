#include "BUZZ.h"


/*-------------------------------------------------
 *  函数名KEY_Init
 *	功能：  KEY初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void KEY_Init(void)
{
	TRISA |= 0B00000100;
	
	WPUA |= 0B00000100;
}

/*-------------------------------------------------
 *  函数名Hummer_Init
 *	功能：  蜂鸣器初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
 void Hummer_Init(void)
 {
	PORTA |=  0B00000100;
	TRISA &= ~0B00000100;
    
    WPUA &= ~0B00000100;
 }
 
 /*-------------------------------------------------
 *  函数名BUZZHH_Control
 *	功能：  1:蜂鸣器；0：按键；
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void BUZZHH_Control(void)
{
	if(SYS.RC_Value||SYS.INT_Value)//蜂鸣器
    {
		Hummer_Task();
    }
//    else if(SYS.STANDBY_Value)//按键(待机状态下且无报警)
//    {
//		Key_Task();
//    }
}

/*-------------------------------------------------
 *  函数名Key_Detect
 *	功能：  按键检测(10ms执行一次),3s长按
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void Key_Detect(void)
{
	static uint8_t press_cnt  = 0;		// 消抖计数
    static uint16_t long_cnt  = 0;		// 长按计时
    static uint8_t  long_trig = 0;      // 新增：长按已触发标志 (0=未触发, 1=已触发)

	if(!PA2)//按键按下
	{
		// 1. 消抖
		if(press_cnt <4)//执行4次,总计20ms
		{
			press_cnt  ++;
		}
		else
		{
			SYS.KEY_Value = 1;//短按按键标志位
		}
        
		 // 2. 长按计时（仅在“未触发”且“未超时”时累加）
        if(SYS.KEY_Value && long_trig == 0 && long_cnt<LONG_Press_Time)
        {
			long_cnt++;
        }
        
        
        // 3. 长按触发（达到3秒 且 尚未触发过）
        if(SYS.KEY_Value && long_cnt >= LONG_Press_Time && long_trig == 0)
        {
			//长按动作（只执行一次）
            SYS.Long_Time_Change = 0;
            SYS.KEY_Value = 0;
            SYS.Key_Press_Value = 1;//长按按键标志位

            long_trig = 1;  // 关键：标志置1，以后不再进入本分支
        }

	}
	else//松开按键
	{
		// 松手时把所有状态复位，以便下次重新长按
        press_cnt = 0;
		SYS.KEY_Value = 0;
        SYS.Key_Press_Value = 0;
        long_cnt = 0;
        long_trig = 0;  // 复位触发标志
	}
}
/*-------------------------------------------------
 *  函数名Key_Task
 *	功能：  按键任务
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void Key_Task(void)
{
	TRISA &= ~0B00000100;
	PA2 = 1;
    
	KEY_Init();
    Key_Detect();
	TRISA &= ~0B00000100;
    PA2 = 1;
}
/*-------------------------------------------------
 *  函数名Hummer_Task
 *	功能：  蜂鸣器任务
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void Hummer_Task(void)
{
	Hummer_Init();
    PA2 = 0;
}
/*-------------------------------------------------
 *  函数名BUZZTT_Task
 *	功能：  按键和蜂鸣器任务
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void BUZZTT_Task(void)
{
	BUZZHH_Control();//先判断是按键还是蜂鸣器有效,进行初始化
}