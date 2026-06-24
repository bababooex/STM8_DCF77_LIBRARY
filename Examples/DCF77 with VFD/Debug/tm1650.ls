   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.5 - 22 May 2025
  14                     .const:	section	.text
  15  0000               L7_tm1650_Digit_Table:
  16  0000 3f            	dc.b	63
  17  0001 06            	dc.b	6
  18  0002 5b            	dc.b	91
  19  0003 4f            	dc.b	79
  20  0004 66            	dc.b	102
  21  0005 6d            	dc.b	109
  22  0006 7d            	dc.b	125
  23  0007 07            	dc.b	7
  24  0008 7f            	dc.b	127
  25  0009 6f            	dc.b	111
  26  000a 77            	dc.b	119
  27  000b 7c            	dc.b	124
  28  000c 39            	dc.b	57
  29  000d 5e            	dc.b	94
  30  000e 79            	dc.b	121
  31  000f 71            	dc.b	113
  32  0010 00            	dc.b	0
  92                     ; 26 static void tm1650_i2c_write(uint8_t reg, uint8_t data)
  92                     ; 27 {
  94                     	switch	.text
  95  0000               L11_tm1650_i2c_write:
  97  0000 89            	pushw	x
  98  0001 88            	push	a
  99       00000001      OFST:	set	1
 102                     ; 29     buf[0] = data;
 104  0002 9f            	ld	a,xl
 105  0003 6b01          	ld	(OFST+0,sp),a
 107                     ; 30     swi2c_write_array(reg, buf, 1);
 109  0005 ae0001        	ldw	x,#1
 110  0008 89            	pushw	x
 111  0009 96            	ldw	x,sp
 112  000a 1c0003        	addw	x,#OFST+2
 113  000d 89            	pushw	x
 114  000e 7b06          	ld	a,(OFST+5,sp)
 115  0010 cd0000        	call	_swi2c_write_array
 117  0013 5b04          	addw	sp,#4
 118                     ; 31 }
 121  0015 5b03          	addw	sp,#3
 122  0017 81            	ret
 160                     ; 33 void TM1650_init(void)
 160                     ; 34 {
 161                     	switch	.text
 162  0018               _TM1650_init:
 164  0018 88            	push	a
 165       00000001      OFST:	set	1
 168                     ; 36     swi2c_init();
 170  0019 cd0000        	call	_swi2c_init
 172                     ; 37     tm1650_i2c_write(TM1650_DISPLAY_BASE, 0x00);
 174  001c ae6e00        	ldw	x,#28160
 175  001f addf          	call	L11_tm1650_i2c_write
 177                     ; 39     for (dig = 0; dig < TM1650_NUM_DIGIT; dig++) {
 179  0021 0f01          	clr	(OFST+0,sp)
 181  0023               L56:
 182                     ; 40         iCtrl[dig] = 0x00;
 184  0023 7b01          	ld	a,(OFST+0,sp)
 185  0025 5f            	clrw	x
 186  0026 97            	ld	xl,a
 187  0027 6f04          	clr	(L3_iCtrl,x)
 188                     ; 41         iData[dig] = 0x00;
 190  0029 7b01          	ld	a,(OFST+0,sp)
 191  002b 5f            	clrw	x
 192  002c 97            	ld	xl,a
 193  002d 6f00          	clr	(L5_iData,x)
 194                     ; 39     for (dig = 0; dig < TM1650_NUM_DIGIT; dig++) {
 196  002f 0c01          	inc	(OFST+0,sp)
 200  0031 7b01          	ld	a,(OFST+0,sp)
 201  0033 a104          	cp	a,#4
 202  0035 25ec          	jrult	L56
 203                     ; 43 }
 206  0037 84            	pop	a
 207  0038 81            	ret
 251                     ; 45 void TM1650_sendControl(uint8_t data, uint8_t segment)
 251                     ; 46 {
 252                     	switch	.text
 253  0039               _TM1650_sendControl:
 255  0039 89            	pushw	x
 256       00000000      OFST:	set	0
 259                     ; 47     segment = segment % TM1650_NUM_DIGIT;
 261  003a 7b02          	ld	a,(OFST+2,sp)
 262  003c a403          	and	a,#3
 263  003e 6b02          	ld	(OFST+2,sp),a
 264                     ; 48     tm1650_i2c_write((uint8_t)(TM1650_CONTROL_BASE + segment), data);
 266  0040 7b01          	ld	a,(OFST+1,sp)
 267  0042 97            	ld	xl,a
 268  0043 7b02          	ld	a,(OFST+2,sp)
 269  0045 ab48          	add	a,#72
 270  0047 95            	ld	xh,a
 271  0048 adb6          	call	L11_tm1650_i2c_write
 273                     ; 49 }
 276  004a 85            	popw	x
 277  004b 81            	ret
 321                     ; 51 void TM1650_sendDigit(uint8_t data, uint8_t segment)
 321                     ; 52 {
 322                     	switch	.text
 323  004c               _TM1650_sendDigit:
 325  004c 89            	pushw	x
 326       00000000      OFST:	set	0
 329                     ; 53     segment = segment % TM1650_NUM_DIGIT;
 331  004d 7b02          	ld	a,(OFST+2,sp)
 332  004f a403          	and	a,#3
 333  0051 6b02          	ld	(OFST+2,sp),a
 334                     ; 54     tm1650_i2c_write((uint8_t)(TM1650_DISPLAY_BASE - segment*2), data);
 336  0053 7b01          	ld	a,(OFST+1,sp)
 337  0055 97            	ld	xl,a
 338  0056 7b02          	ld	a,(OFST+2,sp)
 339  0058 48            	sll	a
 340  0059 a06e          	sub	a,#110
 341  005b 40            	neg	a
 342  005c 95            	ld	xh,a
 343  005d ada1          	call	L11_tm1650_i2c_write
 345                     ; 55 }
 348  005f 85            	popw	x
 349  0060 81            	ret
 385                     ; 57 void TM1650_displayOn(void)
 385                     ; 58 {
 386                     	switch	.text
 387  0061               _TM1650_displayOn:
 389  0061 88            	push	a
 390       00000001      OFST:	set	1
 393                     ; 60     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 395  0062 0f01          	clr	(OFST+0,sp)
 397  0064               L551:
 398                     ; 61         iCtrl[i] = (iCtrl[i] & 0xFE) | 0x01; 
 400  0064 7b01          	ld	a,(OFST+0,sp)
 401  0066 5f            	clrw	x
 402  0067 97            	ld	xl,a
 403  0068 7b01          	ld	a,(OFST+0,sp)
 404  006a 905f          	clrw	y
 405  006c 9097          	ld	yl,a
 406  006e 90e604        	ld	a,(L3_iCtrl,y)
 407  0071 a4fe          	and	a,#254
 408  0073 aa01          	or	a,#1
 409  0075 e704          	ld	(L3_iCtrl,x),a
 410                     ; 62         TM1650_sendControl(iCtrl[i], i);
 412  0077 7b01          	ld	a,(OFST+0,sp)
 413  0079 97            	ld	xl,a
 414  007a 7b01          	ld	a,(OFST+0,sp)
 415  007c 905f          	clrw	y
 416  007e 9097          	ld	yl,a
 417  0080 90e604        	ld	a,(L3_iCtrl,y)
 418  0083 95            	ld	xh,a
 419  0084 adb3          	call	_TM1650_sendControl
 421                     ; 60     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 423  0086 0c01          	inc	(OFST+0,sp)
 427  0088 7b01          	ld	a,(OFST+0,sp)
 428  008a a104          	cp	a,#4
 429  008c 25d6          	jrult	L551
 430                     ; 64 }
 433  008e 84            	pop	a
 434  008f 81            	ret
 470                     ; 66 void TM1650_displayOff(void)
 470                     ; 67 {
 471                     	switch	.text
 472  0090               _TM1650_displayOff:
 474  0090 88            	push	a
 475       00000001      OFST:	set	1
 478                     ; 69     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 480  0091 0f01          	clr	(OFST+0,sp)
 482  0093               L102:
 483                     ; 70         iCtrl[i] = iCtrl[i] & 0xFE;       
 485  0093 7b01          	ld	a,(OFST+0,sp)
 486  0095 5f            	clrw	x
 487  0096 97            	ld	xl,a
 488  0097 e604          	ld	a,(L3_iCtrl,x)
 489  0099 a4fe          	and	a,#254
 490  009b e704          	ld	(L3_iCtrl,x),a
 491                     ; 71         TM1650_sendControl(iCtrl[i], i);
 493  009d 7b01          	ld	a,(OFST+0,sp)
 494  009f 97            	ld	xl,a
 495  00a0 7b01          	ld	a,(OFST+0,sp)
 496  00a2 905f          	clrw	y
 497  00a4 9097          	ld	yl,a
 498  00a6 90e604        	ld	a,(L3_iCtrl,y)
 499  00a9 95            	ld	xh,a
 500  00aa ad8d          	call	_TM1650_sendControl
 502                     ; 69     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 504  00ac 0c01          	inc	(OFST+0,sp)
 508  00ae 7b01          	ld	a,(OFST+0,sp)
 509  00b0 a104          	cp	a,#4
 510  00b2 25df          	jrult	L102
 511                     ; 73 }
 514  00b4 84            	pop	a
 515  00b5 81            	ret
 540                     ; 75 void TM1650_colonOn(void)
 540                     ; 76 {
 541                     	switch	.text
 542  00b6               _TM1650_colonOn:
 546                     ; 77     TM1650_sendControl((iCtrl[0] & 0xF7) | 0x08, 0);
 548  00b6 b604          	ld	a,L3_iCtrl
 549  00b8 a4f7          	and	a,#247
 550  00ba aa08          	or	a,#8
 551  00bc 5f            	clrw	x
 552  00bd 95            	ld	xh,a
 553  00be cd0039        	call	_TM1650_sendControl
 555                     ; 78 }
 558  00c1 81            	ret
 583                     ; 80 void TM1650_colonOff(void)
 583                     ; 81 {
 584                     	switch	.text
 585  00c2               _TM1650_colonOff:
 589                     ; 82     TM1650_sendControl(iCtrl[0] & 0xF7, 0);
 591  00c2 b604          	ld	a,L3_iCtrl
 592  00c4 a4f7          	and	a,#247
 593  00c6 5f            	clrw	x
 594  00c7 95            	ld	xh,a
 595  00c8 cd0039        	call	_TM1650_sendControl
 597                     ; 83 }
 600  00cb 81            	ret
 646                     ; 85 void TM1650_setBrightness(uint8_t b)
 646                     ; 86 {
 647                     	switch	.text
 648  00cc               _TM1650_setBrightness:
 650  00cc 88            	push	a
 651  00cd 88            	push	a
 652       00000001      OFST:	set	1
 655                     ; 88     if (b > 0x07) { b = 0x07; }
 657  00ce a108          	cp	a,#8
 658  00d0 2504          	jrult	L152
 661  00d2 a607          	ld	a,#7
 662  00d4 6b02          	ld	(OFST+1,sp),a
 663  00d6               L152:
 664                     ; 90     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 666  00d6 0f01          	clr	(OFST+0,sp)
 668  00d8               L352:
 669                     ; 91         iCtrl[i] = (iCtrl[i] & 0xFF) | (uint8_t)(b << 4);
 671  00d8 7b01          	ld	a,(OFST+0,sp)
 672  00da 5f            	clrw	x
 673  00db 97            	ld	xl,a
 674  00dc 7b01          	ld	a,(OFST+0,sp)
 675  00de 905f          	clrw	y
 676  00e0 9097          	ld	yl,a
 677  00e2 7b02          	ld	a,(OFST+1,sp)
 678  00e4 4e            	swap	a
 679  00e5 a4f0          	and	a,#240
 680  00e7 90ea04        	or	a,(L3_iCtrl,y)
 681  00ea e704          	ld	(L3_iCtrl,x),a
 682                     ; 92         TM1650_sendControl(iCtrl[i], i);
 684  00ec 7b01          	ld	a,(OFST+0,sp)
 685  00ee 97            	ld	xl,a
 686  00ef 7b01          	ld	a,(OFST+0,sp)
 687  00f1 905f          	clrw	y
 688  00f3 9097          	ld	yl,a
 689  00f5 90e604        	ld	a,(L3_iCtrl,y)
 690  00f8 95            	ld	xh,a
 691  00f9 cd0039        	call	_TM1650_sendControl
 693                     ; 90     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 695  00fc 0c01          	inc	(OFST+0,sp)
 699  00fe 7b01          	ld	a,(OFST+0,sp)
 700  0100 a104          	cp	a,#4
 701  0102 25d4          	jrult	L352
 702                     ; 94 }
 705  0104 85            	popw	x
 706  0105 81            	ret
 743                     ; 96 void TM1650_clearDisplay(void)
 743                     ; 97 {
 744                     	switch	.text
 745  0106               _TM1650_clearDisplay:
 747  0106 88            	push	a
 748       00000001      OFST:	set	1
 751                     ; 99     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 753  0107 0f01          	clr	(OFST+0,sp)
 755  0109               L772:
 756                     ; 100         TM1650_sendDigit(0x00, i);
 758  0109 7b01          	ld	a,(OFST+0,sp)
 759  010b 5f            	clrw	x
 760  010c 97            	ld	xl,a
 761  010d cd004c        	call	_TM1650_sendDigit
 763                     ; 101         iData[i] = 0x00;
 765  0110 7b01          	ld	a,(OFST+0,sp)
 766  0112 5f            	clrw	x
 767  0113 97            	ld	xl,a
 768  0114 6f00          	clr	(L5_iData,x)
 769                     ; 99     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 771  0116 0c01          	inc	(OFST+0,sp)
 775  0118 7b01          	ld	a,(OFST+0,sp)
 776  011a a104          	cp	a,#4
 777  011c 25eb          	jrult	L772
 778                     ; 103 }
 781  011e 84            	pop	a
 782  011f 81            	ret
 826                     ; 105 void TM1650_test(uint8_t pos)
 826                     ; 106 {
 827                     	switch	.text
 828  0120               _TM1650_test:
 830  0120 88            	push	a
 831  0121 88            	push	a
 832       00000001      OFST:	set	1
 835                     ; 108     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 837  0122 0f01          	clr	(OFST+0,sp)
 839  0124               L723:
 840                     ; 109         TM1650_sendDigit((i == pos) ? 0xFF : 0x00, i);
 842  0124 7b01          	ld	a,(OFST+0,sp)
 843  0126 97            	ld	xl,a
 844  0127 89            	pushw	x
 845  0128 7b03          	ld	a,(OFST+2,sp)
 846  012a 1104          	cp	a,(OFST+3,sp)
 847  012c 2604          	jrne	L23
 848  012e a6ff          	ld	a,#255
 849  0130 2001          	jra	L43
 850  0132               L23:
 851  0132 4f            	clr	a
 852  0133               L43:
 853  0133 85            	popw	x
 854  0134 95            	ld	xh,a
 855  0135 cd004c        	call	_TM1650_sendDigit
 857                     ; 108     for (i = 0; i < TM1650_NUM_DIGIT; i++) {
 859  0138 0c01          	inc	(OFST+0,sp)
 863  013a 7b01          	ld	a,(OFST+0,sp)
 864  013c a104          	cp	a,#4
 865  013e 25e4          	jrult	L723
 866                     ; 111 }
 869  0140 85            	popw	x
 870  0141 81            	ret
 925                     ; 113 void TM1650_setDot(uint8_t pos, bool onoff)
 925                     ; 114 {
 926                     	switch	.text
 927  0142               _TM1650_setDot:
 929  0142 89            	pushw	x
 930  0143 88            	push	a
 931       00000001      OFST:	set	1
 934                     ; 116     pos  = pos % TM1650_NUM_DIGIT;
 936  0144 7b02          	ld	a,(OFST+1,sp)
 937  0146 a403          	and	a,#3
 938  0148 6b02          	ld	(OFST+1,sp),a
 939                     ; 117     data = iData[pos];
 941  014a 7b02          	ld	a,(OFST+1,sp)
 942  014c 5f            	clrw	x
 943  014d 97            	ld	xl,a
 944  014e e600          	ld	a,(L5_iData,x)
 945  0150 6b01          	ld	(OFST+0,sp),a
 947                     ; 118     data = onoff ? (data | 0x80) : (data & 0x7F);
 949  0152 7b03          	ld	a,(OFST+2,sp)
 950  0154 a501          	bcp	a,#1
 951  0156 2706          	jreq	L04
 952  0158 7b01          	ld	a,(OFST+0,sp)
 953  015a aa80          	or	a,#128
 954  015c 2004          	jra	L24
 955  015e               L04:
 956  015e 7b01          	ld	a,(OFST+0,sp)
 957  0160 a47f          	and	a,#127
 958  0162               L24:
 959  0162 6b01          	ld	(OFST+0,sp),a
 961                     ; 119     iData[pos] = data;
 963  0164 7b02          	ld	a,(OFST+1,sp)
 964  0166 5f            	clrw	x
 965  0167 97            	ld	xl,a
 966  0168 7b01          	ld	a,(OFST+0,sp)
 967  016a e700          	ld	(L5_iData,x),a
 968                     ; 120     TM1650_sendDigit(data, pos);
 970  016c 7b02          	ld	a,(OFST+1,sp)
 971  016e 97            	ld	xl,a
 972  016f 7b01          	ld	a,(OFST+0,sp)
 973  0171 95            	ld	xh,a
 974  0172 cd004c        	call	_TM1650_sendDigit
 976                     ; 121 }
 979  0175 5b03          	addw	sp,#3
 980  0177 81            	ret
1045                     ; 125 void TM1650_writeNumber(uint16_t num, bool zeroFill)
1045                     ; 126 {
1046                     	switch	.text
1047  0178               _TM1650_writeNumber:
1049  0178 89            	pushw	x
1050  0179 5203          	subw	sp,#3
1051       00000003      OFST:	set	3
1054                     ; 127     uint16_t onum = num;
1056  017b 1f01          	ldw	(OFST-2,sp),x
1058                     ; 131     digit = (uint8_t)(num % 10u);
1060  017d a60a          	ld	a,#10
1061  017f 62            	div	x,a
1062  0180 5f            	clrw	x
1063  0181 97            	ld	xl,a
1064  0182 9f            	ld	a,xl
1065  0183 6b03          	ld	(OFST+0,sp),a
1067                     ; 132     TM1650_sendDigit(tm1650_Digit_Table[digit], 3);
1069  0185 7b03          	ld	a,(OFST+0,sp)
1070  0187 5f            	clrw	x
1071  0188 97            	ld	xl,a
1072  0189 d60000        	ld	a,(L7_tm1650_Digit_Table,x)
1073  018c ae0003        	ldw	x,#3
1074  018f 95            	ld	xh,a
1075  0190 cd004c        	call	_TM1650_sendDigit
1077                     ; 133     iData[3] = digit;
1079  0193 7b03          	ld	a,(OFST+0,sp)
1080  0195 b703          	ld	L5_iData+3,a
1081                     ; 134     num /= 10u;
1083  0197 1e04          	ldw	x,(OFST+1,sp)
1084  0199 a60a          	ld	a,#10
1085  019b 62            	div	x,a
1086  019c 1f04          	ldw	(OFST+1,sp),x
1087                     ; 137     digit = (uint8_t)(num % 10u);
1089  019e 1e04          	ldw	x,(OFST+1,sp)
1090  01a0 a60a          	ld	a,#10
1091  01a2 62            	div	x,a
1092  01a3 5f            	clrw	x
1093  01a4 97            	ld	xl,a
1094  01a5 9f            	ld	a,xl
1095  01a6 6b03          	ld	(OFST+0,sp),a
1097                     ; 138     if (!zeroFill && onum < 10u && digit == 0u) {
1099  01a8 7b08          	ld	a,(OFST+5,sp)
1100  01aa a501          	bcp	a,#1
1101  01ac 2613          	jrne	L514
1103  01ae 1e01          	ldw	x,(OFST-2,sp)
1104  01b0 a3000a        	cpw	x,#10
1105  01b3 240c          	jruge	L514
1107  01b5 0d03          	tnz	(OFST+0,sp)
1108  01b7 2608          	jrne	L514
1109                     ; 139         TM1650_sendDigit(tm1650_Digit_Table[0x10], 2);
1111  01b9 ae0002        	ldw	x,#2
1112  01bc cd004c        	call	_TM1650_sendDigit
1115  01bf 200e          	jra	L714
1116  01c1               L514:
1117                     ; 141         TM1650_sendDigit(tm1650_Digit_Table[digit], 2);
1119  01c1 7b03          	ld	a,(OFST+0,sp)
1120  01c3 5f            	clrw	x
1121  01c4 97            	ld	xl,a
1122  01c5 d60000        	ld	a,(L7_tm1650_Digit_Table,x)
1123  01c8 ae0002        	ldw	x,#2
1124  01cb 95            	ld	xh,a
1125  01cc cd004c        	call	_TM1650_sendDigit
1127  01cf               L714:
1128                     ; 143     iData[2] = digit;
1130  01cf 7b03          	ld	a,(OFST+0,sp)
1131  01d1 b702          	ld	L5_iData+2,a
1132                     ; 144     num /= 10u;
1134  01d3 1e04          	ldw	x,(OFST+1,sp)
1135  01d5 a60a          	ld	a,#10
1136  01d7 62            	div	x,a
1137  01d8 1f04          	ldw	(OFST+1,sp),x
1138                     ; 147     digit = (uint8_t)(num % 10u);
1140  01da 1e04          	ldw	x,(OFST+1,sp)
1141  01dc a60a          	ld	a,#10
1142  01de 62            	div	x,a
1143  01df 5f            	clrw	x
1144  01e0 97            	ld	xl,a
1145  01e1 9f            	ld	a,xl
1146  01e2 6b03          	ld	(OFST+0,sp),a
1148                     ; 148     if (!zeroFill && onum < 100u && digit == 0u) {
1150  01e4 7b08          	ld	a,(OFST+5,sp)
1151  01e6 a501          	bcp	a,#1
1152  01e8 2613          	jrne	L124
1154  01ea 1e01          	ldw	x,(OFST-2,sp)
1155  01ec a30064        	cpw	x,#100
1156  01ef 240c          	jruge	L124
1158  01f1 0d03          	tnz	(OFST+0,sp)
1159  01f3 2608          	jrne	L124
1160                     ; 149         TM1650_sendDigit(tm1650_Digit_Table[0x10], 1);
1162  01f5 ae0001        	ldw	x,#1
1163  01f8 cd004c        	call	_TM1650_sendDigit
1166  01fb 200e          	jra	L324
1167  01fd               L124:
1168                     ; 151         TM1650_sendDigit(tm1650_Digit_Table[digit], 1);
1170  01fd 7b03          	ld	a,(OFST+0,sp)
1171  01ff 5f            	clrw	x
1172  0200 97            	ld	xl,a
1173  0201 d60000        	ld	a,(L7_tm1650_Digit_Table,x)
1174  0204 ae0001        	ldw	x,#1
1175  0207 95            	ld	xh,a
1176  0208 cd004c        	call	_TM1650_sendDigit
1178  020b               L324:
1179                     ; 153     iData[1] = digit;
1181  020b 7b03          	ld	a,(OFST+0,sp)
1182  020d b701          	ld	L5_iData+1,a
1183                     ; 154     num /= 10u;
1185  020f 1e04          	ldw	x,(OFST+1,sp)
1186  0211 a60a          	ld	a,#10
1187  0213 62            	div	x,a
1188  0214 1f04          	ldw	(OFST+1,sp),x
1189                     ; 157     digit = (uint8_t)(num % 10u);
1191  0216 1e04          	ldw	x,(OFST+1,sp)
1192  0218 a60a          	ld	a,#10
1193  021a 62            	div	x,a
1194  021b 5f            	clrw	x
1195  021c 97            	ld	xl,a
1196  021d 9f            	ld	a,xl
1197  021e 6b03          	ld	(OFST+0,sp),a
1199                     ; 158     if (!zeroFill && onum < 1000u && digit == 0u) {
1201  0220 7b08          	ld	a,(OFST+5,sp)
1202  0222 a501          	bcp	a,#1
1203  0224 2611          	jrne	L524
1205  0226 1e01          	ldw	x,(OFST-2,sp)
1206  0228 a303e8        	cpw	x,#1000
1207  022b 240a          	jruge	L524
1209  022d 0d03          	tnz	(OFST+0,sp)
1210  022f 2606          	jrne	L524
1211                     ; 159         TM1650_sendDigit(tm1650_Digit_Table[0x10], 0);
1213  0231 5f            	clrw	x
1214  0232 cd004c        	call	_TM1650_sendDigit
1217  0235 200c          	jra	L724
1218  0237               L524:
1219                     ; 161         TM1650_sendDigit(tm1650_Digit_Table[digit], 0);
1221  0237 7b03          	ld	a,(OFST+0,sp)
1222  0239 5f            	clrw	x
1223  023a 97            	ld	xl,a
1224  023b d60000        	ld	a,(L7_tm1650_Digit_Table,x)
1225  023e 5f            	clrw	x
1226  023f 95            	ld	xh,a
1227  0240 cd004c        	call	_TM1650_sendDigit
1229  0243               L724:
1230                     ; 163     iData[0] = digit;
1232  0243 7b03          	ld	a,(OFST+0,sp)
1233  0245 b700          	ld	L5_iData,a
1234                     ; 164 }
1237  0247 5b05          	addw	sp,#5
1238  0249 81            	ret
1273                     ; 166 void TM1650_writeNum(uint16_t num)
1273                     ; 167 {
1274                     	switch	.text
1275  024a               _TM1650_writeNum:
1279                     ; 168     TM1650_writeNumber(num, (uint8_t)TM1650_ZERO_PREFIX);
1281  024a 4b00          	push	#0
1282  024c cd0178        	call	_TM1650_writeNumber
1284  024f 84            	pop	a
1285                     ; 169 }
1288  0250 81            	ret
1333                     	switch	.ubsct
1334  0000               L5_iData:
1335  0000 00000000      	ds.b	4
1336  0004               L3_iCtrl:
1337  0004 00000000      	ds.b	4
1338                     	xdef	_TM1650_writeNum
1339                     	xdef	_TM1650_test
1340                     	xdef	_TM1650_sendDigit
1341                     	xdef	_TM1650_sendControl
1342                     	xdef	_TM1650_writeNumber
1343                     	xdef	_TM1650_setDot
1344                     	xdef	_TM1650_colonOff
1345                     	xdef	_TM1650_colonOn
1346                     	xdef	_TM1650_setBrightness
1347                     	xdef	_TM1650_clearDisplay
1348                     	xdef	_TM1650_displayOff
1349                     	xdef	_TM1650_displayOn
1350                     	xdef	_TM1650_init
1351                     	xref	_swi2c_write_array
1352                     	xref	_swi2c_init
1372                     	end
