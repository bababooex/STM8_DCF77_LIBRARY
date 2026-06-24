   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  15                     .const:	section	.text
  16  0000               L7_hd1650_Digit_Table:
  17  0000 3f            	dc.b	63
  18  0001 06            	dc.b	6
  19  0002 5b            	dc.b	91
  20  0003 4f            	dc.b	79
  21  0004 66            	dc.b	102
  22  0005 6d            	dc.b	109
  23  0006 7d            	dc.b	125
  24  0007 07            	dc.b	7
  25  0008 7f            	dc.b	127
  26  0009 6f            	dc.b	111
  27  000a 77            	dc.b	119
  28  000b 7c            	dc.b	124
  29  000c 39            	dc.b	57
  30  000d 5e            	dc.b	94
  31  000e 79            	dc.b	121
  32  000f 71            	dc.b	113
  33  0010 00            	dc.b	0
  93                     ; 26 static void hd1650_i2c_write(uint8_t reg, uint8_t data)
  93                     ; 27 {
  95                     .text:	section	.text,new
  96  0000               L11_hd1650_i2c_write:
  98  0000 89            	pushw	x
  99  0001 88            	push	a
 100       00000001      OFST:	set	1
 103                     ; 29     buf[0] = data;
 105  0002 9f            	ld	a,xl
 106  0003 6b01          	ld	(OFST+0,sp),a
 108                     ; 30     swi2c_write_array(reg, buf, 1);
 110  0005 ae0001        	ldw	x,#1
 111  0008 89            	pushw	x
 112  0009 96            	ldw	x,sp
 113  000a 1c0003        	addw	x,#OFST+2
 114  000d 89            	pushw	x
 115  000e 7b06          	ld	a,(OFST+5,sp)
 116  0010 cd0000        	call	_swi2c_write_array
 118  0013 5b04          	addw	sp,#4
 119                     ; 31 }
 122  0015 5b03          	addw	sp,#3
 123  0017 81            	ret
 161                     ; 33 void HD1650_init(void)
 161                     ; 34 {
 162                     .text:	section	.text,new
 163  0000               _HD1650_init:
 165  0000 88            	push	a
 166       00000001      OFST:	set	1
 169                     ; 36     swi2c_init();
 171  0001 cd0000        	call	_swi2c_init
 173                     ; 37     hd1650_i2c_write(HD1650_DISPLAY_BASE, 0x00);
 175  0004 ae6e00        	ldw	x,#28160
 176  0007 cd0000        	call	L11_hd1650_i2c_write
 178                     ; 39     for (dig = 0; dig < HD1650_NUM_DIGIT; dig++) {
 180  000a 0f01          	clr	(OFST+0,sp)
 182  000c               L56:
 183                     ; 40         iCtrl[dig] = 0x00;
 185  000c 7b01          	ld	a,(OFST+0,sp)
 186  000e 5f            	clrw	x
 187  000f 97            	ld	xl,a
 188  0010 6f04          	clr	(L3_iCtrl,x)
 189                     ; 41         iData[dig] = 0x00;
 191  0012 7b01          	ld	a,(OFST+0,sp)
 192  0014 5f            	clrw	x
 193  0015 97            	ld	xl,a
 194  0016 6f00          	clr	(L5_iData,x)
 195                     ; 39     for (dig = 0; dig < HD1650_NUM_DIGIT; dig++) {
 197  0018 0c01          	inc	(OFST+0,sp)
 201  001a 7b01          	ld	a,(OFST+0,sp)
 202  001c a104          	cp	a,#4
 203  001e 25ec          	jrult	L56
 204                     ; 43 }
 207  0020 84            	pop	a
 208  0021 81            	ret
 252                     ; 45 void HD1650_sendControl(uint8_t data, uint8_t segment)
 252                     ; 46 {
 253                     .text:	section	.text,new
 254  0000               _HD1650_sendControl:
 256  0000 89            	pushw	x
 257       00000000      OFST:	set	0
 260                     ; 47     segment = segment % HD1650_NUM_DIGIT;
 262  0001 7b02          	ld	a,(OFST+2,sp)
 263  0003 a403          	and	a,#3
 264  0005 6b02          	ld	(OFST+2,sp),a
 265                     ; 48     hd1650_i2c_write((uint8_t)(HD1650_CONTROL_BASE + segment), data);
 267  0007 7b01          	ld	a,(OFST+1,sp)
 268  0009 97            	ld	xl,a
 269  000a 7b02          	ld	a,(OFST+2,sp)
 270  000c ab48          	add	a,#72
 271  000e 95            	ld	xh,a
 272  000f cd0000        	call	L11_hd1650_i2c_write
 274                     ; 49 }
 277  0012 85            	popw	x
 278  0013 81            	ret
 322                     ; 51 void HD1650_sendDigit(uint8_t data, uint8_t segment)
 322                     ; 52 {
 323                     .text:	section	.text,new
 324  0000               _HD1650_sendDigit:
 326  0000 89            	pushw	x
 327       00000000      OFST:	set	0
 330                     ; 53     segment = segment % HD1650_NUM_DIGIT;
 332  0001 7b02          	ld	a,(OFST+2,sp)
 333  0003 a403          	and	a,#3
 334  0005 6b02          	ld	(OFST+2,sp),a
 335                     ; 54     hd1650_i2c_write((uint8_t)(HD1650_DISPLAY_BASE - segment*2), data);
 337  0007 7b01          	ld	a,(OFST+1,sp)
 338  0009 97            	ld	xl,a
 339  000a 7b02          	ld	a,(OFST+2,sp)
 340  000c 48            	sll	a
 341  000d a06e          	sub	a,#110
 342  000f 40            	neg	a
 343  0010 95            	ld	xh,a
 344  0011 cd0000        	call	L11_hd1650_i2c_write
 346                     ; 55 }
 349  0014 85            	popw	x
 350  0015 81            	ret
 386                     ; 57 void HD1650_displayOn(void)
 386                     ; 58 {
 387                     .text:	section	.text,new
 388  0000               _HD1650_displayOn:
 390  0000 88            	push	a
 391       00000001      OFST:	set	1
 394                     ; 60     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 396  0001 0f01          	clr	(OFST+0,sp)
 398  0003               L551:
 399                     ; 61         iCtrl[i] = (iCtrl[i] & 0xFE) | 0x01; 
 401  0003 7b01          	ld	a,(OFST+0,sp)
 402  0005 5f            	clrw	x
 403  0006 97            	ld	xl,a
 404  0007 7b01          	ld	a,(OFST+0,sp)
 405  0009 905f          	clrw	y
 406  000b 9097          	ld	yl,a
 407  000d 90e604        	ld	a,(L3_iCtrl,y)
 408  0010 a4fe          	and	a,#254
 409  0012 aa01          	or	a,#1
 410  0014 e704          	ld	(L3_iCtrl,x),a
 411                     ; 62         HD1650_sendControl(iCtrl[i], i);
 413  0016 7b01          	ld	a,(OFST+0,sp)
 414  0018 97            	ld	xl,a
 415  0019 7b01          	ld	a,(OFST+0,sp)
 416  001b 905f          	clrw	y
 417  001d 9097          	ld	yl,a
 418  001f 90e604        	ld	a,(L3_iCtrl,y)
 419  0022 95            	ld	xh,a
 420  0023 cd0000        	call	_HD1650_sendControl
 422                     ; 60     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 424  0026 0c01          	inc	(OFST+0,sp)
 428  0028 7b01          	ld	a,(OFST+0,sp)
 429  002a a104          	cp	a,#4
 430  002c 25d5          	jrult	L551
 431                     ; 64 }
 434  002e 84            	pop	a
 435  002f 81            	ret
 471                     ; 66 void HD1650_displayOff(void)
 471                     ; 67 {
 472                     .text:	section	.text,new
 473  0000               _HD1650_displayOff:
 475  0000 88            	push	a
 476       00000001      OFST:	set	1
 479                     ; 69     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 481  0001 0f01          	clr	(OFST+0,sp)
 483  0003               L102:
 484                     ; 70         iCtrl[i] = iCtrl[i] & 0xFE;       
 486  0003 7b01          	ld	a,(OFST+0,sp)
 487  0005 5f            	clrw	x
 488  0006 97            	ld	xl,a
 489  0007 e604          	ld	a,(L3_iCtrl,x)
 490  0009 a4fe          	and	a,#254
 491  000b e704          	ld	(L3_iCtrl,x),a
 492                     ; 71         HD1650_sendControl(iCtrl[i], i);
 494  000d 7b01          	ld	a,(OFST+0,sp)
 495  000f 97            	ld	xl,a
 496  0010 7b01          	ld	a,(OFST+0,sp)
 497  0012 905f          	clrw	y
 498  0014 9097          	ld	yl,a
 499  0016 90e604        	ld	a,(L3_iCtrl,y)
 500  0019 95            	ld	xh,a
 501  001a cd0000        	call	_HD1650_sendControl
 503                     ; 69     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 505  001d 0c01          	inc	(OFST+0,sp)
 509  001f 7b01          	ld	a,(OFST+0,sp)
 510  0021 a104          	cp	a,#4
 511  0023 25de          	jrult	L102
 512                     ; 73 }
 515  0025 84            	pop	a
 516  0026 81            	ret
 541                     ; 75 void HD1650_colonOn(void)
 541                     ; 76 {
 542                     .text:	section	.text,new
 543  0000               _HD1650_colonOn:
 547                     ; 77     HD1650_sendControl((iCtrl[0] & 0xF7) | 0x08, 0);
 549  0000 b604          	ld	a,L3_iCtrl
 550  0002 a4f7          	and	a,#247
 551  0004 aa08          	or	a,#8
 552  0006 5f            	clrw	x
 553  0007 95            	ld	xh,a
 554  0008 cd0000        	call	_HD1650_sendControl
 556                     ; 78 }
 559  000b 81            	ret
 584                     ; 80 void HD1650_colonOff(void)
 584                     ; 81 {
 585                     .text:	section	.text,new
 586  0000               _HD1650_colonOff:
 590                     ; 82     HD1650_sendControl(iCtrl[0] & 0xF7, 0);
 592  0000 b604          	ld	a,L3_iCtrl
 593  0002 a4f7          	and	a,#247
 594  0004 5f            	clrw	x
 595  0005 95            	ld	xh,a
 596  0006 cd0000        	call	_HD1650_sendControl
 598                     ; 83 }
 601  0009 81            	ret
 647                     ; 85 void HD1650_setBrightness(uint8_t b)
 647                     ; 86 {
 648                     .text:	section	.text,new
 649  0000               _HD1650_setBrightness:
 651  0000 88            	push	a
 652  0001 88            	push	a
 653       00000001      OFST:	set	1
 656                     ; 88     if (b > 0x07) { b = 0x07; }
 658  0002 a108          	cp	a,#8
 659  0004 2504          	jrult	L152
 662  0006 a607          	ld	a,#7
 663  0008 6b02          	ld	(OFST+1,sp),a
 664  000a               L152:
 665                     ; 90     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 667  000a 0f01          	clr	(OFST+0,sp)
 669  000c               L352:
 670                     ; 91         iCtrl[i] = (iCtrl[i] & 0xFF) | (uint8_t)(b << 4);
 672  000c 7b01          	ld	a,(OFST+0,sp)
 673  000e 5f            	clrw	x
 674  000f 97            	ld	xl,a
 675  0010 7b01          	ld	a,(OFST+0,sp)
 676  0012 905f          	clrw	y
 677  0014 9097          	ld	yl,a
 678  0016 7b02          	ld	a,(OFST+1,sp)
 679  0018 4e            	swap	a
 680  0019 a4f0          	and	a,#240
 681  001b 90ea04        	or	a,(L3_iCtrl,y)
 682  001e e704          	ld	(L3_iCtrl,x),a
 683                     ; 92         HD1650_sendControl(iCtrl[i], i);
 685  0020 7b01          	ld	a,(OFST+0,sp)
 686  0022 97            	ld	xl,a
 687  0023 7b01          	ld	a,(OFST+0,sp)
 688  0025 905f          	clrw	y
 689  0027 9097          	ld	yl,a
 690  0029 90e604        	ld	a,(L3_iCtrl,y)
 691  002c 95            	ld	xh,a
 692  002d cd0000        	call	_HD1650_sendControl
 694                     ; 90     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 696  0030 0c01          	inc	(OFST+0,sp)
 700  0032 7b01          	ld	a,(OFST+0,sp)
 701  0034 a104          	cp	a,#4
 702  0036 25d4          	jrult	L352
 703                     ; 94 }
 706  0038 85            	popw	x
 707  0039 81            	ret
 744                     ; 96 void HD1650_clearDisplay(void)
 744                     ; 97 {
 745                     .text:	section	.text,new
 746  0000               _HD1650_clearDisplay:
 748  0000 88            	push	a
 749       00000001      OFST:	set	1
 752                     ; 99     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 754  0001 0f01          	clr	(OFST+0,sp)
 756  0003               L772:
 757                     ; 100         HD1650_sendDigit(0x00, i);
 759  0003 7b01          	ld	a,(OFST+0,sp)
 760  0005 5f            	clrw	x
 761  0006 97            	ld	xl,a
 762  0007 cd0000        	call	_HD1650_sendDigit
 764                     ; 101         iData[i] = 0x00;
 766  000a 7b01          	ld	a,(OFST+0,sp)
 767  000c 5f            	clrw	x
 768  000d 97            	ld	xl,a
 769  000e 6f00          	clr	(L5_iData,x)
 770                     ; 99     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 772  0010 0c01          	inc	(OFST+0,sp)
 776  0012 7b01          	ld	a,(OFST+0,sp)
 777  0014 a104          	cp	a,#4
 778  0016 25eb          	jrult	L772
 779                     ; 103 }
 782  0018 84            	pop	a
 783  0019 81            	ret
 827                     ; 105 void HD1650_test(uint8_t pos)
 827                     ; 106 {
 828                     .text:	section	.text,new
 829  0000               _HD1650_test:
 831  0000 88            	push	a
 832  0001 88            	push	a
 833       00000001      OFST:	set	1
 836                     ; 108     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 838  0002 0f01          	clr	(OFST+0,sp)
 840  0004               L723:
 841                     ; 109         HD1650_sendDigit((i == pos) ? 0xFF : 0x00, i);
 843  0004 7b01          	ld	a,(OFST+0,sp)
 844  0006 97            	ld	xl,a
 845  0007 89            	pushw	x
 846  0008 7b03          	ld	a,(OFST+2,sp)
 847  000a 1104          	cp	a,(OFST+3,sp)
 848  000c 2604          	jrne	L23
 849  000e a6ff          	ld	a,#255
 850  0010 2001          	jra	L43
 851  0012               L23:
 852  0012 4f            	clr	a
 853  0013               L43:
 854  0013 85            	popw	x
 855  0014 95            	ld	xh,a
 856  0015 cd0000        	call	_HD1650_sendDigit
 858                     ; 108     for (i = 0; i < HD1650_NUM_DIGIT; i++) {
 860  0018 0c01          	inc	(OFST+0,sp)
 864  001a 7b01          	ld	a,(OFST+0,sp)
 865  001c a104          	cp	a,#4
 866  001e 25e4          	jrult	L723
 867                     ; 111 }
 870  0020 85            	popw	x
 871  0021 81            	ret
 926                     ; 113 void HD1650_setDot(uint8_t pos, bool onoff)
 926                     ; 114 {
 927                     .text:	section	.text,new
 928  0000               _HD1650_setDot:
 930  0000 89            	pushw	x
 931  0001 88            	push	a
 932       00000001      OFST:	set	1
 935                     ; 116     pos  = pos % HD1650_NUM_DIGIT;
 937  0002 7b02          	ld	a,(OFST+1,sp)
 938  0004 a403          	and	a,#3
 939  0006 6b02          	ld	(OFST+1,sp),a
 940                     ; 117     data = iData[pos];
 942  0008 7b02          	ld	a,(OFST+1,sp)
 943  000a 5f            	clrw	x
 944  000b 97            	ld	xl,a
 945  000c e600          	ld	a,(L5_iData,x)
 946  000e 6b01          	ld	(OFST+0,sp),a
 948                     ; 118     data = onoff ? (data | 0x80) : (data & 0x7F);
 950  0010 7b03          	ld	a,(OFST+2,sp)
 951  0012 a501          	bcp	a,#1
 952  0014 2706          	jreq	L04
 953  0016 7b01          	ld	a,(OFST+0,sp)
 954  0018 aa80          	or	a,#128
 955  001a 2004          	jra	L24
 956  001c               L04:
 957  001c 7b01          	ld	a,(OFST+0,sp)
 958  001e a47f          	and	a,#127
 959  0020               L24:
 960  0020 6b01          	ld	(OFST+0,sp),a
 962                     ; 119     iData[pos] = data;
 964  0022 7b02          	ld	a,(OFST+1,sp)
 965  0024 5f            	clrw	x
 966  0025 97            	ld	xl,a
 967  0026 7b01          	ld	a,(OFST+0,sp)
 968  0028 e700          	ld	(L5_iData,x),a
 969                     ; 120     HD1650_sendDigit(data, pos);
 971  002a 7b02          	ld	a,(OFST+1,sp)
 972  002c 97            	ld	xl,a
 973  002d 7b01          	ld	a,(OFST+0,sp)
 974  002f 95            	ld	xh,a
 975  0030 cd0000        	call	_HD1650_sendDigit
 977                     ; 121 }
 980  0033 5b03          	addw	sp,#3
 981  0035 81            	ret
1046                     ; 125 void HD1650_writeNumber(uint16_t num, bool zeroFill)
1046                     ; 126 {
1047                     .text:	section	.text,new
1048  0000               _HD1650_writeNumber:
1050  0000 89            	pushw	x
1051  0001 5203          	subw	sp,#3
1052       00000003      OFST:	set	3
1055                     ; 127     uint16_t onum = num;
1057  0003 1f01          	ldw	(OFST-2,sp),x
1059                     ; 131     digit = (uint8_t)(num % 10u);
1061  0005 a60a          	ld	a,#10
1062  0007 62            	div	x,a
1063  0008 5f            	clrw	x
1064  0009 97            	ld	xl,a
1065  000a 9f            	ld	a,xl
1066  000b 6b03          	ld	(OFST+0,sp),a
1068                     ; 132     HD1650_sendDigit(hd1650_Digit_Table[digit], 3);
1070  000d 7b03          	ld	a,(OFST+0,sp)
1071  000f 5f            	clrw	x
1072  0010 97            	ld	xl,a
1073  0011 d60000        	ld	a,(L7_hd1650_Digit_Table,x)
1074  0014 ae0003        	ldw	x,#3
1075  0017 95            	ld	xh,a
1076  0018 cd0000        	call	_HD1650_sendDigit
1078                     ; 133     iData[3] = digit;
1080  001b 7b03          	ld	a,(OFST+0,sp)
1081  001d b703          	ld	L5_iData+3,a
1082                     ; 134     num /= 10u;
1084  001f 1e04          	ldw	x,(OFST+1,sp)
1085  0021 a60a          	ld	a,#10
1086  0023 62            	div	x,a
1087  0024 1f04          	ldw	(OFST+1,sp),x
1088                     ; 137     digit = (uint8_t)(num % 10u);
1090  0026 1e04          	ldw	x,(OFST+1,sp)
1091  0028 a60a          	ld	a,#10
1092  002a 62            	div	x,a
1093  002b 5f            	clrw	x
1094  002c 97            	ld	xl,a
1095  002d 9f            	ld	a,xl
1096  002e 6b03          	ld	(OFST+0,sp),a
1098                     ; 138     if (!zeroFill && onum < 10u && digit == 0u) {
1100  0030 7b08          	ld	a,(OFST+5,sp)
1101  0032 a501          	bcp	a,#1
1102  0034 2613          	jrne	L514
1104  0036 1e01          	ldw	x,(OFST-2,sp)
1105  0038 a3000a        	cpw	x,#10
1106  003b 240c          	jruge	L514
1108  003d 0d03          	tnz	(OFST+0,sp)
1109  003f 2608          	jrne	L514
1110                     ; 139         HD1650_sendDigit(hd1650_Digit_Table[0x10], 2);
1112  0041 ae0002        	ldw	x,#2
1113  0044 cd0000        	call	_HD1650_sendDigit
1116  0047 200e          	jra	L714
1117  0049               L514:
1118                     ; 141         HD1650_sendDigit(hd1650_Digit_Table[digit], 2);
1120  0049 7b03          	ld	a,(OFST+0,sp)
1121  004b 5f            	clrw	x
1122  004c 97            	ld	xl,a
1123  004d d60000        	ld	a,(L7_hd1650_Digit_Table,x)
1124  0050 ae0002        	ldw	x,#2
1125  0053 95            	ld	xh,a
1126  0054 cd0000        	call	_HD1650_sendDigit
1128  0057               L714:
1129                     ; 143     iData[2] = digit;
1131  0057 7b03          	ld	a,(OFST+0,sp)
1132  0059 b702          	ld	L5_iData+2,a
1133                     ; 144     num /= 10u;
1135  005b 1e04          	ldw	x,(OFST+1,sp)
1136  005d a60a          	ld	a,#10
1137  005f 62            	div	x,a
1138  0060 1f04          	ldw	(OFST+1,sp),x
1139                     ; 147     digit = (uint8_t)(num % 10u);
1141  0062 1e04          	ldw	x,(OFST+1,sp)
1142  0064 a60a          	ld	a,#10
1143  0066 62            	div	x,a
1144  0067 5f            	clrw	x
1145  0068 97            	ld	xl,a
1146  0069 9f            	ld	a,xl
1147  006a 6b03          	ld	(OFST+0,sp),a
1149                     ; 148     if (!zeroFill && onum < 100u && digit == 0u) {
1151  006c 7b08          	ld	a,(OFST+5,sp)
1152  006e a501          	bcp	a,#1
1153  0070 2613          	jrne	L124
1155  0072 1e01          	ldw	x,(OFST-2,sp)
1156  0074 a30064        	cpw	x,#100
1157  0077 240c          	jruge	L124
1159  0079 0d03          	tnz	(OFST+0,sp)
1160  007b 2608          	jrne	L124
1161                     ; 149         HD1650_sendDigit(hd1650_Digit_Table[0x10], 1);
1163  007d ae0001        	ldw	x,#1
1164  0080 cd0000        	call	_HD1650_sendDigit
1167  0083 200e          	jra	L324
1168  0085               L124:
1169                     ; 151         HD1650_sendDigit(hd1650_Digit_Table[digit], 1);
1171  0085 7b03          	ld	a,(OFST+0,sp)
1172  0087 5f            	clrw	x
1173  0088 97            	ld	xl,a
1174  0089 d60000        	ld	a,(L7_hd1650_Digit_Table,x)
1175  008c ae0001        	ldw	x,#1
1176  008f 95            	ld	xh,a
1177  0090 cd0000        	call	_HD1650_sendDigit
1179  0093               L324:
1180                     ; 153     iData[1] = digit;
1182  0093 7b03          	ld	a,(OFST+0,sp)
1183  0095 b701          	ld	L5_iData+1,a
1184                     ; 154     num /= 10u;
1186  0097 1e04          	ldw	x,(OFST+1,sp)
1187  0099 a60a          	ld	a,#10
1188  009b 62            	div	x,a
1189  009c 1f04          	ldw	(OFST+1,sp),x
1190                     ; 157     digit = (uint8_t)(num % 10u);
1192  009e 1e04          	ldw	x,(OFST+1,sp)
1193  00a0 a60a          	ld	a,#10
1194  00a2 62            	div	x,a
1195  00a3 5f            	clrw	x
1196  00a4 97            	ld	xl,a
1197  00a5 9f            	ld	a,xl
1198  00a6 6b03          	ld	(OFST+0,sp),a
1200                     ; 158     if (!zeroFill && onum < 1000u && digit == 0u) {
1202  00a8 7b08          	ld	a,(OFST+5,sp)
1203  00aa a501          	bcp	a,#1
1204  00ac 2611          	jrne	L524
1206  00ae 1e01          	ldw	x,(OFST-2,sp)
1207  00b0 a303e8        	cpw	x,#1000
1208  00b3 240a          	jruge	L524
1210  00b5 0d03          	tnz	(OFST+0,sp)
1211  00b7 2606          	jrne	L524
1212                     ; 159         HD1650_sendDigit(hd1650_Digit_Table[0x10], 0);
1214  00b9 5f            	clrw	x
1215  00ba cd0000        	call	_HD1650_sendDigit
1218  00bd 200c          	jra	L724
1219  00bf               L524:
1220                     ; 161         HD1650_sendDigit(hd1650_Digit_Table[digit], 0);
1222  00bf 7b03          	ld	a,(OFST+0,sp)
1223  00c1 5f            	clrw	x
1224  00c2 97            	ld	xl,a
1225  00c3 d60000        	ld	a,(L7_hd1650_Digit_Table,x)
1226  00c6 5f            	clrw	x
1227  00c7 95            	ld	xh,a
1228  00c8 cd0000        	call	_HD1650_sendDigit
1230  00cb               L724:
1231                     ; 163     iData[0] = digit;
1233  00cb 7b03          	ld	a,(OFST+0,sp)
1234  00cd b700          	ld	L5_iData,a
1235                     ; 164 }
1238  00cf 5b05          	addw	sp,#5
1239  00d1 81            	ret
1274                     ; 166 void HD1650_writeNum(uint16_t num)
1274                     ; 167 {
1275                     .text:	section	.text,new
1276  0000               _HD1650_writeNum:
1280                     ; 168     HD1650_writeNumber(num, (uint8_t)HD1650_ZERO_PREFIX);
1282  0000 4b00          	push	#0
1283  0002 cd0000        	call	_HD1650_writeNumber
1285  0005 84            	pop	a
1286                     ; 169 }
1289  0006 81            	ret
1334                     	switch	.ubsct
1335  0000               L5_iData:
1336  0000 00000000      	ds.b	4
1337  0004               L3_iCtrl:
1338  0004 00000000      	ds.b	4
1339                     	xdef	_HD1650_writeNum
1340                     	xdef	_HD1650_test
1341                     	xdef	_HD1650_sendDigit
1342                     	xdef	_HD1650_sendControl
1343                     	xdef	_HD1650_writeNumber
1344                     	xdef	_HD1650_setDot
1345                     	xdef	_HD1650_colonOff
1346                     	xdef	_HD1650_colonOn
1347                     	xdef	_HD1650_setBrightness
1348                     	xdef	_HD1650_clearDisplay
1349                     	xdef	_HD1650_displayOff
1350                     	xdef	_HD1650_displayOn
1351                     	xdef	_HD1650_init
1352                     	xref	_swi2c_write_array
1353                     	xref	_swi2c_init
1373                     	end
