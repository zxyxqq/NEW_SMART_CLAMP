#ifndef	_DELAY_H_
#define	_DELAY_H_

//#define DelayUs(us)  do { unsigned char _dly = (us); while(_dly--) { NOP(); } } while(0)
void DelayUs(unsigned char Time);
    
void DelayMs(unsigned char Time);

void DelayS(unsigned char Time);



#endif 