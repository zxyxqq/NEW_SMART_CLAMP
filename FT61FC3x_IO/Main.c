#include "Main.h"

/*
	夹子的工作状态一共有三种
    1.待机状态(不论有无警报)
    2.就绪状态(无警报)
    3.工作状态(无警报)
	
	从待机状态进入工作状态的条件是没有警报
    因此在就绪状态下有两种情况可以进入工作状态
    1.在没有报警的前提下，检测到夹子正常连接(Cbat>1V)
    2.在没有报警的前提下, 检测到按键长按导通(KEY_Value == 1)


*/


/*-------------------------------------------------
 *  函数名：interrupt ISR
 *	功能：  中断处理
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void interrupt ISR(void)
{  
	if(T0IE && T0IF)                  //1ms翻转一次
	{
    	T0IF = 0;
		TMR0 += 6;					  
        

		uint8_t i;
		for(i = 0;i<TASK_MAX;i++)
		{
			if(TaskCompany[i].Timer)
			{
				TaskCompany[i].Timer--;
				if(TaskCompany[i].Timer <= 0)
				{
					TaskCompany[i].Timer = TaskCompany[i].IvtTime;
					TaskCompany[i].Run = TASK_RUN;
				}
			}
		}
	} 
} 
/*-------------------------------------------------
 *  函数名:  main 
 *	功能：  主函数
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void main(void)
{
	Initial();
	while(1)
    {
		Task_Process();
    }
}