#include "APP.h"

sys SYS;

/*-------------------------------------------------
 *  函数名ADC_INITIAL
 *	功能：  ADC初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void Initial(void)
{
	DelayMs(20);//上电延迟
	POWER_INITIAL();
    Timer0_Init();
    RC_Init();
    INT_Init();
    SBY_Init();
	Ready_Init();
    REGISTER_Init();
    Hummer_Init();
    
    T0IE = 1;				//开定时器/计数器0中断
    
    GIE = 1;
}