#include "TIMER.h"


/*----------------------------------------------------
 *	函数名：TIMER0_INITIAL
 *	功能：  初始化设置定时器
 *	设置TMR0定时时长=(1/16000000)*2*32*250=1ms	                      
 ----------------------------------------------------*/
void Timer0_Init(void)
{	  
	OPTION = 0B00000100;	//Bit3=0 Timer0，Bit[2:0]=111=Timer0 RATE 1:128
	T0IF = 0;				//清空Timer0软件中断
    TMR0 = 6;
}
/*----------------------------------------------------
 *	函数名：Timer0_Task
 *	功能：  处理有关时间标志位
 ----------------------------------------------------*/

void Timer0_Task(void)
{
	static uint16_t Long_Ready_Time = 0;
    
	if(SYS.Standby_Work_State == 1)//工作状态下开始计时
    {
        Long_Ready_Time++;//
        
        if(Long_Ready_Time>=4000)//4000*10 = 40000ms = 40s,跳转到待机状态
        {
			Long_Ready_Time = 0;
			SYS.Long_Time_Change = 1;//表示退出工作状态,只有按键导通和松脱才能清零
        }
        
    }
    else
    {
		SYS.Long_Time_Change = 0;//可以进入待机状态的标志位之一
		Long_Ready_Time = 0;
    }

}