#include "REGISTER.h"

/*
1.状态内部决定
2.根据状态控制
3.控制就是单纯控制*/

// 增加状态缓存（避免重复执行）
static Register_State last_state = High_Register;
/*-------------------------------------------------
 *  函数名REGISTER_Init
 *	功能：  RREGISTER初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void REGISTER_Init(void)
{

   REGISTER_PORT &= ~REGISTER_PIN_MASK;   // PA0 = 0

   REGISTER_TRIS |= REGISTER_PIN_MASK;
    
   last_state = High_Register;
}
/*-------------------------------------------------
 *  函数名Regiser_High
 *	功能：  高阻
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void Regiser_High(void)
{
	REGISTER_TRIS |= REGISTER_PIN_MASK;
}
/*-------------------------------------------------
 *  函数名Regiser_Low
 *	功能：  低电平
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	

void Regiser_Low(void)
{
    REGISTER_PORT &= ~REGISTER_PIN_MASK;
	REGISTER_TRIS &= ~REGISTER_PIN_MASK;  
}
/*-------------------------------------------------
 *  函数名REGISTER_Detect
 *	功能：  状态位检测
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void REGISTER_Detect(void)
{
	if(!SYS.Standby_Work_State)//待机状态高阻
    {
		SYS.RES_Change = High_Register;//高阻
    }
    else//工作状态低电平
    {
		SYS.RES_Change = Low_Register;//低电平
    }
}

/*-------------------------------------------------
 *  函数名REGISTER_Control
 *	功能：  根据状态位控制
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void REGISTER_Control(void)
{
	Register_State target = SYS.RES_Change;//确保每次获取最新

    if (target == last_state)
        return;  // 状态未变，跳过

    
    switch(target) {
        case High_Register: Regiser_High(); break;
        case Low_Register:  Regiser_Low();  break;
    }
    
    last_state = target;
}
/*-------------------------------------------------
 *  函数名REGISTER_Task
 *	功能：  执行任务
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void REGISTER_Task(void)
{
//	REGISTER_Detect();
//	SYS.RES_Change = Low_Register;
	SYS.RES_Change = High_Register;
	REGISTER_Control();
}