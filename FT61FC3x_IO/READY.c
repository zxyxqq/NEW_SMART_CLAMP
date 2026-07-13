#include "Ready.h"

/*
	注：PB3和PC0打线到一起，因此配置要相同
    且仿真的时候PB3不能设置为输出，会和ISPCLK通讯卡死.
	READY要在STANDBY1正常时才亮。
    按键（在STANDBY1）情况下才有效.

*/

/*-------------------------------------------------
 *  函数名：Ready_Init
 *	功能：  继电器开关引脚初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void Ready_Init(void)
{
	PORTC   = 0B00000000; 	
	TRISC  &= ~0B00000001;	//PC输入输出 0-输出 1-输入 
    
    PORTB   = 0B00000000; 	
	TRISB  &= ~0B00001000;	//PB输入输出 0-输出 1-输入 

    
    WPUC   |= 0B00000001;	//下拉
    
    WPUB   |= 0B00001000;	//下拉

}

/*-------------------------------------------------
 *  函数名：Ready_Control
 *	功能：  控制继电器开关
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void Ready_Control(uint8_t num)
{
    PB3 = (num == Ready_Open) ? 1 : 0;
}


/*-------------------------------------------------
 *  函数名：READY_Task
 *	功能：  
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
 

void READY_Task(void) {
    static TaskState_t state = ST_PRE_ON;
    static uint16_t counter = 0;

    if (!SYS.Standby_Work_State) {
        state = ST_PRE_ON;
        counter = 0;
        Ready_Control(0);
        return;
    }

    counter++;  // 5ms递增

    switch (state) {
        case ST_PRE_ON:
            Ready_Control(1);
            if (counter >= Open_Time) { // 3s到
                counter = 0;
                state = ST_OFF;
            }
            break;

        case ST_OFF:
            Ready_Control(0);
            if (counter >= Close_Time) { // 0.1s到
                counter = 0;
                state = ST_FINAL_ON;
            }
            break;

        case ST_FINAL_ON:
            Ready_Control(1);
            if (counter >= Delay_Time) { // 1s到
                counter = 0;
                state = ST_DETECT;
            }
            break;

        case ST_DETECT:
            // 只执行一次检测，然后跳回最开始（保留你的循环需求）
			SYS.Vbattery_Adc = GET_ADC_DATA(0);
            SYS.Vadc_Value = Get_Vbattery_Stand_State(SYS.Vbattery_Adc);
            state = ST_PRE_ON;      // 回到开头循环
            counter = CYCLIC_START_POINT; // 保持总导通3s
            break;
    }
}
 
 
 
 
 
 
 /*初始逻辑实现
void READY_Task(void)
{
    static uint16_t First_count = 0;
    static uint8_t  Close_count = 0;
    static uint16_t Delay_count = 0;

    // 1. 提前处理待机状态，然后直接返回，避免包裹主干逻辑
    if (!SYS.Standby_Work_State) {
        First_count = 0;
        Close_count = 0;
        Delay_count = 0;
        SYS.READY_Value = 0;
        Ready_Control(0);
        return;  // 关键：直接跳出，后面全是工作态逻辑，减少一层缩进
    }

    // 2. 工作状态下的逻辑
    if (First_count < Open_Time) {
        First_count++;
        Ready_Control(1);
    }
    else if (First_count >= Open_Time && Close_count < Close_Time) {
        Close_count++;
        Ready_Control(0);
    }
    else if (First_count >= Open_Time && Close_count >= Close_Time && Delay_count < Delay_Time) {
        Delay_count++;
        Ready_Control(1);
    }
    else if (First_count >= Open_Time && Close_count >= Close_Time && Delay_count >= Delay_Time) {
        First_count = CYCLIC_START_POINT;
        Close_count = 0;
        Delay_count = 0;
        Get_Cbattery_Data();
        SYS.Cadc_Value = Get_Cbattery_Stand_State(SYS.Cbattery_Adc);
    }
}
*/