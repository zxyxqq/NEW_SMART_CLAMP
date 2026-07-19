//Deviec:FT60FC2X
//-----------------------Variable---------------------------------
		_SYS.Standby_Work_State		EQU		38H
		_SYS.RC_Value		EQU		39H
		_SYS.INT_Value		EQU		3AH
		_SYS.Ready_Value		EQU		3BH
		_SYS.STANDBY_Value		EQU		3CH
		_SYS.Long_Time_Change		EQU		3DH
		_SYS.Key_Press_Value		EQU		3EH
		_SYS.KEY_Value		EQU		3FH
		_SYS.SBY_Value		EQU		40H
		_SYS.RES_Change		EQU		41H
		_SYS		EQU		38H
		_PA2		EQU		05H
		_T0IF		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_current_output		EQU		7DH
		_last_state		EQU		42H
		_TaskCompany.Run		EQU		20H
		_TaskCompany.Timer		EQU		21H
		_TaskCompany.IvtTime		EQU		23H
		_TaskCompany.TaskHook		EQU		25H
		_TaskCompany		EQU		20H
//		main@zx		EQU		48H
//		Task_Process@i		EQU		46H
//		___bmul@multiplier		EQU		45H
//		___bmul@product		EQU		44H
//		___bmul@multiplier		EQU		45H
//		___bmul@multiplicand		EQU		43H
//		___bmul@multiplier		EQU		45H
//		Ready_Control@on		EQU		43H
//		Ready_Control@on		EQU		43H
//		Ready_Control@on		EQU		43H
//		REGISTER_Control@target		EQU		43H
//		Key_Detect@press_cnt		EQU		7CH
//		Key_Detect@long_cnt		EQU		79H
//		Key_Detect@long_trig		EQU		7BH
//		DelayMs@Time		EQU		45H
//		DelayMs@b		EQU		47H
//		DelayMs@a		EQU		46H
//		DelayMs@Time		EQU		45H
//		DelayMs@Time		EQU		45H
//		DelayUs@Time		EQU		43H
//		DelayUs@a		EQU		44H
//		DelayUs@Time		EQU		43H
//		DelayUs@Time		EQU		43H
//		ISR@i		EQU		78H
//		i1___bmul@multiplier		EQU		71H
//		i1___bmul@product		EQU		72H
//		i1___bmul@multiplier		EQU		71H
//		i1___bmul@multiplicand		EQU		70H
//		i1___bmul@multiplier		EQU		71H
//-----------------------Variable END---------------------------------

		LJUMP 	0CH 			//0000 	380C
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	75H 			//0006 	01F5
		LDR 	FSR,0 			//0007 	0804
		STR 	76H 			//0008 	01F6
		LDR 	PCLATH,0 		//0009 	080A
		STR 	77H 			//000A 	01F7
		LJUMP 	2BH 			//000B 	382B
		LJUMP 	0DH 			//000C 	380D
		LDWI 	38H 			//000D 	2A38
		BCR 	STATUS,7 		//000E 	1383
		STR 	7DH 			//000F 	01FD
		LDWI 	0H 			//0010 	2A00
		STR 	7EH 			//0011 	01FE
		LDWI 	F6H 			//0012 	2AF6
		STR 	7FH 			//0013 	01FF
		LDWI 	20H 			//0014 	2A20
		STR 	FSR 			//0015 	0184
		LCALL 	138H 			//0016 	3138
		LDWI 	38H 			//0017 	2A38
		STR 	FSR 			//0018 	0184
		LDWI 	43H 			//0019 	2A43
		LCALL 	18FH 			//001A 	318F
		LDWI 	79H 			//001B 	2A79
		STR 	FSR 			//001C 	0184
		LDWI 	7EH 			//001D 	2A7E
		LCALL 	18FH 			//001E 	318F
		CLRR 	STATUS 			//001F 	0103
		LJUMP 	1A6H 			//0020 	39A6
		STR 	7FH 			//0021 	01FF
		LDWI 	0H 			//0022 	2A00
		STR 	PCLATH 			//0023 	018A
		LDR 	7FH,0 			//0024 	087F
		ADDWR 	PCL,1 			//0025 	0B82
		LJUMP 	26H 			//0026 	3826
		LJUMP 	1DAH 			//0027 	39DA
		LJUMP 	1C1H 			//0028 	39C1
		LJUMP 	1D9H 			//0029 	39D9
		LJUMP 	1D8H 			//002A 	39D8

		//;Main.C: 26: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//002B 	168B
		BTSS 	INTCON,2 		//002C 	1D0B
		LJUMP 	74H 			//002D 	3874

		//;Main.C: 27: {
		//;Main.C: 28: T0IF = 0;
		BCR 	INTCON,2 		//002E 	110B

		//;Main.C: 29: TMR0 += 6;
		LDWI 	6H 			//002F 	2A06
		BCR 	STATUS,5 		//0030 	1283
		ADDWR 	1H,1 			//0031 	0B81

		//;Main.C: 32: uint8_t i;
		//;Main.C: 33: for(i = 0;i<TASK_MAX;i++)
		CLRR 	78H 			//0032 	0178

		//;Main.C: 34: {
		//;Main.C: 35: if(TaskCompany[i].Timer)
		LDWI 	6H 			//0033 	2A06
		STR 	70H 			//0034 	01F0
		LDR 	78H,0 			//0035 	0878
		LCALL 	15FH 			//0036 	315F
		ADDWI 	21H 			//0037 	2721
		LCALL 	7DH 			//0038 	307D
		IORWR 	73H,0 			//0039 	0373
		BTSC 	STATUS,2 		//003A 	1503
		LJUMP 	6FH 			//003B 	386F

		//;Main.C: 36: {
		//;Main.C: 37: TaskCompany[i].Timer--;
		LDWI 	6H 			//003C 	2A06
		STR 	70H 			//003D 	01F0
		LDR 	78H,0 			//003E 	0878
		LCALL 	15FH 			//003F 	315F
		ADDWI 	21H 			//0040 	2721
		STR 	FSR 			//0041 	0184
		LDWI 	1H 			//0042 	2A01
		BCR 	STATUS,7 		//0043 	1383
		SUBWR 	INDF,1 		//0044 	0C80
		INCRSZ 	FSR,1 		//0045 	0A84
		LDWI 	0H 			//0046 	2A00
		BTSS 	STATUS,0 		//0047 	1C03
		DECR 	INDF,1 			//0048 	0D80
		SUBWR 	INDF,1 		//0049 	0C80
		LDWI 	6H 			//004A 	2A06
		DECR 	FSR,1 			//004B 	0D84

		//;Main.C: 38: if(TaskCompany[i].Timer <= 0)
		STR 	70H 			//004C 	01F0
		LDR 	78H,0 			//004D 	0878
		LCALL 	15FH 			//004E 	315F
		ADDWI 	21H 			//004F 	2721
		LCALL 	7DH 			//0050 	307D
		IORWR 	73H,0 			//0051 	0373
		BTSS 	STATUS,2 		//0052 	1D03
		LJUMP 	6FH 			//0053 	386F

		//;Main.C: 39: {
		//;Main.C: 40: TaskCompany[i].Timer = TaskCompany[i].IvtTime;
		LDWI 	6H 			//0054 	2A06
		STR 	70H 			//0055 	01F0
		LDR 	78H,0 			//0056 	0878
		LCALL 	15FH 			//0057 	315F
		ADDWI 	23H 			//0058 	2723
		LCALL 	7DH 			//0059 	307D
		LDWI 	6H 			//005A 	2A06
		STR 	70H 			//005B 	01F0
		LDR 	78H,0 			//005C 	0878
		LCALL 	15FH 			//005D 	315F
		ADDWI 	21H 			//005E 	2721
		STR 	FSR 			//005F 	0184
		LDR 	73H,0 			//0060 	0873
		BCR 	STATUS,7 		//0061 	1383
		STR 	INDF 			//0062 	0180
		INCR	FSR,1 			//0063 	0984
		LDR 	74H,0 			//0064 	0874
		STR 	INDF 			//0065 	0180

		//;Main.C: 41: TaskCompany[i].Run = 1;
		LDWI 	6H 			//0066 	2A06
		STR 	70H 			//0067 	01F0
		LDR 	78H,0 			//0068 	0878
		LCALL 	15FH 			//0069 	315F
		ADDWI 	20H 			//006A 	2720
		STR 	FSR 			//006B 	0184
		BCR 	STATUS,7 		//006C 	1383
		CLRR 	INDF 			//006D 	0100
		INCR	INDF,1 			//006E 	0980
		LDWI 	4H 			//006F 	2A04
		INCR	78H,1 			//0070 	09F8
		SUBWR 	78H,0 			//0071 	0C78
		BTSS 	STATUS,0 		//0072 	1C03
		LJUMP 	33H 			//0073 	3833
		LDR 	77H,0 			//0074 	0877
		STR 	PCLATH 			//0075 	018A
		LDR 	76H,0 			//0076 	0876
		STR 	FSR 			//0077 	0184
		SWAPR 	75H,0 			//0078 	0775
		STR 	STATUS 			//0079 	0183
		SWAPR 	7EH,1 			//007A 	07FE
		SWAPR 	7EH,0 			//007B 	077E
		RETI		 			//007C 	0009
		STR 	FSR 			//007D 	0184
		BCR 	STATUS,7 		//007E 	1383
		LDR 	INDF,0 			//007F 	0800
		STR 	73H 			//0080 	01F3
		INCR	FSR,1 			//0081 	0984
		LDR 	INDF,0 			//0082 	0800
		STR 	74H 			//0083 	01F4
		RET		 					//0084 	0004

		//;BUZZ.C: 57: static uint8_t press_cnt = 0;
		//;BUZZ.C: 58: static uint16_t long_cnt = 0;
		//;BUZZ.C: 59: static uint8_t long_trig = 0;
		//;BUZZ.C: 61: if(!PA2)
		BCR 	STATUS,5 		//0085 	1283
		BTSC 	5H,2 			//0086 	1505
		LJUMP 	B4H 			//0087 	38B4

		//;BUZZ.C: 62: {
		//;BUZZ.C: 64: if(press_cnt <4)
		LDWI 	4H 			//0088 	2A04
		SUBWR 	7CH,0 			//0089 	0C7C
		BTSC 	STATUS,0 		//008A 	1403
		LJUMP 	8EH 			//008B 	388E

		//;BUZZ.C: 65: {
		//;BUZZ.C: 66: press_cnt ++;
		INCR	7CH,1 			//008C 	09FC

		//;BUZZ.C: 67: }
		LJUMP 	90H 			//008D 	3890

		//;BUZZ.C: 68: else
		//;BUZZ.C: 69: {
		//;BUZZ.C: 70: SYS.KEY_Value = 1;
		CLRR 	3FH 			//008E 	013F
		INCR	3FH,1 			//008F 	09BF

		//;BUZZ.C: 71: }
		//;BUZZ.C: 74: if(SYS.KEY_Value && long_trig == 0 && long_cnt<300)
		LDR 	3FH,0 			//0090 	083F
		BTSC 	STATUS,2 		//0091 	1503
		LJUMP 	A0H 			//0092 	38A0
		LDR 	7BH,0 			//0093 	087B
		BTSS 	STATUS,2 		//0094 	1D03
		LJUMP 	A0H 			//0095 	38A0
		LDWI 	1H 			//0096 	2A01
		SUBWR 	7AH,0 			//0097 	0C7A
		LDWI 	2CH 			//0098 	2A2C
		BTSC 	STATUS,2 		//0099 	1503
		SUBWR 	79H,0 			//009A 	0C79
		BTSC 	STATUS,0 		//009B 	1403
		LJUMP 	A0H 			//009C 	38A0

		//;BUZZ.C: 75: {
		//;BUZZ.C: 76: long_cnt++;
		INCR	79H,1 			//009D 	09F9
		BTSC 	STATUS,2 		//009E 	1503
		INCR	7AH,1 			//009F 	09FA

		//;BUZZ.C: 77: }
		//;BUZZ.C: 81: if(SYS.KEY_Value && long_cnt >= 300 && long_trig == 0)
		LDR 	3FH,0 			//00A0 	083F
		BTSC 	STATUS,2 		//00A1 	1503
		RET		 					//00A2 	0004
		LDWI 	1H 			//00A3 	2A01
		SUBWR 	7AH,0 			//00A4 	0C7A
		LDWI 	2CH 			//00A5 	2A2C
		BTSC 	STATUS,2 		//00A6 	1503
		SUBWR 	79H,0 			//00A7 	0C79
		BTSS 	STATUS,0 		//00A8 	1C03
		RET		 					//00A9 	0004
		LDR 	7BH,0 			//00AA 	087B
		BTSS 	STATUS,2 		//00AB 	1D03
		RET		 					//00AC 	0004

		//;BUZZ.C: 82: {
		//;BUZZ.C: 84: SYS.Long_Time_Change = 0;
		CLRR 	3DH 			//00AD 	013D

		//;BUZZ.C: 85: SYS.KEY_Value = 0;
		CLRR 	3FH 			//00AE 	013F

		//;BUZZ.C: 86: SYS.Key_Press_Value = 1;
		CLRR 	3EH 			//00AF 	013E
		INCR	3EH,1 			//00B0 	09BE

		//;BUZZ.C: 88: long_trig = 1;
		CLRR 	7BH 			//00B1 	017B
		INCR	7BH,1 			//00B2 	09FB
		RET		 					//00B3 	0004

		//;BUZZ.C: 92: else
		//;BUZZ.C: 93: {
		//;BUZZ.C: 95: press_cnt = 0;
		CLRR 	7CH 			//00B4 	017C

		//;BUZZ.C: 96: SYS.KEY_Value = 0;
		CLRR 	3FH 			//00B5 	013F

		//;BUZZ.C: 97: SYS.Key_Press_Value = 0;
		CLRR 	3EH 			//00B6 	013E

		//;BUZZ.C: 98: long_cnt = 0;
		CLRR 	79H 			//00B7 	0179
		CLRR 	7AH 			//00B8 	017A

		//;BUZZ.C: 99: long_trig = 0;
		CLRR 	7BH 			//00B9 	017B
		RET		 					//00BA 	0004

		//;TASK.C: 113: unsigned char i;
		//;TASK.C: 114: for(i = 0;i<TASK_MAX;i++)
		CLRR 	46H 			//00BB 	0146

		//;TASK.C: 115: {
		//;TASK.C: 116: if(TaskCompany[i].Run == 1)
		LDWI 	6H 			//00BC 	2A06
		STR 	43H 			//00BD 	01C3
		LDR 	46H,0 			//00BE 	0846
		LCALL 	143H 			//00BF 	3143
		ADDWI 	20H 			//00C0 	2720
		STR 	FSR 			//00C1 	0184
		BCR 	STATUS,7 		//00C2 	1383
		DECRSZ 	INDF,0 		//00C3 	0E00
		LJUMP 	D6H 			//00C4 	38D6

		//;TASK.C: 117: {
		//;TASK.C: 118: TaskCompany[i].Run = 0;
		LDWI 	6H 			//00C5 	2A06
		STR 	43H 			//00C6 	01C3
		LDR 	46H,0 			//00C7 	0846
		LCALL 	143H 			//00C8 	3143
		ADDWI 	20H 			//00C9 	2720
		STR 	FSR 			//00CA 	0184
		LDWI 	6H 			//00CB 	2A06
		BCR 	STATUS,7 		//00CC 	1383
		CLRR 	INDF 			//00CD 	0100

		//;TASK.C: 119: TaskCompany[i].TaskHook();
		STR 	43H 			//00CE 	01C3
		LDR 	46H,0 			//00CF 	0846
		LCALL 	143H 			//00D0 	3143
		ADDWI 	25H 			//00D1 	2725
		STR 	FSR 			//00D2 	0184
		BCR 	STATUS,7 		//00D3 	1383
		LDR 	INDF,0 			//00D4 	0800
		LCALL 	21H 			//00D5 	3021
		LDWI 	4H 			//00D6 	2A04
		INCR	46H,1 			//00D7 	09C6
		SUBWR 	46H,0 			//00D8 	0C46
		BTSC 	STATUS,0 		//00D9 	1403
		RET		 					//00DA 	0004
		LJUMP 	BCH 			//00DB 	38BC

		//;POWER.C: 12: OSCCON = 0B01100001;
		LDWI 	61H 			//00DC 	2A61
		BSR 	STATUS,5 		//00DD 	1A83
		STR 	FH 			//00DE 	018F

		//;POWER.C: 13: INTCON = 0;
		CLRR 	INTCON 			//00DF 	010B

		//;POWER.C: 14: PORTA = 0B00000000;
		BCR 	STATUS,5 		//00E0 	1283
		CLRR 	5H 			//00E1 	0105

		//;POWER.C: 15: TRISA = 0B01000000;
		LDWI 	40H 			//00E2 	2A40
		BSR 	STATUS,5 		//00E3 	1A83
		STR 	5H 			//00E4 	0185

		//;POWER.C: 17: PORTC = 0B00000000;
		BCR 	STATUS,5 		//00E5 	1283
		CLRR 	7H 			//00E6 	0107

		//;POWER.C: 18: TRISC = 0B00000000;
		BSR 	STATUS,5 		//00E7 	1A83
		CLRR 	7H 			//00E8 	0107

		//;POWER.C: 20: WPUA = 0B01000000;
		STR 	15H 			//00E9 	0195

		//;POWER.C: 22: WPUC = 0B00000000;
		CLRR 	13H 			//00EA 	0113

		//;POWER.C: 25: OPTION = 0B00001000;
		LDWI 	8H 			//00EB 	2A08
		STR 	1H 			//00EC 	0181

		//;POWER.C: 26: PSRCA = 0B11111111;
		LDWI 	FFH 			//00ED 	2AFF
		STR 	8H 			//00EE 	0188

		//;POWER.C: 27: PSRCC = 0B11111111;
		STR 	14H 			//00EF 	0194

		//;POWER.C: 28: PSINKA = 0B11111111;
		STR 	17H 			//00F0 	0197

		//;POWER.C: 29: PSINKC = 0B11111111;
		STR 	1FH 			//00F1 	019F

		//;POWER.C: 31: MSCON = 0B00110000;
		LDWI 	30H 			//00F2 	2A30
		BCR 	STATUS,5 		//00F3 	1283
		STR 	1BH 			//00F4 	019B
		RET		 					//00F5 	0004
		RETW 	0H 			//00F6 	2100
		RETW 	1H 			//00F7 	2101
		RETW 	0H 			//00F8 	2100
		RETW 	5H 			//00F9 	2105
		RETW 	0H 			//00FA 	2100
		RETW 	2H 			//00FB 	2102
		RETW 	0H 			//00FC 	2100
		RETW 	2H 			//00FD 	2102
		RETW 	0H 			//00FE 	2100
		RETW 	AH 			//00FF 	210A
		RETW 	0H 			//0100 	2100
		RETW 	3H 			//0101 	2103
		RETW 	0H 			//0102 	2100
		RETW 	3H 			//0103 	2103
		RETW 	0H 			//0104 	2100
		RETW 	14H 			//0105 	2114
		RETW 	0H 			//0106 	2100
		RETW 	4H 			//0107 	2104
		RETW 	0H 			//0108 	2100
		RETW 	4H 			//0109 	2104
		RETW 	0H 			//010A 	2100
		RETW 	F4H 			//010B 	21F4
		RETW 	1H 			//010C 	2101
		RETW 	1H 			//010D 	2101

		//;REGISTER.C: 75: Register_State target = SYS.RES_Change;
		LDR 	41H,0 			//010E 	0841
		STR 	43H 			//010F 	01C3

		//;REGISTER.C: 77: if (target == last_state)
		XORWR 	42H,0 			//0110 	0442
		BTSC 	STATUS,2 		//0111 	1503
		RET		 					//0112 	0004
		LJUMP 	118H 			//0113 	3918
		LCALL 	1CDH 			//0114 	31CD
		LJUMP 	120H 			//0115 	3920
		LCALL 	1C5H 			//0116 	31C5
		LJUMP 	120H 			//0117 	3920
		LDR 	43H,0 			//0118 	0843
		XORWI 	0H 			//0119 	2600
		BTSC 	STATUS,2 		//011A 	1503
		LJUMP 	114H 			//011B 	3914
		XORWI 	1H 			//011C 	2601
		BTSC 	STATUS,2 		//011D 	1503
		LJUMP 	116H 			//011E 	3916
		LJUMP 	120H 			//011F 	3920

		//;REGISTER.C: 86: last_state = target;
		BCR 	STATUS,5 		//0120 	1283
		LDR 	43H,0 			//0121 	0843
		STR 	42H 			//0122 	01C2
		RET		 					//0123 	0004
		STR 	45H 			//0124 	01C5

		//;Delay.C: 24: unsigned char a,b;
		//;Delay.C: 25: for(a=0;a<Time;a++)
		CLRR 	46H 			//0125 	0146
		LDR 	45H,0 			//0126 	0845
		SUBWR 	46H,0 			//0127 	0C46
		BTSC 	STATUS,0 		//0128 	1403
		RET		 					//0129 	0004

		//;Delay.C: 26: {
		//;Delay.C: 27: for(b=0;b<5;b++)
		CLRR 	47H 			//012A 	0147

		//;Delay.C: 28: {
		//;Delay.C: 29: DelayUs(197);
		LDWI 	C5H 			//012B 	2AC5
		LCALL 	185H 			//012C 	3185
		LDWI 	5H 			//012D 	2A05
		INCR	47H,1 			//012E 	09C7
		SUBWR 	47H,0 			//012F 	0C47
		BTSS 	STATUS,0 		//0130 	1C03
		LJUMP 	12BH 			//0131 	392B
		INCR	46H,1 			//0132 	09C6
		LJUMP 	126H 			//0133 	3926
		LDR 	7EH,0 			//0134 	087E
		STR 	PCLATH 			//0135 	018A
		LDR 	7FH,0 			//0136 	087F
		STR 	PCL 			//0137 	0182
		LCALL 	134H 			//0138 	3134
		STR 	INDF 			//0139 	0180
		INCR	FSR,1 			//013A 	0984
		LDR 	FSR,0 			//013B 	0804
		XORWR 	7DH,0 			//013C 	047D
		BTSC 	STATUS,2 		//013D 	1503
		RETW 	0H 			//013E 	2100
		INCR	7FH,1 			//013F 	09FF
		BTSC 	STATUS,2 		//0140 	1503
		INCR	7EH,1 			//0141 	09FE
		LJUMP 	138H 			//0142 	3938
		STR 	45H 			//0143 	01C5
		CLRR 	44H 			//0144 	0144
		LDR 	43H,0 			//0145 	0843
		BTSC 	45H,0 			//0146 	1445
		ADDWR 	44H,1 			//0147 	0BC4
		BCR 	STATUS,0 		//0148 	1003
		RLR 	43H,1 			//0149 	05C3
		BCR 	STATUS,0 		//014A 	1003
		RRR	45H,1 			//014B 	06C5
		LDR 	45H,0 			//014C 	0845
		BTSS 	STATUS,2 		//014D 	1D03
		LJUMP 	145H 			//014E 	3945
		LDR 	44H,0 			//014F 	0844
		RET		 					//0150 	0004
		BCR 	STATUS,5 		//0151 	1283
		STR 	43H 			//0152 	01C3

		//;READY.C: 30: if (on == current_output) {
		XORWR 	7DH,0 			//0153 	047D
		BTSC 	STATUS,2 		//0154 	1503
		RET		 					//0155 	0004

		//;READY.C: 32: }
		//;READY.C: 35: if (on) {
		LDR 	43H,0 			//0156 	0843
		BTSC 	STATUS,2 		//0157 	1503
		LJUMP 	15BH 			//0158 	395B

		//;READY.C: 36: PORTC |= (1 << 5);
		BSR 	7H,5 			//0159 	1A87

		//;READY.C: 37: } else {
		LJUMP 	15CH 			//015A 	395C

		//;READY.C: 38: PORTC &= ~(1 << 5);
		BCR 	7H,5 			//015B 	1287

		//;READY.C: 39: }
		//;READY.C: 41: current_output = on;
		LDR 	43H,0 			//015C 	0843
		STR 	7DH 			//015D 	01FD
		RET		 					//015E 	0004
		STR 	71H 			//015F 	01F1
		CLRR 	72H 			//0160 	0172
		LDR 	70H,0 			//0161 	0870
		BTSC 	71H,0 			//0162 	1471
		ADDWR 	72H,1 			//0163 	0BF2
		BCR 	STATUS,0 		//0164 	1003
		RLR 	70H,1 			//0165 	05F0
		BCR 	STATUS,0 		//0166 	1003
		RRR	71H,1 			//0167 	06F1
		LDR 	71H,0 			//0168 	0871
		BTSS 	STATUS,2 		//0169 	1D03
		LJUMP 	161H 			//016A 	3961
		LDR 	72H,0 			//016B 	0872
		RET		 					//016C 	0004

		//;APP.C: 13: DelayMs(20);
		LDWI 	14H 			//016D 	2A14
		LCALL 	124H 			//016E 	3124

		//;APP.C: 14: POWER_INITIAL();
		LCALL 	DCH 			//016F 	30DC

		//;APP.C: 15: Timer0_Init();
		LCALL 	197H 			//0170 	3197

		//;APP.C: 16: RC_Init();
		LCALL 	1D3H 			//0171 	31D3

		//;APP.C: 17: INT_Init();
		LCALL 	1B7H 			//0172 	31B7

		//;APP.C: 18: SBY_Init();
		LCALL 	1B2H 			//0173 	31B2

		//;APP.C: 19: Ready_Init();
		LCALL 	1ACH 			//0174 	31AC

		//;APP.C: 20: REGISTER_Init();
		LCALL 	19FH 			//0175 	319F

		//;APP.C: 21: Hummer_Init();
		LCALL 	1BCH 			//0176 	31BC

		//;APP.C: 23: T0IE = 1;
		BSR 	INTCON,5 		//0177 	1A8B

		//;APP.C: 25: GIE = 1;
		BSR 	INTCON,7 		//0178 	1B8B
		RET		 					//0179 	0004

		//;BUZZ.C: 111: TRISA &= ~0B00000100;
		BSR 	STATUS,5 		//017A 	1A83
		BCR 	5H,2 			//017B 	1105

		//;BUZZ.C: 112: PA2 = 1;
		BCR 	STATUS,5 		//017C 	1283
		BSR 	5H,2 			//017D 	1905

		//;BUZZ.C: 114: KEY_Init();
		LCALL 	1C9H 			//017E 	31C9

		//;BUZZ.C: 115: Key_Detect();
		LCALL 	85H 			//017F 	3085

		//;BUZZ.C: 116: TRISA &= ~0B00000100;
		BSR 	STATUS,5 		//0180 	1A83
		BCR 	5H,2 			//0181 	1105

		//;BUZZ.C: 117: PA2 = 1;
		BCR 	STATUS,5 		//0182 	1283
		BSR 	5H,2 			//0183 	1905
		RET		 					//0184 	0004
		STR 	43H 			//0185 	01C3

		//;Delay.C: 10: unsigned char a;
		//;Delay.C: 11: for(a=0;a<Time;a++)
		CLRR 	44H 			//0186 	0144
		LDR 	43H,0 			//0187 	0843
		SUBWR 	44H,0 			//0188 	0C44
		BTSC 	STATUS,0 		//0189 	1403
		RET		 					//018A 	0004

		//;Delay.C: 12: {
		//;Delay.C: 13: __nop();
		NOP		 					//018B 	0000
		BCR 	STATUS,5 		//018C 	1283
		INCR	44H,1 			//018D 	09C4
		LJUMP 	187H 			//018E 	3987
		CLRWDT	 			//018F 	0001
		CLRR 	INDF 			//0190 	0100
		INCR	FSR,1 			//0191 	0984
		XORWR 	FSR,0 			//0192 	0404
		BTSC 	STATUS,2 		//0193 	1503
		RETW 	0H 			//0194 	2100
		XORWR 	FSR,0 			//0195 	0404
		LJUMP 	190H 			//0196 	3990

		//;Timer.C: 11: OPTION = 0B00000100;
		LDWI 	4H 			//0197 	2A04
		BSR 	STATUS,5 		//0198 	1A83
		STR 	1H 			//0199 	0181

		//;Timer.C: 12: T0IF = 0;
		BCR 	INTCON,2 		//019A 	110B

		//;Timer.C: 13: TMR0 = 6;
		LDWI 	6H 			//019B 	2A06
		BCR 	STATUS,5 		//019C 	1283
		STR 	1H 			//019D 	0181
		RET		 					//019E 	0004

		//;REGISTER.C: 20: PORTA &= ~(1 << 0);
		BCR 	STATUS,5 		//019F 	1283
		BCR 	5H,0 			//01A0 	1005

		//;REGISTER.C: 22: TRISA |= (1 << 0);
		BSR 	STATUS,5 		//01A1 	1A83
		BSR 	5H,0 			//01A2 	1805

		//;REGISTER.C: 24: last_state = High_Register;
		BCR 	STATUS,5 		//01A3 	1283
		CLRR 	42H 			//01A4 	0142
		RET		 					//01A5 	0004

		//;Main.C: 55: Initial();
		LCALL 	16DH 			//01A6 	316D

		//;Main.C: 56: volatile uint8_t zx = 0;
		BCR 	STATUS,5 		//01A7 	1283
		CLRR 	48H 			//01A8 	0148

		//;Main.C: 57: Key_Task();
		LCALL 	17AH 			//01A9 	317A

		//;Main.C: 59: {
		//;Main.C: 61: Task_Process();
		LCALL 	BBH 			//01AA 	30BB
		LJUMP 	1AAH 			//01AB 	39AA

		//;READY.C: 14: PORTC &= ~(1 << 5);
		BCR 	STATUS,5 		//01AC 	1283
		BCR 	7H,5 			//01AD 	1287

		//;READY.C: 16: TRISC &= ~(1 << 5);
		BSR 	STATUS,5 		//01AE 	1A83
		BCR 	7H,5 			//01AF 	1287

		//;READY.C: 19: current_output = 0;
		CLRR 	7DH 			//01B0 	017D
		RET		 					//01B1 	0004

		//;SBY.C: 16: PORTA &= ~(1 << 1);
		BCR 	STATUS,5 		//01B2 	1283
		BCR 	5H,1 			//01B3 	1085

		//;SBY.C: 22: current_output_state = RC_ST_led_Close;
		BSR 	STATUS,5 		//01B4 	1A83
		BSR 	5H,1 			//01B5 	1885
		RET		 					//01B6 	0004

		//;INT.C: 13: PORTA &= ~(1 << 4);
		BCR 	STATUS,5 		//01B7 	1283
		BCR 	5H,4 			//01B8 	1205

		//;INT.C: 15: TRISA |= (1 << 4);
		BSR 	STATUS,5 		//01B9 	1A83
		BSR 	5H,4 			//01BA 	1A05
		RET		 					//01BB 	0004

		//;BUZZ.C: 25: PORTA |= 0B00000100;
		BSR 	5H,2 			//01BC 	1905

		//;BUZZ.C: 26: TRISA &= ~0B00000100;
		BSR 	STATUS,5 		//01BD 	1A83
		BCR 	5H,2 			//01BE 	1105

		//;BUZZ.C: 28: WPUA &= ~0B00000100;
		BCR 	15H,2 			//01BF 	1115
		RET		 					//01C0 	0004

		//;TASK.C: 28: REGISTER_Task();
		LCALL 	1D6H 			//01C1 	31D6

		//;TASK.C: 42: RC_STANDBY_Close();
		LCALL 	1D0H 			//01C2 	31D0

		//;TASK.C: 43: Ready_Control(0);
		LDWI 	0H 			//01C3 	2A00
		LJUMP 	151H 			//01C4 	3951

		//;REGISTER.C: 46: PORTA &= ~(1 << 0);
		BCR 	5H,0 			//01C5 	1005

		//;REGISTER.C: 47: TRISA &= ~(1 << 0);
		BSR 	STATUS,5 		//01C6 	1A83
		BCR 	5H,0 			//01C7 	1005
		RET		 					//01C8 	0004

		//;BUZZ.C: 12: TRISA |= 0B00000100;
		BSR 	STATUS,5 		//01C9 	1A83
		BSR 	5H,2 			//01CA 	1905

		//;BUZZ.C: 14: WPUA |= 0B00000100;
		BSR 	15H,2 			//01CB 	1915
		RET		 					//01CC 	0004

		//;REGISTER.C: 35: TRISA |= (1 << 0);
		BSR 	STATUS,5 		//01CD 	1A83
		BSR 	5H,0 			//01CE 	1805
		RET		 					//01CF 	0004

		//;SBY.C: 59: TRISA |= (1 << 1);
		BSR 	STATUS,5 		//01D0 	1A83
		BSR 	5H,1 			//01D1 	1885
		RET		 					//01D2 	0004

		//;RC.C: 13: TRISA |= (1 << 5);
		BSR 	STATUS,5 		//01D3 	1A83
		BSR 	5H,5 			//01D4 	1A85
		RET		 					//01D5 	0004

		//;REGISTER.C: 98: SYS.RES_Change = High_Register;
		CLRR 	41H 			//01D6 	0141

		//;REGISTER.C: 99: REGISTER_Control();
		LJUMP 	10EH 			//01D7 	390E
		RET		 					//01D8 	0004
		RET		 					//01D9 	0004
		RET		 					//01DA 	0004
			END
