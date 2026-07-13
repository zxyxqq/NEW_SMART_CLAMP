#ifndef	_TASK_H_
#define	_TASK_H_

#include "stdio.h"
#include "string.h"
#include "stdint.h"
#include "app.h"

#define TASK_RUN		1				//运行
#define TASK_STOP		0				//停止

typedef struct
{
	uint8_t Run;
    uint16_t Timer;
    uint16_t IvtTime;
    void(*TaskHook)(void);
}TaskComps;


typedef enum{
	TASK0, 
	TASK1,
	TASK2,
	TASK3,
	TASK_MAX                			//最大任务数   
}Task_List;


extern TaskComps TaskCompany[TASK_MAX];
//函数声明
void Task_0(void);
void Task_1(void);
void Task_2(void);
void Task_3(void);
void Task_Process(void);



#endif

