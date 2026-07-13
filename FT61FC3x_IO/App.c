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
    SYS_Initial();
    Timer0_Init();

	ADC_INITIAL();
	Ready_Init();
    Int_Initial();
	BUZZTT_Init();//按键蜂鸣器模块初始化
    
    T0IE = 1;				//开定时器/计数器0中断
    
    GIE = 1;
}