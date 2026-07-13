#ifndef	_BUZZTT_H_
#define	_BUZZTT_H_

#include "app.h"

/*宏定义*/
#define LONG_Press_Time 300

/*函数声明*/
void BUZZTT_Init(void);
void KEY_Init(void);
void Hummer_Init(void);
void BUZZHH_Control(void);
void Key_Detect(void);
void Hummer_Task(void);
void BUZZTT_Task(void);
void Key_Task(void);


#endif

