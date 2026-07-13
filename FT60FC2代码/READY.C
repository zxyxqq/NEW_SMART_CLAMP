#include "READY.h"

static uint8_t current_output = 0;   // 0=关闭, 1=打开

/*-------------------------------------------------
 *  函数名：Ready_Init
 *	功能：  继电器开关引脚初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void Ready_Init(void)
{
	// 先设置输出电平为关闭（避免初始化时误动作）
    READY_PORT &= ~READY_PIN_MASK;   // 输出0
    // 再设为输出方向
    READY_TRIS &= ~READY_PIN_MASK;
    
    // 同步缓存
    current_output = 0;
}

/*-------------------------------------------------
 * 函数名：Ready_Control
 * 功能：  设置继电器状态（带缓存，仅在变化时写入）
 * 输入：  on - 1打开，0关闭
 * 输出：  无
 --------------------------------------------------*/
void Ready_Control(uint8_t on)
{
    if (on == current_output) {
        return;   // 状态未变，避免重复操作
    }
    
    // 更新硬件
    if (on) {
        READY_PORT |= READY_PIN_MASK;   // 置1
    } else {
        READY_PORT &= ~READY_PIN_MASK;  // 清0
    }
    
    current_output = on;   // 更新缓存
}
/*-------------------------------------------------
 *  函数名：READY_Task
 *	功能：  
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
 

void READY_Task(void) 
{
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
            /*方法待定*/
            state = ST_PRE_ON;      // 回到开头循环
            counter = CYCLIC_START_POINT; // 保持总导通3s
            break;
            
             default:
            // 非法状态，复位
            state = ST_PRE_ON;
            counter = 0;
            Ready_Control(0);
            break;
    }
}
 
 