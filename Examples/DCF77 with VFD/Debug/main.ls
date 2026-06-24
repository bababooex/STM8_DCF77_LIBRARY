   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  15                     	bsct
  16  0000               _was_received:
  17  0000 00            	dc.b	0
  18  0001               _sync_second:
  19  0001 0000          	dc.w	0
  20  0003               _sync_on_zero_pending:
  21  0003 00            	dc.b	0
  22  0004               _next_hour:
  23  0004 00            	dc.b	0
  24  0005               _next_minute:
  25  0005 00            	dc.b	0
  94                     ; 42 void main(void)
  94                     ; 43 {
  96                     .text:	section	.text,new
  97  0000               _main:
  99  0000 88            	push	a
 100       00000001      OFST:	set	1
 103                     ; 45 	  GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);//edge detection via timer, doesnt require it set
 105  0001 4b00          	push	#0
 106  0003 4b40          	push	#64
 107  0005 ae500a        	ldw	x,#20490
 108  0008 cd0000        	call	_GPIO_Init
 110  000b 85            	popw	x
 111                     ; 46 		GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_IT);//or internal pull up, if you dont use external resistor
 113  000c 4b20          	push	#32
 114  000e 4b10          	push	#16
 115  0010 ae5005        	ldw	x,#20485
 116  0013 cd0000        	call	_GPIO_Init
 118  0016 85            	popw	x
 119                     ; 47     clock_setup();
 121  0017 cd0000        	call	_clock_setup
 123                     ; 48 		swi2c_init();//init i2c
 125  001a cd0000        	call	_swi2c_init
 127                     ; 49 		pt6311_init(9); 
 129  001d a609          	ld	a,#9
 130  001f cd0000        	call	_pt6311_init
 132                     ; 50 		pt6311_write_string(1,"HELLO");
 134  0022 ae000f        	ldw	x,#L72
 135  0025 89            	pushw	x
 136  0026 a601          	ld	a,#1
 137  0028 cd0000        	call	_pt6311_write_string
 139  002b 85            	popw	x
 140                     ; 51 		delay_ms(1000);
 142  002c ae03e8        	ldw	x,#1000
 143  002f cd0000        	call	_delay_ms
 145                     ; 52 		pt6311_clear_display();
 147  0032 cd0000        	call	_pt6311_clear_display
 149                     ; 53 		pt6311_write_string(1,"DCF SYNC");
 151  0035 ae0006        	ldw	x,#L13
 152  0038 89            	pushw	x
 153  0039 a601          	ld	a,#1
 154  003b cd0000        	call	_pt6311_write_string
 156  003e 85            	popw	x
 157                     ; 54 		delay_ms(1000);
 159  003f ae03e8        	ldw	x,#1000
 160  0042 cd0000        	call	_delay_ms
 162                     ; 55 		pt6311_clear_display();
 164  0045 cd0000        	call	_pt6311_clear_display
 166                     ; 56 		pt6311_write_string(1,"SC");
 168  0048 ae0003        	ldw	x,#L33
 169  004b 89            	pushw	x
 170  004c a601          	ld	a,#1
 171  004e cd0000        	call	_pt6311_write_string
 173  0051 85            	popw	x
 174                     ; 57 		PCF8563_init();
 176  0052 cd0000        	call	_PCF8563_init
 178                     ; 58 		custom_time();//time set to 00:00:00 - unknown
 180  0055 cd0000        	call	_custom_time
 182                     ; 59 		PCF8563_set_time();//set it
 184  0058 cd0000        	call	_PCF8563_set_time
 186                     ; 60 		PCF8563_clk_sec();//set clk out pin as 1 Hz
 188  005b cd0000        	call	_PCF8563_clk_sec
 190                     ; 61 		PCF8563_get_time();//display start unknown time
 192  005e cd0000        	call	_PCF8563_get_time
 194                     ; 62 		display_time();
 196  0061 cd0000        	call	_display_time
 198                     ; 63 		EXTI_setup();//lastly setup EXTI and DCF_77 library
 200  0064 cd0000        	call	_EXTI_setup
 202                     ; 64 		DCF77_Init();
 204  0067 cd0000        	call	_DCF77_Init
 206                     ; 65 		enableInterrupts();
 209  006a 9a            rim
 211  006b               L53:
 212                     ; 67 				uint8_t zero_pulse = pulseReady;//little delay doesnt matter
 214  006b b600          	ld	a,_pulseReady
 215  006d 6b01          	ld	(OFST+0,sp),a
 217                     ; 68         DCF77_Update();//update DCF (needs to run always)
 219  006f cd0000        	call	_DCF77_Update
 221                     ; 69 				if (sync_on_zero_pending) {//sync on first edge
 223  0072 3d03          	tnz	_sync_on_zero_pending
 224  0074 2711          	jreq	L14
 225                     ; 70 								if (zero_pulse) {
 227  0076 0d01          	tnz	(OFST+0,sp)
 228  0078 270d          	jreq	L14
 229                     ; 71 										time.h = next_hour;
 231  007a 450402        	mov	_time+2,_next_hour
 232                     ; 72 										time.m = next_minute;
 234  007d 450501        	mov	_time+1,_next_minute
 235                     ; 73 										time.s = 0;
 237  0080 3f00          	clr	_time
 238                     ; 74 										PCF8563_set_time();
 240  0082 cd0000        	call	_PCF8563_set_time
 242                     ; 75 										sync_on_zero_pending = 0;
 244  0085 3f03          	clr	_sync_on_zero_pending
 245  0087               L14:
 246                     ; 78         if (DCF77_GetTime())
 248  0087 cd0000        	call	_DCF77_GetTime
 250  008a 4d            	tnz	a
 251  008b 2717          	jreq	L54
 252                     ; 80 								DCF77_ReadTime(&t);
 254  008d ae0000        	ldw	x,#_t
 255  0090 cd0000        	call	_DCF77_ReadTime
 257                     ; 81 								next_minute = t.minutes;
 259  0093 450005        	mov	_next_minute,_t
 260                     ; 82 								next_hour = t.hours;
 262  0096 450104        	mov	_next_hour,_t+1
 263                     ; 83 								sync_on_zero_pending = 1;//wait for first rising edge
 265  0099 35010003      	mov	_sync_on_zero_pending,#1
 266                     ; 84 								was_received = 1;
 268  009d 35010000      	mov	_was_received,#1
 269                     ; 85 								sync_second = 0;   // reset lost-sync timer
 271  00a1 5f            	clrw	x
 272  00a2 bf01          	ldw	_sync_second,x
 273  00a4               L54:
 274                     ; 88 				visual_handler();//handle blink each edge
 276  00a4 cd0000        	call	_visual_handler
 278                     ; 89 				if (rtc_second)//update visual secs each second, handled by EXTI
 280  00a7 3d00          	tnz	_rtc_second
 281  00a9 270f          	jreq	L74
 282                     ; 91 							rtc_second = 0;
 284  00ab 3f00          	clr	_rtc_second
 285                     ; 92 							sync_second++;
 287  00ad be01          	ldw	x,_sync_second
 288  00af 1c0001        	addw	x,#1
 289  00b2 bf01          	ldw	_sync_second,x
 290                     ; 93 							PCF8563_get_time();
 292  00b4 cd0000        	call	_PCF8563_get_time
 294                     ; 94 							display_time();
 296  00b7 cd0000        	call	_display_time
 298  00ba               L74:
 299                     ; 96 				if(was_received==1){
 301  00ba b600          	ld	a,_was_received
 302  00bc a101          	cp	a,#1
 303  00be 260c          	jrne	L15
 304                     ; 97 						pt6311_write_string(1,"  ");
 306  00c0 ae0000        	ldw	x,#L35
 307  00c3 89            	pushw	x
 308  00c4 a601          	ld	a,#1
 309  00c6 cd0000        	call	_pt6311_write_string
 311  00c9 85            	popw	x
 312                     ; 98 						was_received=0;
 314  00ca 3f00          	clr	_was_received
 315  00cc               L15:
 316                     ; 100 				if (sync_second >= SYNC_HANDLER){//time might not be correct, syncing continues
 318  00cc be01          	ldw	x,_sync_second
 319  00ce a303e8        	cpw	x,#1000
 320  00d1 2598          	jrult	L53
 321                     ; 101 						was_received=0;
 323  00d3 3f00          	clr	_was_received
 324                     ; 102 						pt6311_write_string(1,"SC");
 326  00d5 ae0003        	ldw	x,#L33
 327  00d8 89            	pushw	x
 328  00d9 a601          	ld	a,#1
 329  00db cd0000        	call	_pt6311_write_string
 331  00de 85            	popw	x
 332  00df 208a          	jra	L53
 360                     ; 109 void EXTI_setup(void)
 360                     ; 110 {
 361                     .text:	section	.text,new
 362  0000               _EXTI_setup:
 366                     ; 111 	ITC_DeInit();
 368  0000 cd0000        	call	_ITC_DeInit
 370                     ; 112 	ITC_SetSoftwarePriority(ITC_IRQ_PORTB, ITC_PRIORITYLEVEL_1);//set priority to 1 just to be safe
 372  0003 ae0401        	ldw	x,#1025
 373  0006 cd0000        	call	_ITC_SetSoftwarePriority
 375                     ; 114 	EXTI_DeInit();
 377  0009 cd0000        	call	_EXTI_DeInit
 379                     ; 115 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_RISE_ONLY);
 381  000c ae0101        	ldw	x,#257
 382  000f cd0000        	call	_EXTI_SetExtIntSensitivity
 384                     ; 116 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_RISE_ONLY);
 386  0012 a604          	ld	a,#4
 387  0014 cd0000        	call	_EXTI_SetTLISensitivity
 389                     ; 117 }
 392  0017 81            	ret
 425                     ; 119 void clock_setup(void)
 425                     ; 120 	{
 426                     .text:	section	.text,new
 427  0000               _clock_setup:
 431                     ; 122     CLK_DeInit();
 433  0000 cd0000        	call	_CLK_DeInit
 435                     ; 124     CLK_HSECmd(DISABLE);
 437  0003 4f            	clr	a
 438  0004 cd0000        	call	_CLK_HSECmd
 440                     ; 125     CLK_LSICmd(DISABLE);
 442  0007 4f            	clr	a
 443  0008 cd0000        	call	_CLK_LSICmd
 445                     ; 126     CLK_HSICmd(ENABLE);
 447  000b a601          	ld	a,#1
 448  000d cd0000        	call	_CLK_HSICmd
 451  0010               L101:
 452                     ; 127     while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 454  0010 ae0102        	ldw	x,#258
 455  0013 cd0000        	call	_CLK_GetFlagStatus
 457  0016 4d            	tnz	a
 458  0017 27f7          	jreq	L101
 459                     ; 129     CLK_ClockSwitchCmd(ENABLE);
 461  0019 a601          	ld	a,#1
 462  001b cd0000        	call	_CLK_ClockSwitchCmd
 464                     ; 130     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 466  001e 4f            	clr	a
 467  001f cd0000        	call	_CLK_HSIPrescalerConfig
 469                     ; 131     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 471  0022 a680          	ld	a,#128
 472  0024 cd0000        	call	_CLK_SYSCLKConfig
 474                     ; 133     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 474                     ; 134     DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 476  0027 4b01          	push	#1
 477  0029 4b00          	push	#0
 478  002b ae01e1        	ldw	x,#481
 479  002e cd0000        	call	_CLK_ClockSwitchConfig
 481  0031 85            	popw	x
 482                     ; 135 		CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 484  0032 ae0701        	ldw	x,#1793
 485  0035 cd0000        	call	_CLK_PeripheralClockConfig
 487                     ; 136 		CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 489  0038 ae0401        	ldw	x,#1025
 490  003b cd0000        	call	_CLK_PeripheralClockConfig
 492                     ; 137   }
 495  003e 81            	ret
 615                     	xdef	_main
 616                     	xdef	_EXTI_setup
 617                     	xdef	_clock_setup
 618                     	xdef	_next_minute
 619                     	xdef	_next_hour
 620                     	xdef	_sync_on_zero_pending
 621                     	xdef	_sync_second
 622                     	xdef	_was_received
 623                     	switch	.ubsct
 624  0000               _t:
 625  0000 000000000000  	ds.b	6
 626                     	xdef	_t
 627                     	xref.b	_time
 628                     	xref	_DCF77_ReadTime
 629                     	xref	_DCF77_GetTime
 630                     	xref	_DCF77_Update
 631                     	xref	_DCF77_Init
 632                     	xref.b	_pulseReady
 633                     	xref.b	_rtc_second
 634                     	xref	_visual_handler
 635                     	xref	_PCF8563_clk_sec
 636                     	xref	_PCF8563_get_time
 637                     	xref	_PCF8563_set_time
 638                     	xref	_display_time
 639                     	xref	_custom_time
 640                     	xref	_PCF8563_init
 641                     	xref	_swi2c_init
 642                     	xref	_pt6311_clear_display
 643                     	xref	_pt6311_write_string
 644                     	xref	_pt6311_init
 645                     	xref	_ITC_SetSoftwarePriority
 646                     	xref	_ITC_DeInit
 647                     	xref	_GPIO_Init
 648                     	xref	_EXTI_SetTLISensitivity
 649                     	xref	_EXTI_SetExtIntSensitivity
 650                     	xref	_EXTI_DeInit
 651                     	xref	_CLK_GetFlagStatus
 652                     	xref	_CLK_SYSCLKConfig
 653                     	xref	_CLK_HSIPrescalerConfig
 654                     	xref	_CLK_ClockSwitchConfig
 655                     	xref	_CLK_PeripheralClockConfig
 656                     	xref	_CLK_ClockSwitchCmd
 657                     	xref	_CLK_LSICmd
 658                     	xref	_CLK_HSICmd
 659                     	xref	_CLK_HSECmd
 660                     	xref	_CLK_DeInit
 661                     	xref	_delay_ms
 662                     .const:	section	.text
 663  0000               L35:
 664  0000 202000        	dc.b	"  ",0
 665  0003               L33:
 666  0003 534300        	dc.b	"SC",0
 667  0006               L13:
 668  0006 444346205359  	dc.b	"DCF SYNC",0
 669  000f               L72:
 670  000f 48454c4c4f00  	dc.b	"HELLO",0
 690                     	end
