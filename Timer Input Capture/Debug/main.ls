   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  15                     .bit:	section	.data,bit
  16  0000               _hasTime:
  17  0000 00            	dc.b	0
  18                     	bsct
  19  0000               L3_last_time:
  20  0000 00            	dc.b	0
  21  0001               _currentMode:
  22  0001 00            	dc.b	0
  23                     	switch	.bit
  24  0001               _modeChanged:
  25  0001 00            	dc.b	0
  65                     ; 26 void main(void)
  65                     ; 27 {
  67                     .text:	section	.text,new
  68  0000               _main:
  72                     ; 28 	  GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);//needs to be configured in option bytes as tim1 if using stm8s103!!
  74  0000 4b00          	push	#0
  75  0002 4b40          	push	#64
  76  0004 ae500a        	ldw	x,#20490
  77  0007 cd0000        	call	_GPIO_Init
  79  000a 85            	popw	x
  80                     ; 29 		GPIO_Init(SW_PIN, GPIO_MODE_IN_PU_NO_IT);//switch
  82  000b 4b40          	push	#64
  83  000d 4b20          	push	#32
  84  000f ae500a        	ldw	x,#20490
  85  0012 cd0000        	call	_GPIO_Init
  87  0015 85            	popw	x
  88                     ; 30     clock_setup();
  90  0016 cd0000        	call	_clock_setup
  92                     ; 31 		HD1650_init();
  94  0019 cd0000        	call	_HD1650_init
  96                     ; 32 		HD1650_clearDisplay();
  98  001c cd0000        	call	_HD1650_clearDisplay
 100                     ; 33     HD1650_displayOn();
 102  001f cd0000        	call	_HD1650_displayOn
 104                     ; 34 		DCF77_Init();
 106  0022 cd0000        	call	_DCF77_Init
 108  0025               L33:
 109                     ; 36         switch (currentMode) {
 111  0025 b601          	ld	a,_currentMode
 113                     ; 40             case 3: year();     break;
 114  0027 4d            	tnz	a
 115  0028 270b          	jreq	L5
 116  002a 4a            	dec	a
 117  002b 270d          	jreq	L7
 118  002d 4a            	dec	a
 119  002e 270f          	jreq	L11
 120  0030 4a            	dec	a
 121  0031 2711          	jreq	L31
 122  0033 20f0          	jra	L33
 123  0035               L5:
 124                     ; 37             case 0: hour_min(); break;
 126  0035 cd0000        	call	_hour_min
 130  0038 20eb          	jra	L33
 131  003a               L7:
 132                     ; 38             case 1: seconds();  break;
 134  003a cd0000        	call	_seconds
 138  003d 20e6          	jra	L33
 139  003f               L11:
 140                     ; 39             case 2: day_month();break;
 142  003f cd0000        	call	_day_month
 146  0042 20e1          	jra	L33
 147  0044               L31:
 148                     ; 40             case 3: year();     break;
 150  0044 cd0000        	call	_year
 154  0047 20dc          	jra	L33
 155  0049               L14:
 157  0049 20da          	jra	L33
 194                     ; 45 void hour_min(void)
 194                     ; 46 {
 195                     .text:	section	.text,new
 196  0000               _hour_min:
 200                     ; 47     modeChanged = false;
 202  0000 72110001      	bres	_modeChanged
 203  0004               L35:
 204                     ; 49 			  DCF77_Update();
 206  0004 cd0000        	call	_DCF77_Update
 208                     ; 50 				visual_handler();
 210  0007 cd0000        	call	_visual_handler
 212                     ; 51 				if (DCF77_GetTime())//time valid
 214  000a cd0000        	call	_DCF77_GetTime
 216  000d 4d            	tnz	a
 217  000e 270a          	jreq	L16
 218                     ; 53 					DCF77_ReadTime(&t);
 220  0010 ae0000        	ldw	x,#_t
 221  0013 cd0000        	call	_DCF77_ReadTime
 223                     ; 54 					hasTime = true;
 225  0016 72100000      	bset	_hasTime
 226  001a               L16:
 227                     ; 56 				if (hasTime){
 229                     	btst	_hasTime
 230  001f 2415          	jruge	L36
 231                     ; 57 					HD1650_writeNumber((t.hours) * 100 + (t.minutes), 0);
 233  0021 4b00          	push	#0
 234  0023 b601          	ld	a,_t+1
 235  0025 97            	ld	xl,a
 236  0026 a664          	ld	a,#100
 237  0028 42            	mul	x,a
 238  0029 01            	rrwa	x,a
 239  002a bb00          	add	a,_t
 240  002c 2401          	jrnc	L01
 241  002e 5c            	incw	x
 242  002f               L01:
 243  002f 02            	rlwa	x,a
 244  0030 cd0000        	call	_HD1650_writeNumber
 246  0033 84            	pop	a
 248  0034 2003          	jra	L56
 249  0036               L36:
 250                     ; 60 					wait_clock_display();
 252  0036 cd0000        	call	_wait_clock_display
 254  0039               L56:
 255                     ; 62         if (GPIO_ReadInputPin(SW_PIN) == RESET) {
 257  0039 4b20          	push	#32
 258  003b ae500a        	ldw	x,#20490
 259  003e cd0000        	call	_GPIO_ReadInputPin
 261  0041 5b01          	addw	sp,#1
 262  0043 4d            	tnz	a
 263  0044 2625          	jrne	L76
 265  0046 200e          	jra	L37
 266  0048               L17:
 267                     ; 64 							last_time = clock_seconds;
 269  0048 450000        	mov	L3_last_time,_clock_seconds
 270                     ; 65 							modeChanged = true;
 272  004b 72100001      	bset	_modeChanged
 273                     ; 66 							currentMode = 1;
 275  004f 35010001      	mov	_currentMode,#1
 276                     ; 67 							HD1650_clearDisplay();
 278  0053 cd0000        	call	_HD1650_clearDisplay
 280  0056               L37:
 281                     ; 63             while(clock_seconds - last_time >= 0.7){
 283  0056 9c            	rvf
 284  0057 b600          	ld	a,_clock_seconds
 285  0059 5f            	clrw	x
 286  005a b000          	sub	a,L3_last_time
 287  005c 2401          	jrnc	L21
 288  005e 5a            	decw	x
 289  005f               L21:
 290  005f 02            	rlwa	x,a
 291  0060 cd0000        	call	c_itof
 293  0063 ae0000        	ldw	x,#L301
 294  0066 cd0000        	call	c_fcmp
 296  0069 2edd          	jrsge	L17
 297  006b               L76:
 298                     ; 48     while (!modeChanged) {
 300                     	btst	_modeChanged
 301  0070 2492          	jruge	L35
 302                     ; 72 }
 305  0072 81            	ret
 342                     ; 73 void day_month(void)
 342                     ; 74 {
 343                     .text:	section	.text,new
 344  0000               _day_month:
 348                     ; 75     modeChanged = false;
 350  0000 72110001      	bres	_modeChanged
 351  0004               L711:
 352                     ; 77         DCF77_Update();
 354  0004 cd0000        	call	_DCF77_Update
 356                     ; 78 				visual_handler();
 358  0007 cd0000        	call	_visual_handler
 360                     ; 79 				if (DCF77_GetTime())//time valid
 362  000a cd0000        	call	_DCF77_GetTime
 364  000d 4d            	tnz	a
 365  000e 270a          	jreq	L521
 366                     ; 81 					DCF77_ReadTime(&t);
 368  0010 ae0000        	ldw	x,#_t
 369  0013 cd0000        	call	_DCF77_ReadTime
 371                     ; 82 					hasTime = true;
 373  0016 72100000      	bset	_hasTime
 374  001a               L521:
 375                     ; 84 				if (hasTime){
 377                     	btst	_hasTime
 378  001f 2415          	jruge	L721
 379                     ; 85 					HD1650_writeNumber((t.dayOfMonth) * 100 + (t.months), 0);
 381  0021 4b00          	push	#0
 382  0023 b603          	ld	a,_t+3
 383  0025 97            	ld	xl,a
 384  0026 a664          	ld	a,#100
 385  0028 42            	mul	x,a
 386  0029 01            	rrwa	x,a
 387  002a bb04          	add	a,_t+4
 388  002c 2401          	jrnc	L61
 389  002e 5c            	incw	x
 390  002f               L61:
 391  002f 02            	rlwa	x,a
 392  0030 cd0000        	call	_HD1650_writeNumber
 394  0033 84            	pop	a
 396  0034 2003          	jra	L131
 397  0036               L721:
 398                     ; 88 					wait_clock_display();
 400  0036 cd0000        	call	_wait_clock_display
 402  0039               L131:
 403                     ; 90         if (GPIO_ReadInputPin(SW_PIN) == RESET) {
 405  0039 4b20          	push	#32
 406  003b ae500a        	ldw	x,#20490
 407  003e cd0000        	call	_GPIO_ReadInputPin
 409  0041 5b01          	addw	sp,#1
 410  0043 4d            	tnz	a
 411  0044 2625          	jrne	L331
 413  0046 200e          	jra	L731
 414  0048               L531:
 415                     ; 92 							last_time = clock_seconds;
 417  0048 450000        	mov	L3_last_time,_clock_seconds
 418                     ; 93 							modeChanged = true;
 420  004b 72100001      	bset	_modeChanged
 421                     ; 94 							currentMode = 3;
 423  004f 35030001      	mov	_currentMode,#3
 424                     ; 95 							HD1650_clearDisplay();
 426  0053 cd0000        	call	_HD1650_clearDisplay
 428  0056               L731:
 429                     ; 91 						while(clock_seconds - last_time >= 0.7){
 431  0056 9c            	rvf
 432  0057 b600          	ld	a,_clock_seconds
 433  0059 5f            	clrw	x
 434  005a b000          	sub	a,L3_last_time
 435  005c 2401          	jrnc	L02
 436  005e 5a            	decw	x
 437  005f               L02:
 438  005f 02            	rlwa	x,a
 439  0060 cd0000        	call	c_itof
 441  0063 ae0000        	ldw	x,#L301
 442  0066 cd0000        	call	c_fcmp
 444  0069 2edd          	jrsge	L531
 445  006b               L331:
 446                     ; 76     while (!modeChanged) {
 448                     	btst	_modeChanged
 449  0070 2492          	jruge	L711
 450                     ; 99 }
 453  0072 81            	ret
 490                     ; 101 void year(void)
 490                     ; 102 {
 491                     .text:	section	.text,new
 492  0000               _year:
 496                     ; 103     modeChanged = false;
 498  0000 72110001      	bres	_modeChanged
 499  0004               L351:
 500                     ; 105 			  DCF77_Update();
 502  0004 cd0000        	call	_DCF77_Update
 504                     ; 106 				visual_handler();
 506  0007 cd0000        	call	_visual_handler
 508                     ; 107 				if (DCF77_GetTime())//time valid
 510  000a cd0000        	call	_DCF77_GetTime
 512  000d 4d            	tnz	a
 513  000e 270a          	jreq	L161
 514                     ; 109 					DCF77_ReadTime(&t);
 516  0010 ae0000        	ldw	x,#_t
 517  0013 cd0000        	call	_DCF77_ReadTime
 519                     ; 110 					hasTime = true;
 521  0016 72100000      	bset	_hasTime
 522  001a               L161:
 523                     ; 112 				if (hasTime){
 525                     	btst	_hasTime
 526  001f 240f          	jruge	L361
 527                     ; 113 					HD1650_writeNumber(2000+(t.years), 0);//above 2000
 529  0021 4b00          	push	#0
 530  0023 b605          	ld	a,_t+5
 531  0025 5f            	clrw	x
 532  0026 97            	ld	xl,a
 533  0027 1c07d0        	addw	x,#2000
 534  002a cd0000        	call	_HD1650_writeNumber
 536  002d 84            	pop	a
 538  002e 2003          	jra	L561
 539  0030               L361:
 540                     ; 116 					wait_clock_display();
 542  0030 cd0000        	call	_wait_clock_display
 544  0033               L561:
 545                     ; 118         if (GPIO_ReadInputPin(SW_PIN) == RESET) {
 547  0033 4b20          	push	#32
 548  0035 ae500a        	ldw	x,#20490
 549  0038 cd0000        	call	_GPIO_ReadInputPin
 551  003b 5b01          	addw	sp,#1
 552  003d 4d            	tnz	a
 553  003e 2623          	jrne	L761
 555  0040 200c          	jra	L371
 556  0042               L171:
 557                     ; 120 							last_time = clock_seconds;
 559  0042 450000        	mov	L3_last_time,_clock_seconds
 560                     ; 121 							modeChanged = true;
 562  0045 72100001      	bset	_modeChanged
 563                     ; 122 							currentMode = 0;
 565  0049 3f01          	clr	_currentMode
 566                     ; 123 							HD1650_clearDisplay();
 568  004b cd0000        	call	_HD1650_clearDisplay
 570  004e               L371:
 571                     ; 119             while(clock_seconds - last_time >= 0.7){
 573  004e 9c            	rvf
 574  004f b600          	ld	a,_clock_seconds
 575  0051 5f            	clrw	x
 576  0052 b000          	sub	a,L3_last_time
 577  0054 2401          	jrnc	L42
 578  0056 5a            	decw	x
 579  0057               L42:
 580  0057 02            	rlwa	x,a
 581  0058 cd0000        	call	c_itof
 583  005b ae0000        	ldw	x,#L301
 584  005e cd0000        	call	c_fcmp
 586  0061 2edf          	jrsge	L171
 587  0063               L761:
 588                     ; 104     while (!modeChanged) {
 590                     	btst	_modeChanged
 591  0068 249a          	jruge	L351
 592                     ; 128 }
 595  006a 81            	ret
 598                     	switch	.bit
 599  0002               L771_hasTime:
 600  0002 00            	dc.b	0
 643                     ; 130 void seconds(void)
 643                     ; 131 {
 644                     .text:	section	.text,new
 645  0000               _seconds:
 649                     ; 132     modeChanged = false;
 651  0000 72110001      	bres	_modeChanged
 652  0004               L712:
 653                     ; 135 			  DCF77_Update();
 655  0004 cd0000        	call	_DCF77_Update
 657                     ; 136 				visual_handler();
 659  0007 cd0000        	call	_visual_handler
 661                     ; 137 				if (DCF77_GetTime())//time valid
 663  000a cd0000        	call	_DCF77_GetTime
 665  000d 4d            	tnz	a
 666  000e 2704          	jreq	L522
 667                     ; 140 					hasTime = true;
 669  0010 72100002      	bset	L771_hasTime
 670  0014               L522:
 671                     ; 142         HD1650_writeNumber(clock_seconds, 1);//seconds always, even if misaligned
 673  0014 4b01          	push	#1
 674  0016 b600          	ld	a,_clock_seconds
 675  0018 5f            	clrw	x
 676  0019 97            	ld	xl,a
 677  001a cd0000        	call	_HD1650_writeNumber
 679  001d 84            	pop	a
 680                     ; 143         if (GPIO_ReadInputPin(SW_PIN) == RESET) {
 682  001e 4b20          	push	#32
 683  0020 ae500a        	ldw	x,#20490
 684  0023 cd0000        	call	_GPIO_ReadInputPin
 686  0026 5b01          	addw	sp,#1
 687  0028 4d            	tnz	a
 688  0029 2625          	jrne	L722
 690  002b 200e          	jra	L332
 691  002d               L132:
 692                     ; 145 							last_time = clock_seconds;
 694  002d 450000        	mov	L3_last_time,_clock_seconds
 695                     ; 146 							modeChanged = true;
 697  0030 72100001      	bset	_modeChanged
 698                     ; 147 							currentMode = 2;
 700  0034 35020001      	mov	_currentMode,#2
 701                     ; 148 							HD1650_clearDisplay();
 703  0038 cd0000        	call	_HD1650_clearDisplay
 705  003b               L332:
 706                     ; 144             while(clock_seconds - last_time >= 0.7){
 708  003b 9c            	rvf
 709  003c b600          	ld	a,_clock_seconds
 710  003e 5f            	clrw	x
 711  003f b000          	sub	a,L3_last_time
 712  0041 2401          	jrnc	L03
 713  0043 5a            	decw	x
 714  0044               L03:
 715  0044 02            	rlwa	x,a
 716  0045 cd0000        	call	c_itof
 718  0048 ae0000        	ldw	x,#L301
 719  004b cd0000        	call	c_fcmp
 721  004e 2edd          	jrsge	L132
 722  0050               L722:
 723                     ; 133     while (!modeChanged) {
 725                     	btst	_modeChanged
 726  0055 24ad          	jruge	L712
 727                     ; 152 }
 730  0057 81            	ret
 763                     ; 154 void clock_setup(void)
 763                     ; 155 	{
 764                     .text:	section	.text,new
 765  0000               _clock_setup:
 769                     ; 157     CLK_DeInit();
 771  0000 cd0000        	call	_CLK_DeInit
 773                     ; 159     CLK_HSECmd(DISABLE);
 775  0003 4f            	clr	a
 776  0004 cd0000        	call	_CLK_HSECmd
 778                     ; 160     CLK_LSICmd(DISABLE);
 780  0007 4f            	clr	a
 781  0008 cd0000        	call	_CLK_LSICmd
 783                     ; 161     CLK_HSICmd(ENABLE);
 785  000b a601          	ld	a,#1
 786  000d cd0000        	call	_CLK_HSICmd
 789  0010               L152:
 790                     ; 162     while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 792  0010 ae0102        	ldw	x,#258
 793  0013 cd0000        	call	_CLK_GetFlagStatus
 795  0016 4d            	tnz	a
 796  0017 27f7          	jreq	L152
 797                     ; 164     CLK_ClockSwitchCmd(ENABLE);
 799  0019 a601          	ld	a,#1
 800  001b cd0000        	call	_CLK_ClockSwitchCmd
 802                     ; 165     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 804  001e 4f            	clr	a
 805  001f cd0000        	call	_CLK_HSIPrescalerConfig
 807                     ; 166     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 809  0022 a680          	ld	a,#128
 810  0024 cd0000        	call	_CLK_SYSCLKConfig
 812                     ; 168     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 812                     ; 169     DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 814  0027 4b01          	push	#1
 815  0029 4b00          	push	#0
 816  002b ae01e1        	ldw	x,#481
 817  002e cd0000        	call	_CLK_ClockSwitchConfig
 819  0031 85            	popw	x
 820                     ; 170 		CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 822  0032 ae0701        	ldw	x,#1793
 823  0035 cd0000        	call	_CLK_PeripheralClockConfig
 825                     ; 171 		CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 827  0038 ae0401        	ldw	x,#1025
 828  003b cd0000        	call	_CLK_PeripheralClockConfig
 830                     ; 172   }
 833  003e 81            	ret
 868                     ; 174 void wait_clock_display(void)
 868                     ; 175 	{
 869                     .text:	section	.text,new
 870  0000               _wait_clock_display:
 872  0000 88            	push	a
 873       00000001      OFST:	set	1
 876                     ; 177 		for (i=0;i<4;i++){
 878  0001 0f01          	clr	(OFST+0,sp)
 880  0003               L372:
 881                     ; 178 			HD1650_sendDigit(0x40, i);//set ----
 883  0003 7b01          	ld	a,(OFST+0,sp)
 884  0005 ae4000        	ldw	x,#16384
 885  0008 97            	ld	xl,a
 886  0009 cd0000        	call	_HD1650_sendDigit
 888                     ; 177 		for (i=0;i<4;i++){
 890  000c 0c01          	inc	(OFST+0,sp)
 894  000e 7b01          	ld	a,(OFST+0,sp)
 895  0010 a104          	cp	a,#4
 896  0012 25ef          	jrult	L372
 897                     ; 180   }
 900  0014 84            	pop	a
 901  0015 81            	ret
1013                     	xdef	_main
1014                     	xdef	_wait_clock_display
1015                     	xdef	_seconds
1016                     	xdef	_year
1017                     	xdef	_day_month
1018                     	xdef	_hour_min
1019                     	xdef	_clock_setup
1020                     	xdef	_modeChanged
1021                     	xdef	_currentMode
1022                     	xdef	_hasTime
1023                     	switch	.ubsct
1024  0000               _t:
1025  0000 000000000000  	ds.b	6
1026                     	xdef	_t
1027                     	xref	_DCF77_ReadTime
1028                     	xref	_DCF77_GetTime
1029                     	xref	_DCF77_Update
1030                     	xref	_DCF77_Init
1031                     	xref.b	_clock_seconds
1032                     	xref	_visual_handler
1033                     	xref	_HD1650_sendDigit
1034                     	xref	_HD1650_writeNumber
1035                     	xref	_HD1650_clearDisplay
1036                     	xref	_HD1650_displayOn
1037                     	xref	_HD1650_init
1038                     	xref	_GPIO_ReadInputPin
1039                     	xref	_GPIO_Init
1040                     	xref	_CLK_GetFlagStatus
1041                     	xref	_CLK_SYSCLKConfig
1042                     	xref	_CLK_HSIPrescalerConfig
1043                     	xref	_CLK_ClockSwitchConfig
1044                     	xref	_CLK_PeripheralClockConfig
1045                     	xref	_CLK_ClockSwitchCmd
1046                     	xref	_CLK_LSICmd
1047                     	xref	_CLK_HSICmd
1048                     	xref	_CLK_HSECmd
1049                     	xref	_CLK_DeInit
1050                     .const:	section	.text
1051  0000               L301:
1052  0000 3f333333      	dc.w	16179,13107
1053                     	xref.b	c_x
1073                     	xref	c_fcmp
1074                     	xref	c_itof
1075                     	end
