//Deviec:FT61FC3X
//-----------------------Variable---------------------------------
		_SYS.Standby_Work_State		EQU		20H
		_SYS.LB_Value		EQU		21H
		_SYS.INT_Value		EQU		22H
		_SYS.Relay_Release		EQU		23H
		_SYS.KEY_Value		EQU		24H
		_SYS.Vadc_Value		EQU		25H
		_SYS.Cadc_Value		EQU		26H
		_SYS.READY_Value		EQU		27H
		_SYS.STANDBY_Value		EQU		28H
		_SYS.Vbattery_Adc		EQU		29H
		_SYS.Cbattery_Adc		EQU		2BH
		_SYS.Long_Time_Change		EQU		2DH
		_SYS		EQU		20H
		_KEY_Press		EQU		79H
		_PA1		EQU		05H
		_PB3		EQU		06H
		_PB5		EQU		06H
		_PC1		EQU		07H
		_T0IF		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_ADON		EQU		113H
		_TaskCompany.Run		EQU		38H
		_TaskCompany.Timer		EQU		39H
		_TaskCompany.IvtTime		EQU		3BH
		_TaskCompany.TaskHook		EQU		3DH
		_TaskCompany		EQU		38H
//		Task_Process@i		EQU		57H
//		___bmul@multiplier		EQU		52H
//		___bmul@product		EQU		51H
//		___bmul@multiplier		EQU		52H
//		___bmul@multiplicand		EQU		50H
//		___bmul@multiplier		EQU		52H
//		Timer0_Task@Long_Ready_Time		EQU		2EH
//		Key_Detect@press_cnt		EQU		36H
//		Key_Detect@long_cnt		EQU		30H
//		Key_Detect@long_trig		EQU		35H
//		READY_Task@state		EQU		37H
//		READY_Task@counter		EQU		32H
//		Ready_Control@num		EQU		50H
//		Ready_Control@num		EQU		50H
//		Ready_Control@num		EQU		50H
//		Get_Vbattery_Stand_State@adc_value		EQU		50H
//		Get_Vbattery_Stand_State@current_state		EQU		34H
//		GET_ADC_DATA@adcChannel		EQU		55H
//		GET_ADC_DATA@ADCON0Buff		EQU		56H
//		GET_ADC_DATA@adcChannel		EQU		55H
//		GET_ADC_DATA@adcChannel		EQU		55H
//		DelayMs@Time		EQU		52H
//		DelayMs@b		EQU		54H
//		DelayMs@a		EQU		53H
//		DelayMs@Time		EQU		52H
//		DelayMs@Time		EQU		52H
//		DelayUs@Time		EQU		50H
//		DelayUs@a		EQU		51H
//		DelayUs@Time		EQU		50H
//		DelayUs@Time		EQU		50H
//		ISR@i		EQU		78H
//		i1___bmul@multiplier		EQU		71H
//		i1___bmul@product		EQU		72H
//		i1___bmul@multiplier		EQU		71H
//		i1___bmul@multiplicand		EQU		70H
//		i1___bmul@multiplier		EQU		71H
//-----------------------Variable END---------------------------------

		BCR 	PCLATH,3 		//0000 	118A
		LJUMP 	0DH 			//0001 	380D
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	75H 			//0006 	01F5
		LDR 	FSR,0 			//0007 	0804
		STR 	76H 			//0008 	01F6
		LDR 	PCLATH,0 		//0009 	080A
		STR 	77H 			//000A 	01F7
		BCR 	PCLATH,3 		//000B 	118A
		LJUMP 	22DH 			//000C 	3A2D
		BCR 	PCLATH,3 		//000D 	118A
		LJUMP 	0FH 			//000E 	380F
		LDWI 	1H 			//000F 	2A01
		CLRR 	38H 			//0010 	0138
		STR 	39H 			//0011 	01B9
		LDWI 	5H 			//0012 	2A05
		CLRR 	3AH 			//0013 	013A
		STR 	3BH 			//0014 	01BB
		LDWI 	3H 			//0015 	2A03
		CLRR 	3CH 			//0016 	013C
		STR 	3DH 			//0017 	01BD
		LDWI 	2H 			//0018 	2A02
		CLRR 	3EH 			//0019 	013E
		STR 	3FH 			//001A 	01BF
		LDWI 	AH 			//001B 	2A0A
		CLRR 	40H 			//001C 	0140
		STR 	41H 			//001D 	01C1
		LDWI 	5H 			//001E 	2A05
		CLRR 	42H 			//001F 	0142
		STR 	43H 			//0020 	01C3
		LDWI 	3H 			//0021 	2A03
		CLRR 	44H 			//0022 	0144
		STR 	45H 			//0023 	01C5
		LDWI 	14H 			//0024 	2A14
		CLRR 	46H 			//0025 	0146
		STR 	47H 			//0026 	01C7
		LDWI 	7H 			//0027 	2A07
		CLRR 	48H 			//0028 	0148
		STR 	49H 			//0029 	01C9
		LDWI 	4H 			//002A 	2A04
		CLRR 	4AH 			//002B 	014A
		STR 	4BH 			//002C 	01CB
		LDWI 	F4H 			//002D 	2AF4
		CLRR 	4CH 			//002E 	014C
		STR 	4DH 			//002F 	01CD
		LDWI 	1H 			//0030 	2A01
		STR 	4EH 			//0031 	01CE
		LDWI 	1H 			//0032 	2A01
		STR 	4FH 			//0033 	01CF
		LDWI 	20H 			//0034 	2A20
		BCR 	STATUS,7 		//0035 	1383
		STR 	FSR 			//0036 	0184
		LDWI 	38H 			//0037 	2A38
		BCR 	PCLATH,3 		//0038 	118A
		LCALL 	341H 			//0039 	3341
		CLRR 	79H 			//003A 	0179
		CLRR 	STATUS 			//003B 	0103
		BCR 	PCLATH,3 		//003C 	118A
		LJUMP 	349H 			//003D 	3B49
		STR 	7FH 			//003E 	01FF
		LDWI 	0H 			//003F 	2A00
		STR 	PCLATH 			//0040 	018A
		LDR 	7FH,0 			//0041 	087F
		ADDWR 	PCL,1 			//0042 	0B82
		LJUMP 	43H 			//0043 	3843
		BCR 	PCLATH,3 		//0044 	118A
		LJUMP 	351H 			//0045 	3B51
		BCR 	PCLATH,3 		//0046 	118A
		LJUMP 	88H 			//0047 	3888
		BCR 	PCLATH,3 		//0048 	118A
		LJUMP 	2A6H 			//0049 	3AA6
		BCR 	PCLATH,3 		//004A 	118A
		LJUMP 	350H 			//004B 	3B50

		//;App.c: 13: DelayMs(20);
		LDWI 	14H 			//004C 	2A14
		LCALL 	5FH 			//004D 	305F
		BCR 	PCLATH,3 		//004E 	118A

		//;App.c: 14: POWER_INITIAL();
		LCALL 	18BH 			//004F 	318B
		BCR 	PCLATH,3 		//0050 	118A

		//;App.c: 15: SYS_Initial();
		LCALL 	1BCH 			//0051 	31BC
		BCR 	PCLATH,3 		//0052 	118A

		//;App.c: 16: Timer0_Init();
		LCALL 	1CCH 			//0053 	31CC
		BCR 	PCLATH,3 		//0054 	118A

		//;App.c: 18: ADC_INITIAL();
		LCALL 	71H 			//0055 	3071
		BCR 	PCLATH,3 		//0056 	118A

		//;App.c: 19: Ready_Init();
		LCALL 	1B0H 			//0057 	31B0
		BCR 	PCLATH,3 		//0058 	118A

		//;App.c: 20: Int_Initial();
		LCALL 	186H 			//0059 	3186
		BCR 	PCLATH,3 		//005A 	118A

		//;App.c: 21: BUZZTT_Init();
		LCALL 	1D4H 			//005B 	31D4

		//;App.c: 23: T0IE = 1;
		BSR 	INTCON,5 		//005C 	1A8B

		//;App.c: 25: GIE = 1;
		BSR 	INTCON,7 		//005D 	1B8B
		RET		 					//005E 	0004
		BCR 	STATUS,6 		//005F 	1303
		STR 	52H 			//0060 	01D2

		//;Delay.c: 24: unsigned char a,b;
		//;Delay.c: 25: for(a=0;a<Time;a++)
		CLRR 	53H 			//0061 	0153
		LDR 	52H,0 			//0062 	0852
		SUBWR 	53H,0 			//0063 	0C53
		BTSC 	STATUS,0 		//0064 	1403
		RET		 					//0065 	0004

		//;Delay.c: 26: {
		//;Delay.c: 27: for(b=0;b<5;b++)
		CLRR 	54H 			//0066 	0154

		//;Delay.c: 28: {
		//;Delay.c: 29: DelayUs(197);
		LDWI 	C5H 			//0067 	2AC5
		LCALL 	179H 			//0068 	3179
		BCR 	PCLATH,3 		//0069 	118A
		LDWI 	5H 			//006A 	2A05
		INCR	54H,1 			//006B 	09D4
		SUBWR 	54H,0 			//006C 	0C54
		BTSS 	STATUS,0 		//006D 	1C03
		LJUMP 	67H 			//006E 	3867
		INCR	53H,1 			//006F 	09D3
		LJUMP 	62H 			//0070 	3862

		//;ADC.c: 55: TRISA |= 0B00000001;
		BSR 	STATUS,5 		//0071 	1A83
		BSR 	5H,0 			//0072 	1805

		//;ADC.c: 57: TRISB |= 0B00000001;
		BSR 	6H,0 			//0073 	1806

		//;ADC.c: 59: ANSEL0 = 0B01000001;
		LDWI 	41H 			//0074 	2A41
		BCR 	STATUS,5 		//0075 	1283
		BSR 	STATUS,6 		//0076 	1B03
		STR 	1EH 			//0077 	019E

		//;ADC.c: 61: ADCON1 = 0B11100101;
		LDWI 	E5H 			//0078 	2AE5
		STR 	14H 			//0079 	0194

		//;ADC.c: 63: ADCON0 = 0B00000000;
		CLRR 	13H 			//007A 	0113

		//;ADC.c: 65: DelayUs(450);
		LDWI 	C2H 			//007B 	2AC2
		LCALL 	179H 			//007C 	3179
		BCR 	PCLATH,3 		//007D 	118A

		//;ADC.c: 67: ADCON2 = 0B11000000;
		LDWI 	C0H 			//007E 	2AC0
		BSR 	STATUS,6 		//007F 	1B03
		STR 	15H 			//0080 	0195

		//;ADC.c: 69: ADCON3 = 0B00000000;
		BSR 	STATUS,5 		//0081 	1A83
		CLRR 	6H 			//0082 	0106

		//;ADC.c: 73: ADCMPH = 0B00000000;
		CLRR 	7H 			//0083 	0107

		//;ADC.c: 75: ADON=1;
		BCR 	STATUS,5 		//0084 	1283
		BSR 	13H,0 			//0085 	1813

		//;ADC.c: 77: DelayMs(1);
		LDWI 	1H 			//0086 	2A01
		LJUMP 	5FH 			//0087 	385F

		//;Task.c: 20: ADC_Task();
		LCALL 	8FH 			//0088 	308F
		BCR 	PCLATH,3 		//0089 	118A

		//;Task.c: 21: Int_Task();
		LCALL 	185H 			//008A 	3185
		BCR 	PCLATH,3 		//008B 	118A

		//;Task.c: 22: READY_Task();
		LCALL 	F3H 			//008C 	30F3
		BCR 	PCLATH,3 		//008D 	118A

		//;Task.c: 23: LB_ST_Task();
		LJUMP 	1E3H 			//008E 	39E3

		//;ADC.c: 237: Get_Cbattery_Data();
		LCALL 	A7H 			//008F 	30A7
		BCR 	PCLATH,3 		//0090 	118A

		//;ADC.c: 240: Relay_Release_Detect();
		LCALL 	E8H 			//0091 	30E8
		BCR 	PCLATH,3 		//0092 	118A

		//;ADC.c: 243: if(SYS.Standby_Work_State == 0)
		LDR 	20H,0 			//0093 	0820
		BTSS 	STATUS,2 		//0094 	1D03
		RET		 					//0095 	0004

		//;ADC.c: 244: {
		//;ADC.c: 245: Get_Vbattery_Data();
		LCALL 	AEH 			//0096 	30AE
		BCR 	PCLATH,3 		//0097 	118A

		//;ADC.c: 246: SYS.Vadc_Value = Get_Vbattery_Stand_State(SYS.Vbattery_Adc);
		LDR 	2AH,0 			//0098 	082A
		STR 	51H 			//0099 	01D1
		LDR 	29H,0 			//009A 	0829
		STR 	50H 			//009B 	01D0
		LCALL 	B5H 			//009C 	30B5
		BCR 	PCLATH,3 		//009D 	118A
		STR 	25H 			//009E 	01A5

		//;ADC.c: 248: if(SYS.Vadc_Value == 0)
		LDR 	25H,0 			//009F 	0825
		BTSS 	STATUS,2 		//00A0 	1D03
		LJUMP 	A4H 			//00A1 	38A4

		//;ADC.c: 249: {
		//;ADC.c: 250: SYS.LB_Value = 0;
		CLRR 	21H 			//00A2 	0121

		//;ADC.c: 251: }
		RET		 					//00A3 	0004

		//;ADC.c: 252: else
		//;ADC.c: 253: {
		//;ADC.c: 254: SYS.LB_Value = 1;
		CLRR 	21H 			//00A4 	0121
		INCR	21H,1 			//00A5 	09A1
		RET		 					//00A6 	0004

		//;ADC.c: 127: SYS.Cbattery_Adc = GET_ADC_DATA(6);
		LDWI 	6H 			//00A7 	2A06
		LCALL 	153H 			//00A8 	3153
		LDR 	53H,0 			//00A9 	0853
		STR 	2CH 			//00AA 	01AC
		LDR 	52H,0 			//00AB 	0852
		STR 	2BH 			//00AC 	01AB
		RET		 					//00AD 	0004

		//;ADC.c: 117: SYS.Vbattery_Adc = GET_ADC_DATA(0);
		LDWI 	0H 			//00AE 	2A00
		LCALL 	153H 			//00AF 	3153
		LDR 	53H,0 			//00B0 	0853
		STR 	2AH 			//00B1 	01AA
		LDR 	52H,0 			//00B2 	0852
		STR 	29H 			//00B3 	01A9
		RET		 					//00B4 	0004

		//;ADC.c: 139: static Battery_State current_state = STATE_NORMAL;
		//;ADC.c: 141: switch(current_state)
		LJUMP 	DBH 			//00B5 	38DB

		//;ADC.c: 144: if(adc_value<3030)
		LDWI 	BH 			//00B6 	2A0B
		SUBWR 	51H,0 			//00B7 	0C51
		LDWI 	D6H 			//00B8 	2AD6
		BTSC 	STATUS,2 		//00B9 	1503
		SUBWR 	50H,0 			//00BA 	0C50
		BTSC 	STATUS,0 		//00BB 	1403
		LJUMP 	C0H 			//00BC 	38C0

		//;ADC.c: 145: {
		//;ADC.c: 146: current_state = STATE_UNDER_VOLTAGE;
		CLRR 	34H 			//00BD 	0134
		INCR	34H,1 			//00BE 	09B4

		//;ADC.c: 147: }
		LJUMP 	E6H 			//00BF 	38E6

		//;ADC.c: 148: else if(adc_value>3633)
		LDWI 	EH 			//00C0 	2A0E
		SUBWR 	51H,0 			//00C1 	0C51
		LDWI 	32H 			//00C2 	2A32
		BTSC 	STATUS,2 		//00C3 	1503
		SUBWR 	50H,0 			//00C4 	0C50
		BTSS 	STATUS,0 		//00C5 	1C03
		LJUMP 	E6H 			//00C6 	38E6

		//;ADC.c: 149: {
		//;ADC.c: 150: current_state = STATE_OVER_VOLTAGE;
		LDWI 	2H 			//00C7 	2A02
		STR 	34H 			//00C8 	01B4
		LJUMP 	E6H 			//00C9 	38E6

		//;ADC.c: 156: if (adc_value >= 3090)
		LDWI 	CH 			//00CA 	2A0C
		SUBWR 	51H,0 			//00CB 	0C51
		LDWI 	12H 			//00CC 	2A12
		BTSC 	STATUS,2 		//00CD 	1503
		SUBWR 	50H,0 			//00CE 	0C50
		BTSS 	STATUS,0 		//00CF 	1C03
		LJUMP 	E6H 			//00D0 	38E6

		//;ADC.c: 157: {
		//;ADC.c: 158: current_state = STATE_NORMAL;
		CLRR 	34H 			//00D1 	0134
		LJUMP 	E6H 			//00D2 	38E6

		//;ADC.c: 165: if (adc_value <= 3693)
		LDWI 	EH 			//00D3 	2A0E
		SUBWR 	51H,0 			//00D4 	0C51
		LDWI 	6EH 			//00D5 	2A6E
		BTSC 	STATUS,2 		//00D6 	1503
		SUBWR 	50H,0 			//00D7 	0C50
		BTSS 	STATUS,0 		//00D8 	1C03
		LJUMP 	D1H 			//00D9 	38D1
		LJUMP 	E6H 			//00DA 	38E6
		LDR 	34H,0 			//00DB 	0834
		XORWI 	0H 			//00DC 	2600
		BTSC 	STATUS,2 		//00DD 	1503
		LJUMP 	B6H 			//00DE 	38B6
		XORWI 	1H 			//00DF 	2601
		BTSC 	STATUS,2 		//00E0 	1503
		LJUMP 	CAH 			//00E1 	38CA
		XORWI 	3H 			//00E2 	2603
		BTSC 	STATUS,2 		//00E3 	1503
		LJUMP 	D3H 			//00E4 	38D3
		LJUMP 	E6H 			//00E5 	38E6

		//;ADC.c: 172: return current_state;
		LDR 	34H,0 			//00E6 	0834
		RET		 					//00E7 	0004

		//;ADC.c: 215: if(SYS.Cbattery_Adc<836)
		LDWI 	3H 			//00E8 	2A03
		SUBWR 	2CH,0 			//00E9 	0C2C
		LDWI 	44H 			//00EA 	2A44
		BTSC 	STATUS,2 		//00EB 	1503
		SUBWR 	2BH,0 			//00EC 	0C2B

		//;ADC.c: 216: {
		//;ADC.c: 217: SYS.Relay_Release = 1;
		CLRR 	23H 			//00ED 	0123
		BTSC 	STATUS,0 		//00EE 	1403
		RET		 					//00EF 	0004
		INCR	23H,1 			//00F0 	09A3

		//;ADC.c: 218: SYS.Long_Time_Change = 0;
		CLRR 	2DH 			//00F1 	012D

		//;ADC.c: 219: }
		RET		 					//00F2 	0004

		//;ADC.c: 220: else
		//;ADC.c: 221: {
		//;ADC.c: 222: SYS.Relay_Release = 0;
		LDR 	20H,0 			//00F3 	0820
		BTSS 	STATUS,2 		//00F4 	1D03
		LJUMP 	FBH 			//00F5 	38FB
		LDWI 	0H 			//00F6 	2A00

		//;READY.c: 57: state = ST_PRE_ON;
		CLRR 	37H 			//00F7 	0137

		//;READY.c: 58: counter = 0;
		CLRR 	32H 			//00F8 	0132
		CLRR 	33H 			//00F9 	0133

		//;READY.c: 59: Ready_Control(0);
		LJUMP 	148H 			//00FA 	3948

		//;READY.c: 61: }
		//;READY.c: 63: counter++;
		INCR	32H,1 			//00FB 	09B2
		BTSC 	STATUS,2 		//00FC 	1503
		INCR	33H,1 			//00FD 	09B3

		//;READY.c: 65: switch (state) {
		LJUMP 	139H 			//00FE 	3939

		//;READY.c: 67: Ready_Control(1);
		LDWI 	1H 			//00FF 	2A01
		LCALL 	148H 			//0100 	3148
		BCR 	PCLATH,3 		//0101 	118A

		//;READY.c: 68: if (counter >= 600) {
		LDWI 	2H 			//0102 	2A02
		SUBWR 	33H,0 			//0103 	0C33
		LDWI 	58H 			//0104 	2A58
		BTSC 	STATUS,2 		//0105 	1503
		SUBWR 	32H,0 			//0106 	0C32
		BTSS 	STATUS,0 		//0107 	1C03
		RET		 					//0108 	0004

		//;READY.c: 69: counter = 0;
		CLRR 	32H 			//0109 	0132
		CLRR 	33H 			//010A 	0133

		//;READY.c: 70: state = ST_OFF;
		CLRR 	37H 			//010B 	0137
		INCR	37H,1 			//010C 	09B7
		RET		 					//010D 	0004

		//;READY.c: 75: Ready_Control(0);
		LDWI 	0H 			//010E 	2A00
		LCALL 	148H 			//010F 	3148
		BCR 	PCLATH,3 		//0110 	118A

		//;READY.c: 76: if (counter >= 20) {
		LDWI 	0H 			//0111 	2A00
		SUBWR 	33H,0 			//0112 	0C33
		LDWI 	14H 			//0113 	2A14
		BTSC 	STATUS,2 		//0114 	1503
		SUBWR 	32H,0 			//0115 	0C32
		BTSS 	STATUS,0 		//0116 	1C03
		RET		 					//0117 	0004
		LDWI 	2H 			//0118 	2A02

		//;READY.c: 77: counter = 0;
		//;READY.c: 78: state = ST_FINAL_ON;
		LJUMP 	229H 			//0119 	3A29

		//;READY.c: 83: Ready_Control(1);
		LDWI 	1H 			//011A 	2A01
		LCALL 	148H 			//011B 	3148
		BCR 	PCLATH,3 		//011C 	118A

		//;READY.c: 84: if (counter >= 200) {
		LDWI 	0H 			//011D 	2A00
		SUBWR 	33H,0 			//011E 	0C33
		LDWI 	C8H 			//011F 	2AC8
		BTSC 	STATUS,2 		//0120 	1503
		SUBWR 	32H,0 			//0121 	0C32
		BTSS 	STATUS,0 		//0122 	1C03
		RET		 					//0123 	0004
		LDWI 	3H 			//0124 	2A03

		//;READY.c: 85: counter = 0;
		//;READY.c: 86: state = ST_DETECT;
		LJUMP 	229H 			//0125 	3A29

		//;READY.c: 92: SYS.Vbattery_Adc = GET_ADC_DATA(0);
		LDWI 	0H 			//0126 	2A00
		LCALL 	153H 			//0127 	3153
		BCR 	PCLATH,3 		//0128 	118A
		LDR 	53H,0 			//0129 	0853
		STR 	2AH 			//012A 	01AA
		LDR 	52H,0 			//012B 	0852
		STR 	29H 			//012C 	01A9

		//;READY.c: 93: SYS.Vadc_Value = Get_Vbattery_Stand_State(SYS.Vbattery_Adc);
		LDR 	2AH,0 			//012D 	082A
		STR 	51H 			//012E 	01D1
		LDR 	29H,0 			//012F 	0829
		STR 	50H 			//0130 	01D0
		LCALL 	B5H 			//0131 	30B5
		STR 	25H 			//0132 	01A5
		LDWI 	90H 			//0133 	2A90

		//;READY.c: 94: state = ST_PRE_ON;
		CLRR 	37H 			//0134 	0137

		//;READY.c: 95: counter = 400;
		STR 	32H 			//0135 	01B2
		LDWI 	1H 			//0136 	2A01
		STR 	33H 			//0137 	01B3

		//;READY.c: 96: break;
		RET		 					//0138 	0004
		LDR 	37H,0 			//0139 	0837
		XORWI 	0H 			//013A 	2600
		BTSC 	STATUS,2 		//013B 	1503
		LJUMP 	FFH 			//013C 	38FF
		XORWI 	1H 			//013D 	2601
		BTSC 	STATUS,2 		//013E 	1503
		LJUMP 	10EH 			//013F 	390E
		XORWI 	3H 			//0140 	2603
		BTSC 	STATUS,2 		//0141 	1503
		LJUMP 	11AH 			//0142 	391A
		XORWI 	1H 			//0143 	2601
		BTSC 	STATUS,2 		//0144 	1503
		LJUMP 	126H 			//0145 	3926
		LJUMP 	147H 			//0146 	3947
		RET		 					//0147 	0004
		STR 	50H 			//0148 	01D0

		//;READY.c: 40: PB3 = (num == 1) ? 1 : 0;
		DECRSZ 	50H,0 		//0149 	0E50
		LJUMP 	14FH 			//014A 	394F
		BCR 	STATUS,5 		//014B 	1283
		BCR 	STATUS,6 		//014C 	1303
		BSR 	6H,3 			//014D 	1986
		RET		 					//014E 	0004
		BCR 	STATUS,5 		//014F 	1283
		BCR 	STATUS,6 		//0150 	1303
		BCR 	6H,3 			//0151 	1186
		RET		 					//0152 	0004
		STR 	55H 			//0153 	01D5

		//;ADC.c: 88: unsigned char ADCON0Buff;
		//;ADC.c: 89: ADCON0Buff = ADCON0&0B00000111;
		BSR 	STATUS,6 		//0154 	1B03
		LDR 	13H,0 			//0155 	0813
		BCR 	STATUS,6 		//0156 	1303
		STR 	56H 			//0157 	01D6
		LDWI 	7H 			//0158 	2A07
		ANDWR 	56H,1 			//0159 	02D6

		//;ADC.c: 90: adcChannel<<=3;
		RLR 	55H,1 			//015A 	05D5
		RLR 	55H,1 			//015B 	05D5
		RLR 	55H,0 			//015C 	0555
		ANDWI 	F8H 			//015D 	24F8
		STR 	55H 			//015E 	01D5

		//;ADC.c: 91: ADCON0Buff |= adcChannel;
		IORWR 	56H,1 			//015F 	03D6

		//;ADC.c: 92: ADCON0 = ADCON0Buff;
		LDR 	56H,0 			//0160 	0856
		BSR 	STATUS,6 		//0161 	1B03
		STR 	13H 			//0162 	0193

		//;ADC.c: 93: DelayUs(10);
		LDWI 	AH 			//0163 	2A0A
		LCALL 	179H 			//0164 	3179
		BCR 	PCLATH,3 		//0165 	118A

		//;ADC.c: 98: ADCON0 = ADCON0|0x02;
		BSR 	STATUS,6 		//0166 	1B03
		LDR 	13H,0 			//0167 	0813
		IORWI 	2H 			//0168 	2502
		STR 	13H 			//0169 	0193

		//;ADC.c: 100: __nop();
		NOP		 					//016A 	0000

		//;ADC.c: 101: __nop();
		NOP		 					//016B 	0000

		//;ADC.c: 102: while(ADCON0&0x02);
		BCR 	STATUS,5 		//016C 	1283
		BSR 	STATUS,6 		//016D 	1B03
		BTSC 	13H,1 			//016E 	1493
		LJUMP 	16CH 			//016F 	396C

		//;ADC.c: 106: return(unsigned int)(ADRESH<<8|ADRESL);
		LDR 	12H,0 			//0170 	0812
		BCR 	STATUS,6 		//0171 	1303
		STR 	53H 			//0172 	01D3
		CLRR 	52H 			//0173 	0152
		BSR 	STATUS,6 		//0174 	1B03
		LDR 	11H,0 			//0175 	0811
		BCR 	STATUS,6 		//0176 	1303
		IORWR 	52H,1 			//0177 	03D2
		RET		 					//0178 	0004
		BCR 	STATUS,6 		//0179 	1303
		STR 	50H 			//017A 	01D0

		//;Delay.c: 10: unsigned char a;
		//;Delay.c: 11: for(a=0;a<Time;a++)
		CLRR 	51H 			//017B 	0151
		LDR 	50H,0 			//017C 	0850
		SUBWR 	51H,0 			//017D 	0C51
		BTSC 	STATUS,0 		//017E 	1403
		RET		 					//017F 	0004

		//;Delay.c: 12: {
		//;Delay.c: 13: __nop();
		NOP		 					//0180 	0000
		BCR 	STATUS,5 		//0181 	1283
		BCR 	STATUS,6 		//0182 	1303
		INCR	51H,1 			//0183 	09D1
		LJUMP 	17CH 			//0184 	397C

		//;INT.c: 43: Read_Int();
		LJUMP 	1DBH 			//0185 	39DB

		//;INT.c: 18: TRISA |= 0B00010010;
		LDWI 	12H 			//0186 	2A12
		BSR 	STATUS,5 		//0187 	1A83
		BCR 	STATUS,6 		//0188 	1303
		IORWR 	5H,1 			//0189 	0385
		RET		 					//018A 	0004

		//;Power.c: 11: OSCCON = 0B01110001;
		LDWI 	71H 			//018B 	2A71
		BSR 	STATUS,5 		//018C 	1A83
		STR 	FH 			//018D 	018F

		//;Power.c: 12: OPTION = 0B00000001;
		LDWI 	1H 			//018E 	2A01
		STR 	1H 			//018F 	0181

		//;Power.c: 13: INTCON = 0;
		CLRR 	INTCON 			//0190 	010B

		//;Power.c: 15: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0191 	1283
		CLRR 	5H 			//0192 	0105

		//;Power.c: 16: TRISA = 0B00010011;
		LDWI 	13H 			//0193 	2A13
		BSR 	STATUS,5 		//0194 	1A83
		STR 	5H 			//0195 	0185

		//;Power.c: 19: PORTB = 0B00000000;
		BCR 	STATUS,5 		//0196 	1283
		CLRR 	6H 			//0197 	0106

		//;Power.c: 20: TRISB = 0B00101001;
		LDWI 	29H 			//0198 	2A29
		BSR 	STATUS,5 		//0199 	1A83
		STR 	6H 			//019A 	0186

		//;Power.c: 23: PORTC = 0B00000000;
		BCR 	STATUS,5 		//019B 	1283
		CLRR 	7H 			//019C 	0107

		//;Power.c: 24: TRISC = 0B00000011;
		LDWI 	3H 			//019D 	2A03
		BSR 	STATUS,5 		//019E 	1A83
		STR 	7H 			//019F 	0187

		//;Power.c: 27: WPUA = 0B00000000;
		CLRR 	15H 			//01A0 	0115

		//;Power.c: 28: WPUB = 0B00000000;
		BCR 	STATUS,5 		//01A1 	1283
		BSR 	STATUS,6 		//01A2 	1B03
		CLRR 	DH 			//01A3 	010D

		//;Power.c: 29: WPUC = 0B00000010;
		LDWI 	2H 			//01A4 	2A02
		BSR 	STATUS,5 		//01A5 	1A83
		BCR 	STATUS,6 		//01A6 	1303
		STR 	13H 			//01A7 	0193

		//;Power.c: 31: WPDA = 0B00000000;
		CLRR 	9H 			//01A8 	0109

		//;Power.c: 32: WPDB = 0B00000000;
		BCR 	STATUS,5 		//01A9 	1283
		BSR 	STATUS,6 		//01AA 	1B03
		CLRR 	EH 			//01AB 	010E

		//;Power.c: 33: WPDC = 0B00000000;
		BSR 	STATUS,5 		//01AC 	1A83
		BCR 	STATUS,6 		//01AD 	1303
		CLRR 	DH 			//01AE 	010D
		RET		 					//01AF 	0004

		//;READY.c: 19: PORTC = 0B00000000;
		CLRR 	7H 			//01B0 	0107

		//;READY.c: 20: TRISC &= ~0B00000001;
		BSR 	STATUS,5 		//01B1 	1A83
		BCR 	7H,0 			//01B2 	1007

		//;READY.c: 22: PORTB = 0B00000000;
		BCR 	STATUS,5 		//01B3 	1283
		CLRR 	6H 			//01B4 	0106

		//;READY.c: 23: TRISB &= ~0B00001000;
		BSR 	STATUS,5 		//01B5 	1A83
		BCR 	6H,3 			//01B6 	1186

		//;READY.c: 26: WPUC |= 0B00000001;
		BSR 	13H,0 			//01B7 	1813

		//;READY.c: 28: WPUB |= 0B00001000;
		BCR 	STATUS,5 		//01B8 	1283
		BSR 	STATUS,6 		//01B9 	1B03
		BSR 	DH,3 			//01BA 	198D
		RET		 					//01BB 	0004

		//;Power.c: 44: SYS.Standby_Work_State = 0;
		BCR 	STATUS,5 		//01BC 	1283
		CLRR 	20H 			//01BD 	0120

		//;Power.c: 46: SYS.LB_Value = 0;
		CLRR 	21H 			//01BE 	0121

		//;Power.c: 48: SYS.INT_Value = 0;
		CLRR 	22H 			//01BF 	0122

		//;Power.c: 50: SYS.Relay_Release = 0;
		CLRR 	23H 			//01C0 	0123

		//;Power.c: 52: SYS.KEY_Value = 0;
		CLRR 	24H 			//01C1 	0124

		//;Power.c: 54: SYS.Vadc_Value = 0;
		CLRR 	25H 			//01C2 	0125

		//;Power.c: 56: SYS.Cadc_Value = 0;
		CLRR 	26H 			//01C3 	0126

		//;Power.c: 58: SYS.READY_Value = 0;
		CLRR 	27H 			//01C4 	0127

		//;Power.c: 60: SYS.STANDBY_Value = 0;
		CLRR 	28H 			//01C5 	0128

		//;Power.c: 62: SYS.Vbattery_Adc = 0;
		CLRR 	29H 			//01C6 	0129
		CLRR 	2AH 			//01C7 	012A

		//;Power.c: 64: SYS.Cbattery_Adc = 0;
		CLRR 	2BH 			//01C8 	012B
		CLRR 	2CH 			//01C9 	012C

		//;Power.c: 66: SYS.Long_Time_Change = 0;
		CLRR 	2DH 			//01CA 	012D
		RET		 					//01CB 	0004

		//;Timer.c: 11: OPTION = 0B00000100;
		LDWI 	4H 			//01CC 	2A04
		BSR 	STATUS,5 		//01CD 	1A83
		STR 	1H 			//01CE 	0181

		//;Timer.c: 12: T0IF = 0;
		BCR 	INTCON,2 		//01CF 	110B

		//;Timer.c: 13: TMR0 = 6;
		LDWI 	6H 			//01D0 	2A06
		BCR 	STATUS,5 		//01D1 	1283
		STR 	1H 			//01D2 	0181
		RET		 					//01D3 	0004

		//;BUZZTT.c: 23: PORTC = 0B00000000;
		BCR 	STATUS,5 		//01D4 	1283
		CLRR 	7H 			//01D5 	0107

		//;BUZZTT.c: 24: TRISC &= ~0B00000010;
		BSR 	STATUS,5 		//01D6 	1A83
		BCR 	7H,1 			//01D7 	1087

		//;BUZZTT.c: 26: PC1 = 1;
		BCR 	STATUS,5 		//01D8 	1283
		BSR 	7H,1 			//01D9 	1887
		RET		 					//01DA 	0004

		//;INT.c: 33: SYS.INT_Value = (PA1 == 1) ? 0 : 1;
		BCR 	STATUS,0 		//01DB 	1003
		BTSS 	5H,1 			//01DC 	1C85
		BSR 	STATUS,0 		//01DD 	1803
		LDWI 	0H 			//01DE 	2A00
		BTSC 	STATUS,0 		//01DF 	1403
		LDWI 	1H 			//01E0 	2A01
		STR 	22H 			//01E1 	01A2
		RET		 					//01E2 	0004

		//;LB.C: 113: STNADBY_Control();
		LCALL 	1F2H 			//01E3 	31F2
		BCR 	PCLATH,3 		//01E4 	118A

		//;LB.C: 114: LB_Control();
		LCALL 	1EAH 			//01E5 	31EA
		BCR 	PCLATH,3 		//01E6 	118A

		//;LB.C: 115: LB_STANDBY_Close_Control();
		LCALL 	1FAH 			//01E7 	31FA
		BCR 	PCLATH,3 		//01E8 	118A

		//;LB.C: 116: Work_State_Change();
		LJUMP 	200H 			//01E9 	3A00

		//;LB.C: 43: if(SYS.LB_Value)
		LDR 	21H,0 			//01EA 	0821
		BTSC 	STATUS,2 		//01EB 	1503
		RET		 					//01EC 	0004

		//;LB.C: 44: {
		//;LB.C: 45: TRISB &= ~0B00100000;
		BSR 	STATUS,5 		//01ED 	1A83
		BCR 	6H,5 			//01EE 	1286

		//;LB.C: 46: PB5 = 0;
		BCR 	STATUS,5 		//01EF 	1283
		BCR 	6H,5 			//01F0 	1286
		RET		 					//01F1 	0004

		//;LB.C: 29: if(SYS.STANDBY_Value)
		LDR 	28H,0 			//01F2 	0828
		BTSC 	STATUS,2 		//01F3 	1503
		RET		 					//01F4 	0004

		//;LB.C: 30: {
		//;LB.C: 31: TRISB &= ~0B00100000;
		BSR 	STATUS,5 		//01F5 	1A83
		BCR 	6H,5 			//01F6 	1286

		//;LB.C: 32: PB5 = 1;
		BCR 	STATUS,5 		//01F7 	1283
		BSR 	6H,5 			//01F8 	1A86
		RET		 					//01F9 	0004

		//;LB.C: 57: if(SYS.Standby_Work_State)
		LDR 	20H,0 			//01FA 	0820
		BTSC 	STATUS,2 		//01FB 	1503
		RET		 					//01FC 	0004

		//;LB.C: 58: {
		//;LB.C: 59: TRISB |= 0B00100000;
		BSR 	STATUS,5 		//01FD 	1A83
		BSR 	6H,5 			//01FE 	1A86
		RET		 					//01FF 	0004

		//;LB.C: 81: if(!SYS.Standby_Work_State)
		BCR 	STATUS,5 		//0200 	1283
		LDR 	20H,0 			//0201 	0820
		BTSS 	STATUS,2 		//0202 	1D03
		LJUMP 	21CH 			//0203 	3A1C

		//;LB.C: 82: {
		//;LB.C: 83: if(!SYS.INT_Value && !SYS.LB_Value)
		LDR 	22H,0 			//0204 	0822
		BTSS 	STATUS,2 		//0205 	1D03
		LJUMP 	20CH 			//0206 	3A0C
		LDR 	21H,0 			//0207 	0821
		BTSS 	STATUS,2 		//0208 	1D03
		LJUMP 	20CH 			//0209 	3A0C

		//;LB.C: 84: {
		//;LB.C: 85: SYS.STANDBY_Value = 1;
		CLRR 	28H 			//020A 	0128
		INCR	28H,1 			//020B 	09A8

		//;LB.C: 86: }
		//;LB.C: 88: if(SYS.STANDBY_Value && (!SYS.Relay_Release || SYS.KEY_Value))
		LDR 	28H,0 			//020C 	0828
		BTSC 	STATUS,2 		//020D 	1503
		RET		 					//020E 	0004
		LDR 	23H,0 			//020F 	0823
		BTSC 	STATUS,2 		//0210 	1503
		LJUMP 	215H 			//0211 	3A15
		LDR 	24H,0 			//0212 	0824
		BTSC 	STATUS,2 		//0213 	1503
		RET		 					//0214 	0004

		//;LB.C: 89: {
		//;LB.C: 90: SYS.Standby_Work_State = 1;
		CLRR 	20H 			//0215 	0120
		INCR	20H,1 			//0216 	09A0

		//;LB.C: 91: SYS.READY_Value = 1;
		CLRR 	27H 			//0217 	0127
		INCR	27H,1 			//0218 	09A7

		//;LB.C: 92: SYS.STANDBY_Value = 0;
		CLRR 	28H 			//0219 	0128

		//;LB.C: 93: SYS.KEY_Value = 0;
		CLRR 	24H 			//021A 	0124
		RET		 					//021B 	0004

		//;LB.C: 98: else
		//;LB.C: 99: {
		//;LB.C: 101: if(SYS.INT_Value || SYS.LB_Value || SYS.Relay_Release || SYS.Long_Time_Chang
		//+                          e)
		LDR 	22H,0 			//021C 	0822
		BTSS 	STATUS,2 		//021D 	1D03
		LJUMP 	227H 			//021E 	3A27
		LDR 	21H,0 			//021F 	0821
		BTSS 	STATUS,2 		//0220 	1D03
		LJUMP 	227H 			//0221 	3A27
		LDR 	23H,0 			//0222 	0823
		BTSC 	STATUS,2 		//0223 	1503
		LDR 	2DH,0 			//0224 	082D
		BTSC 	STATUS,2 		//0225 	1503
		RET		 					//0226 	0004

		//;LB.C: 102: {
		//;LB.C: 103: SYS.Standby_Work_State = 0;
		CLRR 	20H 			//0227 	0120
		RET		 					//0228 	0004
		CLRR 	32H 			//0229 	0132
		CLRR 	33H 			//022A 	0133
		STR 	37H 			//022B 	01B7
		RET		 					//022C 	0004

		//;Main.c: 26: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//022D 	168B
		BTSS 	INTCON,2 		//022E 	1D0B
		LJUMP 	28FH 			//022F 	3A8F

		//;Main.c: 27: {
		//;Main.c: 28: T0IF = 0;
		BCR 	INTCON,2 		//0230 	110B

		//;Main.c: 29: TMR0 += 6;
		LDWI 	6H 			//0231 	2A06
		BCR 	STATUS,5 		//0232 	1283
		BCR 	STATUS,6 		//0233 	1303
		ADDWR 	1H,1 			//0234 	0B81

		//;Main.c: 32: uint8_t i;
		//;Main.c: 33: for(i = 0;i<TASK_MAX;i++)
		CLRR 	78H 			//0235 	0178

		//;Main.c: 34: {
		//;Main.c: 35: if(TaskCompany[i].Timer)
		LDWI 	6H 			//0236 	2A06
		STR 	70H 			//0237 	01F0
		LDR 	78H,0 			//0238 	0878
		LCALL 	298H 			//0239 	3298
		BCR 	PCLATH,3 		//023A 	118A
		ADDWI 	39H 			//023B 	2739
		STR 	FSR 			//023C 	0184
		BCR 	STATUS,7 		//023D 	1383
		LDR 	INDF,0 			//023E 	0800
		STR 	73H 			//023F 	01F3
		INCR	FSR,1 			//0240 	0984
		LDR 	INDF,0 			//0241 	0800
		STR 	74H 			//0242 	01F4
		IORWR 	73H,0 			//0243 	0373
		BTSC 	STATUS,2 		//0244 	1503
		LJUMP 	28AH 			//0245 	3A8A

		//;Main.c: 36: {
		//;Main.c: 37: TaskCompany[i].Timer--;
		LDWI 	6H 			//0246 	2A06
		STR 	70H 			//0247 	01F0
		LDR 	78H,0 			//0248 	0878
		LCALL 	298H 			//0249 	3298
		BCR 	PCLATH,3 		//024A 	118A
		ADDWI 	39H 			//024B 	2739
		STR 	FSR 			//024C 	0184
		LDWI 	1H 			//024D 	2A01
		BCR 	STATUS,7 		//024E 	1383
		SUBWR 	INDF,1 		//024F 	0C80
		INCRSZ 	FSR,1 		//0250 	0A84
		LDWI 	0H 			//0251 	2A00
		BTSS 	STATUS,0 		//0252 	1C03
		DECR 	INDF,1 			//0253 	0D80
		SUBWR 	INDF,1 		//0254 	0C80
		LDWI 	6H 			//0255 	2A06
		DECR 	FSR,1 			//0256 	0D84

		//;Main.c: 38: if(TaskCompany[i].Timer <= 0)
		STR 	70H 			//0257 	01F0
		LDR 	78H,0 			//0258 	0878
		LCALL 	298H 			//0259 	3298
		BCR 	PCLATH,3 		//025A 	118A
		ADDWI 	39H 			//025B 	2739
		STR 	FSR 			//025C 	0184
		BCR 	STATUS,7 		//025D 	1383
		LDR 	INDF,0 			//025E 	0800
		STR 	73H 			//025F 	01F3
		INCR	FSR,1 			//0260 	0984
		LDR 	INDF,0 			//0261 	0800
		STR 	74H 			//0262 	01F4
		IORWR 	73H,0 			//0263 	0373
		BTSS 	STATUS,2 		//0264 	1D03
		LJUMP 	28AH 			//0265 	3A8A

		//;Main.c: 39: {
		//;Main.c: 40: TaskCompany[i].Timer = TaskCompany[i].IvtTime;
		LDWI 	6H 			//0266 	2A06
		STR 	70H 			//0267 	01F0
		LDR 	78H,0 			//0268 	0878
		LCALL 	298H 			//0269 	3298
		BCR 	PCLATH,3 		//026A 	118A
		ADDWI 	3BH 			//026B 	273B
		STR 	FSR 			//026C 	0184
		BCR 	STATUS,7 		//026D 	1383
		LDR 	INDF,0 			//026E 	0800
		STR 	73H 			//026F 	01F3
		INCR	FSR,1 			//0270 	0984
		LDR 	INDF,0 			//0271 	0800
		STR 	74H 			//0272 	01F4
		LDWI 	6H 			//0273 	2A06
		STR 	70H 			//0274 	01F0
		LDR 	78H,0 			//0275 	0878
		LCALL 	298H 			//0276 	3298
		BCR 	PCLATH,3 		//0277 	118A
		ADDWI 	39H 			//0278 	2739
		STR 	FSR 			//0279 	0184
		LDR 	73H,0 			//027A 	0873
		BCR 	STATUS,7 		//027B 	1383
		STR 	INDF 			//027C 	0180
		INCR	FSR,1 			//027D 	0984
		LDR 	74H,0 			//027E 	0874
		STR 	INDF 			//027F 	0180

		//;Main.c: 41: TaskCompany[i].Run = 1;
		LDWI 	6H 			//0280 	2A06
		STR 	70H 			//0281 	01F0
		LDR 	78H,0 			//0282 	0878
		LCALL 	298H 			//0283 	3298
		BCR 	PCLATH,3 		//0284 	118A
		ADDWI 	38H 			//0285 	2738
		STR 	FSR 			//0286 	0184
		BCR 	STATUS,7 		//0287 	1383
		CLRR 	INDF 			//0288 	0100
		INCR	INDF,1 			//0289 	0980
		LDWI 	4H 			//028A 	2A04
		INCR	78H,1 			//028B 	09F8
		SUBWR 	78H,0 			//028C 	0C78
		BTSS 	STATUS,0 		//028D 	1C03
		LJUMP 	236H 			//028E 	3A36
		LDR 	77H,0 			//028F 	0877
		STR 	PCLATH 			//0290 	018A
		LDR 	76H,0 			//0291 	0876
		STR 	FSR 			//0292 	0184
		SWAPR 	75H,0 			//0293 	0775
		STR 	STATUS 			//0294 	0183
		SWAPR 	7EH,1 			//0295 	07FE
		SWAPR 	7EH,0 			//0296 	077E
		RETI		 			//0297 	0009
		STR 	71H 			//0298 	01F1
		CLRR 	72H 			//0299 	0172
		LDR 	70H,0 			//029A 	0870
		BTSC 	71H,0 			//029B 	1471
		ADDWR 	72H,1 			//029C 	0BF2
		BCR 	STATUS,0 		//029D 	1003
		RLR 	70H,1 			//029E 	05F0
		BCR 	STATUS,0 		//029F 	1003
		RRR	71H,1 			//02A0 	06F1
		LDR 	71H,0 			//02A1 	0871
		BTSS 	STATUS,2 		//02A2 	1D03
		LJUMP 	29AH 			//02A3 	3A9A
		LDR 	72H,0 			//02A4 	0872
		RET		 					//02A5 	0004

		//;Task.c: 38: BUZZTT_Task();
		LCALL 	2A9H 			//02A6 	32A9
		BCR 	PCLATH,3 		//02A7 	118A

		//;Task.c: 39: Timer0_Task();
		LJUMP 	2F9H 			//02A8 	3AF9

		//;BUZZTT.c: 157: BUZZHH_Control();
		LJUMP 	2AAH 			//02A9 	3AAA

		//;BUZZTT.c: 62: if(SYS.LB_Value||SYS.INT_Value)
		LDR 	21H,0 			//02AA 	0821
		BTSC 	STATUS,2 		//02AB 	1503
		LDR 	22H,0 			//02AC 	0822
		BTSC 	STATUS,2 		//02AD 	1503
		LJUMP 	2B0H 			//02AE 	3AB0

		//;BUZZTT.c: 63: {
		//;BUZZTT.c: 64: Hummer_Task();
		LJUMP 	2B4H 			//02AF 	3AB4

		//;BUZZTT.c: 65: }
		//;BUZZTT.c: 66: else if(SYS.STANDBY_Value)
		LDR 	28H,0 			//02B0 	0828
		BTSC 	STATUS,2 		//02B1 	1503
		RET		 					//02B2 	0004

		//;BUZZTT.c: 67: {
		//;BUZZTT.c: 68: Key_Task();
		LJUMP 	2BDH 			//02B3 	3ABD

		//;BUZZTT.c: 145: Hummer_Init();
		LCALL 	2B8H 			//02B4 	32B8

		//;BUZZTT.c: 146: PC1 = 0;
		BCR 	STATUS,5 		//02B5 	1283
		BCR 	7H,1 			//02B6 	1087
		RET		 					//02B7 	0004

		//;BUZZTT.c: 49: PORTC = 0B00000000;
		CLRR 	7H 			//02B8 	0107

		//;BUZZTT.c: 50: TRISC &= ~0B00000010;
		BSR 	STATUS,5 		//02B9 	1A83
		BCR 	7H,1 			//02BA 	1087

		//;BUZZTT.c: 52: WPUC &= ~0B00000010;
		BCR 	13H,1 			//02BB 	1093
		RET		 					//02BC 	0004

		//;BUZZTT.c: 133: KEY_Init();
		LCALL 	2C0H 			//02BD 	32C0
		BCR 	PCLATH,3 		//02BE 	118A

		//;BUZZTT.c: 134: Key_Detect();
		LJUMP 	2C5H 			//02BF 	3AC5

		//;BUZZTT.c: 36: PORTC = 0B00000000;
		CLRR 	7H 			//02C0 	0107

		//;BUZZTT.c: 37: TRISC |= 0B00000010;
		BSR 	STATUS,5 		//02C1 	1A83
		BSR 	7H,1 			//02C2 	1887

		//;BUZZTT.c: 39: WPUC |= 0B00000010;
		BSR 	13H,1 			//02C3 	1893
		RET		 					//02C4 	0004

		//;BUZZTT.c: 81: static uint8_t press_cnt = 0;
		//;BUZZTT.c: 82: static uint16_t long_cnt = 0;
		//;BUZZTT.c: 83: static uint8_t long_trig = 0;
		//;BUZZTT.c: 85: if(PC1 == 0)
		BCR 	STATUS,5 		//02C5 	1283
		BTSC 	7H,1 			//02C6 	1487
		LJUMP 	2F3H 			//02C7 	3AF3

		//;BUZZTT.c: 86: {
		//;BUZZTT.c: 88: if(press_cnt <4)
		LDWI 	4H 			//02C8 	2A04
		SUBWR 	36H,0 			//02C9 	0C36
		BTSC 	STATUS,0 		//02CA 	1403
		LJUMP 	2CEH 			//02CB 	3ACE

		//;BUZZTT.c: 89: {
		//;BUZZTT.c: 90: press_cnt ++;
		INCR	36H,1 			//02CC 	09B6

		//;BUZZTT.c: 91: }
		LJUMP 	2D0H 			//02CD 	3AD0

		//;BUZZTT.c: 92: else
		//;BUZZTT.c: 93: {
		//;BUZZTT.c: 94: KEY_Press = 1;
		CLRR 	79H 			//02CE 	0179
		INCR	79H,1 			//02CF 	09F9

		//;BUZZTT.c: 95: }
		//;BUZZTT.c: 98: if(KEY_Press && long_trig == 0 && long_cnt<300)
		LDR 	79H,0 			//02D0 	0879
		BTSC 	STATUS,2 		//02D1 	1503
		LJUMP 	2E0H 			//02D2 	3AE0
		LDR 	35H,0 			//02D3 	0835
		BTSS 	STATUS,2 		//02D4 	1D03
		LJUMP 	2E0H 			//02D5 	3AE0
		LDWI 	1H 			//02D6 	2A01
		SUBWR 	31H,0 			//02D7 	0C31
		LDWI 	2CH 			//02D8 	2A2C
		BTSC 	STATUS,2 		//02D9 	1503
		SUBWR 	30H,0 			//02DA 	0C30
		BTSC 	STATUS,0 		//02DB 	1403
		LJUMP 	2E0H 			//02DC 	3AE0

		//;BUZZTT.c: 99: {
		//;BUZZTT.c: 100: long_cnt++;
		INCR	30H,1 			//02DD 	09B0
		BTSC 	STATUS,2 		//02DE 	1503
		INCR	31H,1 			//02DF 	09B1

		//;BUZZTT.c: 101: }
		//;BUZZTT.c: 105: if(KEY_Press && long_cnt >= 300 && long_trig == 0)
		LDR 	79H,0 			//02E0 	0879
		BTSC 	STATUS,2 		//02E1 	1503
		RET		 					//02E2 	0004
		LDWI 	1H 			//02E3 	2A01
		SUBWR 	31H,0 			//02E4 	0C31
		LDWI 	2CH 			//02E5 	2A2C
		BTSC 	STATUS,2 		//02E6 	1503
		SUBWR 	30H,0 			//02E7 	0C30
		BTSS 	STATUS,0 		//02E8 	1C03
		RET		 					//02E9 	0004
		LDR 	35H,0 			//02EA 	0835
		BTSS 	STATUS,2 		//02EB 	1D03
		RET		 					//02EC 	0004

		//;BUZZTT.c: 106: {
		//;BUZZTT.c: 108: SYS.Long_Time_Change = 0;
		CLRR 	2DH 			//02ED 	012D

		//;BUZZTT.c: 109: SYS.KEY_Value = 1;
		CLRR 	24H 			//02EE 	0124
		INCR	24H,1 			//02EF 	09A4

		//;BUZZTT.c: 111: long_trig = 1;
		CLRR 	35H 			//02F0 	0135
		INCR	35H,1 			//02F1 	09B5
		RET		 					//02F2 	0004

		//;BUZZTT.c: 115: else
		//;BUZZTT.c: 116: {
		//;BUZZTT.c: 118: press_cnt = 0;
		CLRR 	36H 			//02F3 	0136

		//;BUZZTT.c: 119: KEY_Press = 0;
		CLRR 	79H 			//02F4 	0179

		//;BUZZTT.c: 120: long_cnt = 0;
		CLRR 	30H 			//02F5 	0130
		CLRR 	31H 			//02F6 	0131

		//;BUZZTT.c: 121: long_trig = 0;
		CLRR 	35H 			//02F7 	0135
		RET		 					//02F8 	0004

		//;Timer.c: 22: static uint16_t Long_Ready_Time = 0;
		//;Timer.c: 24: if(SYS.Standby_Work_State == 1)
		DECRSZ 	20H,0 		//02F9 	0E20
		LJUMP 	30AH 			//02FA 	3B0A

		//;Timer.c: 25: {
		//;Timer.c: 26: Long_Ready_Time++;
		INCR	2EH,1 			//02FB 	09AE
		BTSC 	STATUS,2 		//02FC 	1503
		INCR	2FH,1 			//02FD 	09AF

		//;Timer.c: 28: if(Long_Ready_Time>=4000)
		LDWI 	FH 			//02FE 	2A0F
		SUBWR 	2FH,0 			//02FF 	0C2F
		LDWI 	A0H 			//0300 	2AA0
		BTSC 	STATUS,2 		//0301 	1503
		SUBWR 	2EH,0 			//0302 	0C2E
		BTSS 	STATUS,0 		//0303 	1C03
		RET		 					//0304 	0004

		//;Timer.c: 29: {
		//;Timer.c: 30: Long_Ready_Time = 0;
		CLRR 	2EH 			//0305 	012E
		CLRR 	2FH 			//0306 	012F

		//;Timer.c: 31: SYS.Long_Time_Change = 1;
		CLRR 	2DH 			//0307 	012D
		INCR	2DH,1 			//0308 	09AD
		RET		 					//0309 	0004

		//;Timer.c: 35: else
		//;Timer.c: 36: {
		//;Timer.c: 37: SYS.Long_Time_Change = 0;
		CLRR 	2DH 			//030A 	012D

		//;Timer.c: 38: Long_Ready_Time = 0;
		CLRR 	2EH 			//030B 	012E
		CLRR 	2FH 			//030C 	012F
		RET		 					//030D 	0004

		//;Task.c: 72: unsigned char i;
		//;Task.c: 73: for(i = 0;i<TASK_MAX;i++)
		CLRR 	57H 			//030E 	0157

		//;Task.c: 74: {
		//;Task.c: 75: if(TaskCompany[i].Run == 1)
		LDWI 	6H 			//030F 	2A06
		STR 	50H 			//0310 	01D0
		LDR 	57H,0 			//0311 	0857
		LCALL 	333H 			//0312 	3333
		BCR 	PCLATH,3 		//0313 	118A
		ADDWI 	38H 			//0314 	2738
		STR 	FSR 			//0315 	0184
		BCR 	STATUS,7 		//0316 	1383
		DECRSZ 	INDF,0 		//0317 	0E00
		LJUMP 	32DH 			//0318 	3B2D

		//;Task.c: 76: {
		//;Task.c: 77: TaskCompany[i].Run = 0;
		LDWI 	6H 			//0319 	2A06
		STR 	50H 			//031A 	01D0
		LDR 	57H,0 			//031B 	0857
		LCALL 	333H 			//031C 	3333
		BCR 	PCLATH,3 		//031D 	118A
		ADDWI 	38H 			//031E 	2738
		STR 	FSR 			//031F 	0184
		LDWI 	6H 			//0320 	2A06
		BCR 	STATUS,7 		//0321 	1383
		CLRR 	INDF 			//0322 	0100

		//;Task.c: 78: TaskCompany[i].TaskHook();
		STR 	50H 			//0323 	01D0
		LDR 	57H,0 			//0324 	0857
		LCALL 	333H 			//0325 	3333
		ADDWI 	3DH 			//0326 	273D
		STR 	FSR 			//0327 	0184
		BCR 	STATUS,7 		//0328 	1383
		LDR 	INDF,0 			//0329 	0800
		BCR 	PCLATH,3 		//032A 	118A
		LCALL 	3EH 			//032B 	303E
		BCR 	PCLATH,3 		//032C 	118A
		LDWI 	4H 			//032D 	2A04
		INCR	57H,1 			//032E 	09D7
		SUBWR 	57H,0 			//032F 	0C57
		BTSC 	STATUS,0 		//0330 	1403
		RET		 					//0331 	0004
		LJUMP 	30FH 			//0332 	3B0F
		STR 	52H 			//0333 	01D2
		CLRR 	51H 			//0334 	0151
		LDR 	50H,0 			//0335 	0850
		BTSC 	52H,0 			//0336 	1452
		ADDWR 	51H,1 			//0337 	0BD1
		BCR 	STATUS,0 		//0338 	1003
		RLR 	50H,1 			//0339 	05D0
		BCR 	STATUS,0 		//033A 	1003
		RRR	52H,1 			//033B 	06D2
		LDR 	52H,0 			//033C 	0852
		BTSS 	STATUS,2 		//033D 	1D03
		LJUMP 	335H 			//033E 	3B35
		LDR 	51H,0 			//033F 	0851
		RET		 					//0340 	0004
		CLRWDT	 			//0341 	0001
		CLRR 	INDF 			//0342 	0100
		INCR	FSR,1 			//0343 	0984
		XORWR 	FSR,0 			//0344 	0404
		BTSC 	STATUS,2 		//0345 	1503
		RETW 	0H 			//0346 	2100
		XORWR 	FSR,0 			//0347 	0404
		LJUMP 	342H 			//0348 	3B42

		//;Main.c: 55: Initial();
		BCR 	PCLATH,3 		//0349 	118A
		LCALL 	4CH 			//034A 	304C
		BCR 	PCLATH,3 		//034B 	118A

		//;Main.c: 57: {
		//;Main.c: 58: Task_Process();
		BCR 	PCLATH,3 		//034C 	118A
		LCALL 	30EH 			//034D 	330E
		BCR 	PCLATH,3 		//034E 	118A
		LJUMP 	34CH 			//034F 	3B4C
		RET		 					//0350 	0004
		RET		 					//0351 	0004
			END
