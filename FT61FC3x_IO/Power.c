#include "POWER.h"

/*-------------------------------------------------
 *  函数名：POWER_INITIAL
 *	功能：  配置系统时钟，上电端口初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL(void) 
{ 
	OSCCON = 0B01110001;	//IRCF=111=16MHz/2T=8MHz,0.125uS
    OPTION = 0B00000001;	//PSA = 1 TIMER0;PS[2:0]001 = 4
	INTCON = 0;  			//暂禁止所有中断
    
	PORTA  = 0B00000000;	//PA1和PA4打线	
	TRISA  = 0B00010011;	//PA输入输出 0-输出 1-输入
							//PA0-Vadc PA1-INT
                            
	PORTB  = 0B00000000; 	//PB3和PC0打线
	TRISB  = 0B00101001;	//PB输入输出 0-输出 1-输入  
							//PB0-CBAT PB5-LB	
    
	PORTC  = 0B00000000; 	
	TRISC  = 0B00000011;	//PC输入输出 0-输出 1-输入  
							//PC0-READY PC1-BUZZ	    
       
	WPUA   = 0B00000000;    //PA端口上拉控制 1-开上拉 0-关上拉
    WPUB   = 0B00000000;    //PB端口上拉控制 1-开上拉 0-关上拉
	WPUC   = 0B00000010;    //PC端口上拉控制 1-开上拉 0-关上拉
    
	WPDA   = 0B00000000;    //PA端口上拉控制 1-开下拉 0-关下拉
    WPDB   = 0B00000000;    //PB端口上拉控制 1-开下拉 0-关下拉 //READY-PB0
	WPDC   = 0B00000000;    //PC端口上拉控制 1-开下拉 0-关下拉
    
}   
/*-------------------------------------------------
 *  函数名：SYS_Initial
 *	功能：  SYS结构体成员初始化赋值
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void SYS_Initial(void)
{
	SYS.Standby_Work_State = 0;//待机状态
    
	SYS.LB_Value = 0;		//LB报警标志位(待机状态下:输入端电压有问题时)
    
    SYS.INT_Value = 0;		

	SYS.Relay_Release = 0;	//夹子松脱标志位(工作)

	SYS.KEY_Value = 0;		//按键长按导通标志位(待机)

	SYS.Vadc_Value = 0;		//电池端高低压报警标志位

	SYS.Cadc_Value = 0;		//电瓶端低电压报警标志位
    
    SYS.READY_Value = 0;	//继电器开关标志位
    
    SYS.STANDBY_Value = 0;	//STANDBY就绪标志位
    
	SYS.Vbattery_Adc = 0;	//电池端模拟电压

	SYS.Cbattery_Adc = 0;	//电瓶端模拟电压

	SYS.Long_Time_Change = 0;//电瓶长时间连接变更标志位,1：退出工作状态


}

