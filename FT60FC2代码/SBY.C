#include "SBY.h"


static SBY_State current_output_state = RC_ST_led_Close;

/*-------------------------------------------------
 *  函数名SBY_Init
 *	功能：  SBY初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void SBY_Init(void)
{
	// 1. 先设置输出数据寄存器为低电平（避免切换为输出时电平突变）
    LED_PORT &= ~LED_PIN_MASK;   // PA2 = 0

    // 2. 将引脚设为输入（高阻状态），即关闭 LED
    LED_TRIS |= LED_PIN_MASK;

    // 3. 同步缓存状态
    current_output_state = RC_ST_led_Close;
 }
/*-------------------------------------------------
 *  函数名RC_Open
 *	功能：  打开rc灯
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void RC_Open(void)
{
	// 先输出低电平，再设为输出，避免尖峰
    LED_PORT &= ~LED_PIN_MASK;   // PA2 = 0
    LED_TRIS &= ~LED_PIN_MASK;   // 设为输出
   
 }
/*-------------------------------------------------
 *  函数名RC_STANDBY_Close
 *	功能：  打开standby灯
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void STANDBY_Open(void)
{
    LED_PORT |= LED_PIN_MASK;    // PA2 = 1
    LED_TRIS &= ~LED_PIN_MASK;   // 设为输出
}
/*-------------------------------------------------
 *  函数名RC_STANDBY_Close
 *	功能：  关闭rc和standby灯
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void RC_STANDBY_Close(void)
{
	LED_TRIS |= LED_PIN_MASK;    // 设为输入（高阻）
}
/*-------------------------------------------------
 *  函数名SBY_Detect
 *	功能：  根据对应值设定状态位
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void SBY_Detect(void)
{
	if(SYS.RC_Value)
    {
		SYS.SBY_Value = RC_led_Open;
    }
    else if(SYS.STANDBY_Value)
    {
		SYS.SBY_Value = STANDBY_led_Open;
    }
    else 
    {
		SYS.SBY_Value = RC_ST_led_Close;
    }

}
/*-------------------------------------------------
 *  函数名SBY_Control
 *	功能：  根据对应状态位执行相应操作
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void SBY_Control(void)
{
    SBY_State target = SYS.SBY_Value;

    // 如果状态未改变，直接返回，避免重复操作
    if (target == current_output_state) {
        return;
    }

    // 执行硬件操作，并更新缓存
    switch (target) {
        case RC_ST_led_Close:
            RC_STANDBY_Close();
            break;
        case RC_led_Open:
            RC_Open();
            break;
        case STANDBY_led_Open:
            STANDBY_Open();
            break;
        default:
            // 未知状态，安全处理：关闭
            RC_STANDBY_Close();
            break;
    }

    current_output_state = target;   // 记录当前实际状态
}

/*-------------------------------------------------
 *  函数名SBY_Task
 *	功能：  SBY任务
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void SBY_Task(void)
{
	SBY_Detect();
	SBY_Control();
}