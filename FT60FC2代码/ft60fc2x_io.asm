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
		_PA4		EQU		05H
		_PA5		EQU		05H
		_T0IF		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_current_output		EQU		7CH
		_last_state		EQU		44H
		_current_output_state		EQU		45H
		_TaskCompany.Run		EQU		20H
		_TaskCompany.Timer		EQU		21H
		_TaskCompany.IvtTime		EQU		23H
		_TaskCompany.TaskHook		EQU		25H
		_TaskCompany		EQU		20H
//		Task_Process@i		EQU		49H
//		___bmul@multiplier		EQU		48H
//		___bmul@product		EQU		47H
//		___bmul@multiplier		EQU		48H
//		___bmul@multiplicand		EQU		46H
//		___bmul@multiplier		EQU		48H
//		Timer0_Task@Long_Ready_Time		EQU		42H
//		SBY_Control@target		EQU		46H
//		REGISTER_Control@target		EQU		46H
//		READY_Task@state		EQU		7BH
//		READY_Task@counter		EQU		79H
//		Ready_Control@on		EQU		46H
//		Ready_Control@on		EQU		46H
//		Ready_Control@on		EQU		46H
//		DelayMs@Time		EQU		48H
//		DelayMs@b		EQU		4AH
//		DelayMs@a		EQU		49H
//		DelayMs@Time		EQU		48H
//		DelayMs@Time		EQU		48H
//		DelayUs@Time		EQU		46H
//		DelayUs@a		EQU		47H
//		DelayUs@Time		EQU		46H
//		DelayUs@Time		EQU		46H
//		ISR@i		EQU		78H
//		i1___bmul@multiplier		EQU		71H
//		i1___bmul@product		EQU		72H
//		i1___bmul@multiplier		EQU		71H
//		i1___bmul@multiplicand		EQU		70H
//		i1___bmul@multiplier		EQU		71H
//-----------------------Variable END---------------------------------

		LJUMP 	0CH 			//0000 	380C
		LJUMP 	FFH 			//0001 	38FF
		LJUMP 	101H 			//0002 	3901
		LJUMP 	103H 			//0003 	3903
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
		LDWI 	1H 			//0010 	2A01
		STR 	7EH 			//0011 	01FE
		LDWI 	2EH 			//0012 	2A2E
		STR 	7FH 			//0013 	01FF
		LDWI 	20H 			//0014 	2A20
		STR 	FSR 			//0015 	0184
		LCALL 	185H 			//0016 	3185
		LDWI 	38H 			//0017 	2A38
		STR 	FSR 			//0018 	0184
		LDWI 	46H 			//0019 	2A46
		LCALL 	1DCH 			//001A 	31DC
		LDWI 	79H 			//001B 	2A79
		STR 	FSR 			//001C 	0184
		LDWI 	7DH 			//001D 	2A7D
		LCALL 	1DCH 			//001E 	31DC
		CLRR 	STATUS 			//001F 	0103
		LJUMP 	226H 			//0020 	3A26
		STR 	7FH 			//0021 	01FF
		LDWI 	0H 			//0022 	2A00
		STR 	PCLATH 			//0023 	018A
		LDR 	7FH,0 			//0024 	087F
		ADDWR 	PCL,1 			//0025 	0B82
		LJUMP 	26H 			//0026 	3826
		LJUMP 	23DH 			//0027 	3A3D
		LJUMP 	1ECH 			//0028 	39EC
		LJUMP 	23CH 			//0029 	3A3C
		LJUMP 	23BH 			//002A 	3A3B

		//;Main.C: 26: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//002B 	168B
		BTSS 	INTCON,2 		//002C 	1D0B
		LJUMP 	86H 			//002D 	3886

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
		LCALL 	1ACH 			//0036 	31AC
		ADDWI 	21H 			//0037 	2721
		STR 	FSR 			//0038 	0184
		BCR 	STATUS,7 		//0039 	1383
		LDR 	INDF,0 			//003A 	0800
		STR 	73H 			//003B 	01F3
		INCR	FSR,1 			//003C 	0984
		LDR 	INDF,0 			//003D 	0800
		STR 	74H 			//003E 	01F4
		IORWR 	73H,0 			//003F 	0373
		BTSC 	STATUS,2 		//0040 	1503
		LJUMP 	81H 			//0041 	3881

		//;Main.C: 36: {
		//;Main.C: 37: TaskCompany[i].Timer--;
		LDWI 	6H 			//0042 	2A06
		STR 	70H 			//0043 	01F0
		LDR 	78H,0 			//0044 	0878
		LCALL 	1ACH 			//0045 	31AC
		ADDWI 	21H 			//0046 	2721
		STR 	FSR 			//0047 	0184
		LDWI 	1H 			//0048 	2A01
		BCR 	STATUS,7 		//0049 	1383
		SUBWR 	INDF,1 		//004A 	0C80
		INCRSZ 	FSR,1 		//004B 	0A84
		LDWI 	0H 			//004C 	2A00
		BTSS 	STATUS,0 		//004D 	1C03
		DECR 	INDF,1 			//004E 	0D80
		SUBWR 	INDF,1 		//004F 	0C80
		LDWI 	6H 			//0050 	2A06
		DECR 	FSR,1 			//0051 	0D84

		//;Main.C: 38: if(TaskCompany[i].Timer <= 0)
		STR 	70H 			//0052 	01F0
		LDR 	78H,0 			//0053 	0878
		LCALL 	1ACH 			//0054 	31AC
		ADDWI 	21H 			//0055 	2721
		STR 	FSR 			//0056 	0184
		BCR 	STATUS,7 		//0057 	1383
		LDR 	INDF,0 			//0058 	0800
		STR 	73H 			//0059 	01F3
		INCR	FSR,1 			//005A 	0984
		LDR 	INDF,0 			//005B 	0800
		STR 	74H 			//005C 	01F4
		IORWR 	73H,0 			//005D 	0373
		BTSS 	STATUS,2 		//005E 	1D03
		LJUMP 	81H 			//005F 	3881

		//;Main.C: 39: {
		//;Main.C: 40: TaskCompany[i].Timer = TaskCompany[i].IvtTime;
		LDWI 	6H 			//0060 	2A06
		STR 	70H 			//0061 	01F0
		LDR 	78H,0 			//0062 	0878
		LCALL 	1ACH 			//0063 	31AC
		ADDWI 	23H 			//0064 	2723
		STR 	FSR 			//0065 	0184
		BCR 	STATUS,7 		//0066 	1383
		LDR 	INDF,0 			//0067 	0800
		STR 	73H 			//0068 	01F3
		INCR	FSR,1 			//0069 	0984
		LDR 	INDF,0 			//006A 	0800
		STR 	74H 			//006B 	01F4
		LDWI 	6H 			//006C 	2A06
		STR 	70H 			//006D 	01F0
		LDR 	78H,0 			//006E 	0878
		LCALL 	1ACH 			//006F 	31AC
		ADDWI 	21H 			//0070 	2721
		STR 	FSR 			//0071 	0184
		LDR 	73H,0 			//0072 	0873
		BCR 	STATUS,7 		//0073 	1383
		STR 	INDF 			//0074 	0180
		INCR	FSR,1 			//0075 	0984
		LDR 	74H,0 			//0076 	0874
		STR 	INDF 			//0077 	0180

		//;Main.C: 41: TaskCompany[i].Run = 1;
		LDWI 	6H 			//0078 	2A06
		STR 	70H 			//0079 	01F0
		LDR 	78H,0 			//007A 	0878
		LCALL 	1ACH 			//007B 	31AC
		ADDWI 	20H 			//007C 	2720
		STR 	FSR 			//007D 	0184
		BCR 	STATUS,7 		//007E 	1383
		CLRR 	INDF 			//007F 	0100
		INCR	INDF,1 			//0080 	0980
		LDWI 	4H 			//0081 	2A04
		INCR	78H,1 			//0082 	09F8
		SUBWR 	78H,0 			//0083 	0C78
		BTSS 	STATUS,0 		//0084 	1C03
		LJUMP 	33H 			//0085 	3833
		LDR 	77H,0 			//0086 	0877
		STR 	PCLATH 			//0087 	018A
		LDR 	76H,0 			//0088 	0876
		STR 	FSR 			//0089 	0184
		SWAPR 	75H,0 			//008A 	0775
		STR 	STATUS 			//008B 	0183
		SWAPR 	7EH,1 			//008C 	07FE
		SWAPR 	7EH,0 			//008D 	077E
		RETI		 			//008E 	0009

		//;READY.C: 53: static TaskState_t state = ST_PRE_ON;
		//;READY.C: 54: static uint16_t counter = 0;
		//;READY.C: 56: if (!SYS.Standby_Work_State) {
		LDR 	38H,0 			//008F 	0838
		BTSS 	STATUS,2 		//0090 	1D03
		LJUMP 	94H 			//0091 	3894

		//;READY.C: 57: state = ST_PRE_ON;
		//;READY.C: 58: counter = 0;
		LCALL 	D3H 			//0092 	30D3

		//;READY.C: 59: Ready_Control(0);
		LJUMP 	1BAH 			//0093 	39BA

		//;READY.C: 61: }
		//;READY.C: 63: counter++;
		INCR	79H,1 			//0094 	09F9
		BTSC 	STATUS,2 		//0095 	1503
		INCR	7AH,1 			//0096 	09FA

		//;READY.C: 102: break;
		//;READY.C: 65: switch (state) {
		LDR 	7BH,0 			//0097 	087B
		STR 	FSR 			//0098 	0184
		LDWI 	4H 			//0099 	2A04
		SUBWR 	FSR,0 			//009A 	0C04
		BTSC 	STATUS,0 		//009B 	1403
		LJUMP 	CDH 			//009C 	38CD
		LDWI 	2H 			//009D 	2A02
		STR 	PCLATH 			//009E 	018A
		LDWI 	1EH 			//009F 	2A1E
		ADDWR 	FSR,0 			//00A0 	0B04
		STR 	PCL 			//00A1 	0182
		RET		 					//00A2 	0004

		//;READY.C: 67: Ready_Control(1);
		LDWI 	1H 			//00A3 	2A01
		LCALL 	1BAH 			//00A4 	31BA

		//;READY.C: 68: if (counter >= 600) {
		LDWI 	2H 			//00A5 	2A02
		SUBWR 	7AH,0 			//00A6 	0C7A
		LDWI 	58H 			//00A7 	2A58
		BTSC 	STATUS,2 		//00A8 	1503
		SUBWR 	79H,0 			//00A9 	0C79
		BTSS 	STATUS,0 		//00AA 	1C03
		RET		 					//00AB 	0004

		//;READY.C: 69: counter = 0;
		CLRR 	79H 			//00AC 	0179
		CLRR 	7AH 			//00AD 	017A

		//;READY.C: 70: state = ST_OFF;
		CLRR 	7BH 			//00AE 	017B
		INCR	7BH,1 			//00AF 	09FB
		RET		 					//00B0 	0004

		//;READY.C: 75: Ready_Control(0);
		LDWI 	0H 			//00B1 	2A00
		LCALL 	1BAH 			//00B2 	31BA

		//;READY.C: 76: if (counter >= 20) {
		LDWI 	0H 			//00B3 	2A00
		SUBWR 	7AH,0 			//00B4 	0C7A
		LDWI 	14H 			//00B5 	2A14
		BTSC 	STATUS,2 		//00B6 	1503
		SUBWR 	79H,0 			//00B7 	0C79
		BTSS 	STATUS,0 		//00B8 	1C03
		RET		 					//00B9 	0004
		LDWI 	2H 			//00BA 	2A02

		//;READY.C: 77: counter = 0;
		//;READY.C: 78: state = ST_FINAL_ON;
		LJUMP 	CFH 			//00BB 	38CF

		//;READY.C: 83: Ready_Control(1);
		LDWI 	1H 			//00BC 	2A01
		LCALL 	1BAH 			//00BD 	31BA

		//;READY.C: 84: if (counter >= 200) {
		LDWI 	0H 			//00BE 	2A00
		SUBWR 	7AH,0 			//00BF 	0C7A
		LDWI 	C8H 			//00C0 	2AC8
		BTSC 	STATUS,2 		//00C1 	1503
		SUBWR 	79H,0 			//00C2 	0C79
		BTSS 	STATUS,0 		//00C3 	1C03
		RET		 					//00C4 	0004
		LDWI 	3H 			//00C5 	2A03

		//;READY.C: 85: counter = 0;
		//;READY.C: 86: state = ST_DETECT;
		LJUMP 	CFH 			//00C6 	38CF
		LDWI 	90H 			//00C7 	2A90

		//;READY.C: 93: state = ST_PRE_ON;
		CLRR 	7BH 			//00C8 	017B

		//;READY.C: 94: counter = 400;
		STR 	79H 			//00C9 	01F9
		LDWI 	1H 			//00CA 	2A01
		STR 	7AH 			//00CB 	01FA

		//;READY.C: 95: break;
		RET		 					//00CC 	0004

		//;READY.C: 99: state = ST_PRE_ON;
		//;READY.C: 100: counter = 0;
		LCALL 	D3H 			//00CD 	30D3

		//;READY.C: 101: Ready_Control(0);
		LJUMP 	1BAH 			//00CE 	39BA
		CLRR 	79H 			//00CF 	0179
		CLRR 	7AH 			//00D0 	017A
		STR 	7BH 			//00D1 	01FB
		RET		 					//00D2 	0004
		LDWI 	0H 			//00D3 	2A00
		CLRR 	7BH 			//00D4 	017B
		CLRR 	79H 			//00D5 	0179
		CLRR 	7AH 			//00D6 	017A
		RET		 					//00D7 	0004

		//;TASK.C: 67: unsigned char i;
		//;TASK.C: 68: for(i = 0;i<TASK_MAX;i++)
		CLRR 	49H 			//00D8 	0149

		//;TASK.C: 69: {
		//;TASK.C: 70: if(TaskCompany[i].Run == 1)
		LDWI 	6H 			//00D9 	2A06
		STR 	46H 			//00DA 	01C6
		LDR 	49H,0 			//00DB 	0849
		LCALL 	190H 			//00DC 	3190
		ADDWI 	20H 			//00DD 	2720
		STR 	FSR 			//00DE 	0184
		BCR 	STATUS,7 		//00DF 	1383
		DECRSZ 	INDF,0 		//00E0 	0E00
		LJUMP 	F3H 			//00E1 	38F3

		//;TASK.C: 71: {
		//;TASK.C: 72: TaskCompany[i].Run = 0;
		LDWI 	6H 			//00E2 	2A06
		STR 	46H 			//00E3 	01C6
		LDR 	49H,0 			//00E4 	0849
		LCALL 	190H 			//00E5 	3190
		ADDWI 	20H 			//00E6 	2720
		STR 	FSR 			//00E7 	0184
		LDWI 	6H 			//00E8 	2A06
		BCR 	STATUS,7 		//00E9 	1383
		CLRR 	INDF 			//00EA 	0100

		//;TASK.C: 73: TaskCompany[i].TaskHook();
		STR 	46H 			//00EB 	01C6
		LDR 	49H,0 			//00EC 	0849
		LCALL 	190H 			//00ED 	3190
		ADDWI 	25H 			//00EE 	2725
		STR 	FSR 			//00EF 	0184
		BCR 	STATUS,7 		//00F0 	1383
		LDR 	INDF,0 			//00F1 	0800
		LCALL 	21H 			//00F2 	3021
		LDWI 	4H 			//00F3 	2A04
		INCR	49H,1 			//00F4 	09C9
		SUBWR 	49H,0 			//00F5 	0C49
		BTSC 	STATUS,0 		//00F6 	1403
		RET		 					//00F7 	0004
		LJUMP 	D9H 			//00F8 	38D9

		//;SBY.C: 91: SBY_State target = SYS.SBY_Value;
		LDR 	40H,0 			//00F9 	0840
		STR 	46H 			//00FA 	01C6

		//;SBY.C: 94: if (target == current_output_state) {
		XORWR 	45H,0 			//00FB 	0445
		BTSC 	STATUS,2 		//00FC 	1503
		RET		 					//00FD 	0004
		LJUMP 	105H 			//00FE 	3905

		//;SBY.C: 101: RC_STANDBY_Close();
		LCALL 	229H 			//00FF 	3229

		//;SBY.C: 102: break;
		LJUMP 	110H 			//0100 	3910

		//;SBY.C: 104: RC_Open();
		LCALL 	216H 			//0101 	3216

		//;SBY.C: 105: break;
		LJUMP 	110H 			//0102 	3910

		//;SBY.C: 107: STANDBY_Open();
		LCALL 	212H 			//0103 	3212

		//;SBY.C: 108: break;
		LJUMP 	110H 			//0104 	3910
		LDR 	46H,0 			//0105 	0846
		STR 	FSR 			//0106 	0184
		LDWI 	3H 			//0107 	2A03
		SUBWR 	FSR,0 			//0108 	0C04
		BTSC 	STATUS,0 		//0109 	1403
		LJUMP 	FFH 			//010A 	38FF
		LDWI 	0H 			//010B 	2A00
		STR 	PCLATH 			//010C 	018A
		LDWI 	1H 			//010D 	2A01
		ADDWR 	FSR,0 			//010E 	0B04
		STR 	PCL 			//010F 	0182

		//;SBY.C: 115: current_output_state = target;
		BCR 	STATUS,5 		//0110 	1283
		LDR 	46H,0 			//0111 	0846
		STR 	45H 			//0112 	01C5
		RET		 					//0113 	0004

		//;POWER.C: 12: OSCCON = 0B01100001;
		LDWI 	61H 			//0114 	2A61
		BSR 	STATUS,5 		//0115 	1A83
		STR 	FH 			//0116 	018F

		//;POWER.C: 13: INTCON = 0;
		CLRR 	INTCON 			//0117 	010B

		//;POWER.C: 14: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0118 	1283
		CLRR 	5H 			//0119 	0105

		//;POWER.C: 15: TRISA = 0B01000000;
		LDWI 	40H 			//011A 	2A40
		BSR 	STATUS,5 		//011B 	1A83
		STR 	5H 			//011C 	0185

		//;POWER.C: 17: PORTC = 0B00000000;
		BCR 	STATUS,5 		//011D 	1283
		CLRR 	7H 			//011E 	0107

		//;POWER.C: 18: TRISC = 0B00000000;
		BSR 	STATUS,5 		//011F 	1A83
		CLRR 	7H 			//0120 	0107

		//;POWER.C: 20: WPUA = 0B01000000;
		STR 	15H 			//0121 	0195

		//;POWER.C: 22: WPUC = 0B00000000;
		CLRR 	13H 			//0122 	0113

		//;POWER.C: 25: OPTION = 0B00001000;
		LDWI 	8H 			//0123 	2A08
		STR 	1H 			//0124 	0181

		//;POWER.C: 26: PSRCA = 0B11111111;
		LDWI 	FFH 			//0125 	2AFF
		STR 	8H 			//0126 	0188

		//;POWER.C: 27: PSRCC = 0B11111111;
		STR 	14H 			//0127 	0194

		//;POWER.C: 28: PSINKA = 0B11111111;
		STR 	17H 			//0128 	0197

		//;POWER.C: 29: PSINKC = 0B11111111;
		STR 	1FH 			//0129 	019F

		//;POWER.C: 31: MSCON = 0B00110000;
		LDWI 	30H 			//012A 	2A30
		BCR 	STATUS,5 		//012B 	1283
		STR 	1BH 			//012C 	019B
		RET		 					//012D 	0004
		RETW 	0H 			//012E 	2100
		RETW 	1H 			//012F 	2101
		RETW 	0H 			//0130 	2100
		RETW 	5H 			//0131 	2105
		RETW 	0H 			//0132 	2100
		RETW 	2H 			//0133 	2102
		RETW 	0H 			//0134 	2100
		RETW 	2H 			//0135 	2102
		RETW 	0H 			//0136 	2100
		RETW 	AH 			//0137 	210A
		RETW 	0H 			//0138 	2100
		RETW 	3H 			//0139 	2103
		RETW 	0H 			//013A 	2100
		RETW 	3H 			//013B 	2103
		RETW 	0H 			//013C 	2100
		RETW 	14H 			//013D 	2114
		RETW 	0H 			//013E 	2100
		RETW 	4H 			//013F 	2104
		RETW 	0H 			//0140 	2100
		RETW 	4H 			//0141 	2104
		RETW 	0H 			//0142 	2100
		RETW 	F4H 			//0143 	21F4
		RETW 	1H 			//0144 	2101
		RETW 	1H 			//0145 	2101

		//;REGISTER.C: 75: Register_State target = SYS.RES_Change;
		LDR 	41H,0 			//0146 	0841
		STR 	46H 			//0147 	01C6

		//;REGISTER.C: 77: if (target == last_state)
		XORWR 	44H,0 			//0148 	0444
		BTSC 	STATUS,2 		//0149 	1503
		RET		 					//014A 	0004
		LJUMP 	150H 			//014B 	3950
		LCALL 	22CH 			//014C 	322C
		LJUMP 	158H 			//014D 	3958
		LCALL 	21AH 			//014E 	321A
		LJUMP 	158H 			//014F 	3958
		LDR 	46H,0 			//0150 	0846
		XORWI 	0H 			//0151 	2600
		BTSC 	STATUS,2 		//0152 	1503
		LJUMP 	14CH 			//0153 	394C
		XORWI 	1H 			//0154 	2601
		BTSC 	STATUS,2 		//0155 	1503
		LJUMP 	14EH 			//0156 	394E
		LJUMP 	158H 			//0157 	3958

		//;REGISTER.C: 86: last_state = target;
		BCR 	STATUS,5 		//0158 	1283
		LDR 	46H,0 			//0159 	0846
		STR 	44H 			//015A 	01C4
		RET		 					//015B 	0004

		//;Timer.C: 22: static uint16_t Long_Ready_Time = 0;
		//;Timer.C: 24: if(SYS.Standby_Work_State == 1)
		DECRSZ 	38H,0 		//015C 	0E38
		LJUMP 	16DH 			//015D 	396D

		//;Timer.C: 25: {
		//;Timer.C: 26: Long_Ready_Time++;
		INCR	42H,1 			//015E 	09C2
		BTSC 	STATUS,2 		//015F 	1503
		INCR	43H,1 			//0160 	09C3

		//;Timer.C: 28: if(Long_Ready_Time>=4000)
		LDWI 	FH 			//0161 	2A0F
		SUBWR 	43H,0 			//0162 	0C43
		LDWI 	A0H 			//0163 	2AA0
		BTSC 	STATUS,2 		//0164 	1503
		SUBWR 	42H,0 			//0165 	0C42
		BTSS 	STATUS,0 		//0166 	1C03
		RET		 					//0167 	0004

		//;Timer.C: 29: {
		//;Timer.C: 30: Long_Ready_Time = 0;
		CLRR 	42H 			//0168 	0142
		CLRR 	43H 			//0169 	0143

		//;Timer.C: 31: SYS.Long_Time_Change = 1;
		CLRR 	3DH 			//016A 	013D
		INCR	3DH,1 			//016B 	09BD
		RET		 					//016C 	0004

		//;Timer.C: 35: else
		//;Timer.C: 36: {
		//;Timer.C: 37: SYS.Long_Time_Change = 0;
		CLRR 	3DH 			//016D 	013D

		//;Timer.C: 38: Long_Ready_Time = 0;
		CLRR 	42H 			//016E 	0142
		CLRR 	43H 			//016F 	0143
		RET		 					//0170 	0004
		STR 	48H 			//0171 	01C8

		//;Delay.C: 24: unsigned char a,b;
		//;Delay.C: 25: for(a=0;a<Time;a++)
		CLRR 	49H 			//0172 	0149
		LDR 	48H,0 			//0173 	0848
		SUBWR 	49H,0 			//0174 	0C49
		BTSC 	STATUS,0 		//0175 	1403
		RET		 					//0176 	0004

		//;Delay.C: 26: {
		//;Delay.C: 27: for(b=0;b<5;b++)
		CLRR 	4AH 			//0177 	014A

		//;Delay.C: 28: {
		//;Delay.C: 29: DelayUs(197);
		LDWI 	C5H 			//0178 	2AC5
		LCALL 	1D2H 			//0179 	31D2
		LDWI 	5H 			//017A 	2A05
		INCR	4AH,1 			//017B 	09CA
		SUBWR 	4AH,0 			//017C 	0C4A
		BTSS 	STATUS,0 		//017D 	1C03
		LJUMP 	178H 			//017E 	3978
		INCR	49H,1 			//017F 	09C9
		LJUMP 	173H 			//0180 	3973
		LDR 	7EH,0 			//0181 	087E
		STR 	PCLATH 			//0182 	018A
		LDR 	7FH,0 			//0183 	087F
		STR 	PCL 			//0184 	0182
		LCALL 	181H 			//0185 	3181
		STR 	INDF 			//0186 	0180
		INCR	FSR,1 			//0187 	0984
		LDR 	FSR,0 			//0188 	0804
		XORWR 	7DH,0 			//0189 	047D
		BTSC 	STATUS,2 		//018A 	1503
		RETW 	0H 			//018B 	2100
		INCR	7FH,1 			//018C 	09FF
		BTSC 	STATUS,2 		//018D 	1503
		INCR	7EH,1 			//018E 	09FE
		LJUMP 	185H 			//018F 	3985
		STR 	48H 			//0190 	01C8
		CLRR 	47H 			//0191 	0147
		LDR 	46H,0 			//0192 	0846
		BTSC 	48H,0 			//0193 	1448
		ADDWR 	47H,1 			//0194 	0BC7
		BCR 	STATUS,0 		//0195 	1003
		RLR 	46H,1 			//0196 	05C6
		BCR 	STATUS,0 		//0197 	1003
		RRR	48H,1 			//0198 	06C8
		LDR 	48H,0 			//0199 	0848
		BTSS 	STATUS,2 		//019A 	1D03
		LJUMP 	192H 			//019B 	3992
		LDR 	47H,0 			//019C 	0847
		RET		 					//019D 	0004

		//;SBY.C: 69: if(SYS.RC_Value)
		LDR 	39H,0 			//019E 	0839
		BTSC 	STATUS,2 		//019F 	1503
		LJUMP 	1A4H 			//01A0 	39A4

		//;SBY.C: 70: {
		//;SBY.C: 71: SYS.SBY_Value = RC_led_Open;
		CLRR 	40H 			//01A1 	0140
		INCR	40H,1 			//01A2 	09C0

		//;SBY.C: 72: }
		RET		 					//01A3 	0004

		//;SBY.C: 73: else if(SYS.STANDBY_Value)
		LDR 	3CH,0 			//01A4 	083C
		BTSC 	STATUS,2 		//01A5 	1503
		LJUMP 	1AAH 			//01A6 	39AA

		//;SBY.C: 74: {
		//;SBY.C: 75: SYS.SBY_Value = STANDBY_led_Open;
		LDWI 	2H 			//01A7 	2A02
		STR 	40H 			//01A8 	01C0

		//;SBY.C: 76: }
		RET		 					//01A9 	0004

		//;SBY.C: 77: else
		//;SBY.C: 78: {
		//;SBY.C: 79: SYS.SBY_Value = RC_ST_led_Close;
		CLRR 	40H 			//01AA 	0140
		RET		 					//01AB 	0004
		STR 	71H 			//01AC 	01F1
		CLRR 	72H 			//01AD 	0172
		LDR 	70H,0 			//01AE 	0870
		BTSC 	71H,0 			//01AF 	1471
		ADDWR 	72H,1 			//01B0 	0BF2
		BCR 	STATUS,0 		//01B1 	1003
		RLR 	70H,1 			//01B2 	05F0
		BCR 	STATUS,0 		//01B3 	1003
		RRR	71H,1 			//01B4 	06F1
		LDR 	71H,0 			//01B5 	0871
		BTSS 	STATUS,2 		//01B6 	1D03
		LJUMP 	1AEH 			//01B7 	39AE
		LDR 	72H,0 			//01B8 	0872
		RET		 					//01B9 	0004
		STR 	46H 			//01BA 	01C6

		//;READY.C: 30: if (on == current_output) {
		XORWR 	7CH,0 			//01BB 	047C
		BTSC 	STATUS,2 		//01BC 	1503
		RET		 					//01BD 	0004

		//;READY.C: 32: }
		//;READY.C: 35: if (on) {
		LDR 	46H,0 			//01BE 	0846
		BTSC 	STATUS,2 		//01BF 	1503
		LJUMP 	1C3H 			//01C0 	39C3

		//;READY.C: 36: PORTC |= (1 << 5);
		BSR 	7H,5 			//01C1 	1A87

		//;READY.C: 37: } else {
		LJUMP 	1C4H 			//01C2 	39C4

		//;READY.C: 38: PORTC &= ~(1 << 5);
		BCR 	7H,5 			//01C3 	1287

		//;READY.C: 39: }
		//;READY.C: 41: current_output = on;
		LDR 	46H,0 			//01C4 	0846
		STR 	7CH 			//01C5 	01FC
		RET		 					//01C6 	0004

		//;APP.C: 13: DelayMs(20);
		LDWI 	14H 			//01C7 	2A14
		LCALL 	171H 			//01C8 	3171

		//;APP.C: 14: POWER_INITIAL();
		LCALL 	114H 			//01C9 	3114

		//;APP.C: 15: RC_Init();
		LCALL 	232H 			//01CA 	3232

		//;APP.C: 16: INT_Init();
		LCALL 	239H 			//01CB 	3239

		//;APP.C: 17: SBY_Init();
		LCALL 	203H 			//01CC 	3203

		//;APP.C: 18: Ready_Init();
		LCALL 	208H 			//01CD 	3208

		//;APP.C: 19: REGISTER_Init();
		LCALL 	20DH 			//01CE 	320D

		//;APP.C: 22: T0IE = 1;
		BSR 	INTCON,5 		//01CF 	1A8B

		//;APP.C: 24: GIE = 1;
		BSR 	INTCON,7 		//01D0 	1B8B
		RET		 					//01D1 	0004
		STR 	46H 			//01D2 	01C6

		//;Delay.C: 10: unsigned char a;
		//;Delay.C: 11: for(a=0;a<Time;a++)
		CLRR 	47H 			//01D3 	0147
		LDR 	46H,0 			//01D4 	0846
		SUBWR 	47H,0 			//01D5 	0C47
		BTSC 	STATUS,0 		//01D6 	1403
		RET		 					//01D7 	0004

		//;Delay.C: 12: {
		//;Delay.C: 13: __nop();
		NOP		 					//01D8 	0000
		BCR 	STATUS,5 		//01D9 	1283
		INCR	47H,1 			//01DA 	09C7
		LJUMP 	1D4H 			//01DB 	39D4
		CLRWDT	 			//01DC 	0001
		CLRR 	INDF 			//01DD 	0100
		INCR	FSR,1 			//01DE 	0984
		XORWR 	FSR,0 			//01DF 	0404
		BTSC 	STATUS,2 		//01E0 	1503
		RETW 	0H 			//01E1 	2100
		XORWR 	FSR,0 			//01E2 	0404
		LJUMP 	1DDH 			//01E3 	39DD

		//;REGISTER.C: 57: if(!SYS.Standby_Work_State)
		LDR 	38H,0 			//01E4 	0838
		BTSS 	STATUS,2 		//01E5 	1D03
		LJUMP 	1E9H 			//01E6 	39E9

		//;REGISTER.C: 58: {
		//;REGISTER.C: 59: SYS.RES_Change = High_Register;
		CLRR 	41H 			//01E7 	0141

		//;REGISTER.C: 60: }
		RET		 					//01E8 	0004

		//;REGISTER.C: 61: else
		//;REGISTER.C: 62: {
		//;REGISTER.C: 63: SYS.RES_Change = Low_Register;
		CLRR 	41H 			//01E9 	0141
		INCR	41H,1 			//01EA 	09C1
		RET		 					//01EB 	0004

		//;TASK.C: 20: RC_Task();
		LCALL 	23EH 			//01EC 	323E

		//;TASK.C: 21: INT_Task();
		LCALL 	23FH 			//01ED 	323F

		//;TASK.C: 22: BUZZTT_Task();
		LCALL 	240H 			//01EE 	3240

		//;TASK.C: 23: SBY_Task();
		LCALL 	235H 			//01EF 	3235

		//;TASK.C: 24: READY_Task();
		LCALL 	8FH 			//01F0 	308F

		//;TASK.C: 25: Timer0_Task();
		LCALL 	15CH 			//01F1 	315C

		//;TASK.C: 26: REGISTER_Task();
		LJUMP 	237H 			//01F2 	3A37

		//;BUZZ.C: 36: if(SYS.RC_Value||SYS.INT_Value)
		LDR 	39H,0 			//01F3 	0839
		BTSC 	STATUS,2 		//01F4 	1503
		LDR 	3AH,0 			//01F5 	083A
		BTSC 	STATUS,2 		//01F6 	1503
		RET		 					//01F7 	0004

		//;BUZZ.C: 37: {
		//;BUZZ.C: 38: Hummer_Task();
		LJUMP 	222H 			//01F8 	3A22

		//;RC.C: 21: SYS.RC_Value = PA5;
		LDWI 	0H 			//01F9 	2A00
		BTSC 	5H,5 			//01FA 	1685
		LDWI 	1H 			//01FB 	2A01
		STR 	39H 			//01FC 	01B9
		RET		 					//01FD 	0004

		//;INT.C: 23: SYS.INT_Value = PA4;
		LDWI 	0H 			//01FE 	2A00
		BTSC 	5H,4 			//01FF 	1605
		LDWI 	1H 			//0200 	2A01
		STR 	3AH 			//0201 	01BA
		RET		 					//0202 	0004

		//;SBY.C: 16: TRISA &= ~(1 << 2);
		BCR 	5H,2 			//0203 	1105

		//;SBY.C: 19: TRISA |= (1 << 2);
		BSR 	5H,2 			//0204 	1905

		//;SBY.C: 22: current_output_state = RC_ST_led_Close;
		BCR 	STATUS,5 		//0205 	1283
		CLRR 	45H 			//0206 	0145
		RET		 					//0207 	0004

		//;READY.C: 14: PORTC &= ~(1 << 5);
		BCR 	7H,5 			//0208 	1287

		//;READY.C: 16: TRISC &= ~(1 << 5);
		BSR 	STATUS,5 		//0209 	1A83
		BCR 	7H,5 			//020A 	1287

		//;READY.C: 19: current_output = 0;
		CLRR 	7CH 			//020B 	017C
		RET		 					//020C 	0004

		//;REGISTER.C: 20: TRISA &= ~(1 << 0);
		BCR 	5H,0 			//020D 	1005

		//;REGISTER.C: 22: TRISA |= (1 << 0);
		BSR 	5H,0 			//020E 	1805

		//;REGISTER.C: 24: last_state = High_Register;
		BCR 	STATUS,5 		//020F 	1283
		CLRR 	44H 			//0210 	0144
		RET		 					//0211 	0004

		//;SBY.C: 47: TRISA |= (1 << 2);
		BSR 	STATUS,5 		//0212 	1A83
		BSR 	5H,2 			//0213 	1905

		//;SBY.C: 48: TRISA &= ~(1 << 2);
		BCR 	5H,2 			//0214 	1105
		RET		 					//0215 	0004

		//;SBY.C: 34: TRISA &= ~(1 << 2);
		BSR 	STATUS,5 		//0216 	1A83
		BCR 	5H,2 			//0217 	1105

		//;SBY.C: 35: TRISA &= ~(1 << 2);
		BCR 	5H,2 			//0218 	1105
		RET		 					//0219 	0004

		//;REGISTER.C: 46: TRISA &= ~(1 << 0);
		BSR 	STATUS,5 		//021A 	1A83
		BCR 	5H,0 			//021B 	1005

		//;REGISTER.C: 47: TRISA &= ~(1 << 0);
		BCR 	5H,0 			//021C 	1005
		RET		 					//021D 	0004
		LJUMP 	A3H 			//021E 	38A3
		LJUMP 	B1H 			//021F 	38B1
		LJUMP 	BCH 			//0220 	38BC
		LJUMP 	C7H 			//0221 	38C7

		//;BUZZ.C: 120: Hummer_Init();
		LCALL 	22FH 			//0222 	322F

		//;BUZZ.C: 121: PA2 = 0;
		BCR 	STATUS,5 		//0223 	1283
		BCR 	5H,2 			//0224 	1105
		RET		 					//0225 	0004

		//;Main.C: 55: Initial();
		LCALL 	1C7H 			//0226 	31C7

		//;Main.C: 57: {
		//;Main.C: 58: Task_Process();
		LCALL 	D8H 			//0227 	30D8
		LJUMP 	227H 			//0228 	3A27

		//;SBY.C: 59: TRISA |= (1 << 2);
		BSR 	STATUS,5 		//0229 	1A83
		BSR 	5H,2 			//022A 	1905
		RET		 					//022B 	0004

		//;REGISTER.C: 35: TRISA |= (1 << 0);
		BSR 	STATUS,5 		//022C 	1A83
		BSR 	5H,0 			//022D 	1805
		RET		 					//022E 	0004

		//;BUZZ.C: 25: TRISA &= ~0B00000100;
		BSR 	STATUS,5 		//022F 	1A83
		BCR 	5H,2 			//0230 	1105
		RET		 					//0231 	0004

		//;RC.C: 11: TRISA |= 0B00100000;
		BSR 	STATUS,5 		//0232 	1A83
		BSR 	5H,5 			//0233 	1A85
		RET		 					//0234 	0004

		//;SBY.C: 127: SBY_Detect();
		LCALL 	19EH 			//0235 	319E

		//;SBY.C: 128: SBY_Control();
		LJUMP 	F9H 			//0236 	38F9

		//;REGISTER.C: 96: REGISTER_Detect();
		LCALL 	1E4H 			//0237 	31E4

		//;REGISTER.C: 97: REGISTER_Control();
		LJUMP 	146H 			//0238 	3946

		//;INT.C: 13: TRISA |= 0B00010000;
		BSR 	5H,4 			//0239 	1A05
		RET		 					//023A 	0004
		RET		 					//023B 	0004
		RET		 					//023C 	0004
		RET		 					//023D 	0004

		//;RC.C: 31: RC_Read();
		LJUMP 	1F9H 			//023E 	39F9

		//;INT.C: 33: INT_Read();
		LJUMP 	1FEH 			//023F 	39FE

		//;BUZZ.C: 132: BUZZHH_Control();
		LJUMP 	1F3H 			//0240 	39F3
			END
