   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  44                     ; 56 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 57 {
  45                     .text:	section	.text,new
  46  0000               f_NonHandledInterrupt:
  50                     ; 61 }
  53  0000 80            	iret
  75                     ; 69 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 70 {
  76                     .text:	section	.text,new
  77  0000               f_TRAP_IRQHandler:
  81                     ; 74 }
  84  0000 80            	iret
 106                     ; 81 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 82 
 106                     ; 83 {
 107                     .text:	section	.text,new
 108  0000               f_TLI_IRQHandler:
 112                     ; 87 }
 115  0000 80            	iret
 137                     ; 94 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 95 {
 138                     .text:	section	.text,new
 139  0000               f_AWU_IRQHandler:
 143                     ; 99 }
 146  0000 80            	iret
 168                     ; 106 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 107 {
 169                     .text:	section	.text,new
 170  0000               f_CLK_IRQHandler:
 174                     ; 111 }
 177  0000 80            	iret
 200                     ; 118 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 119 {
 201                     .text:	section	.text,new
 202  0000               f_EXTI_PORTA_IRQHandler:
 206                     ; 123 }
 209  0000 80            	iret
 232                     ; 130 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 131 {
 233                     .text:	section	.text,new
 234  0000               f_EXTI_PORTB_IRQHandler:
 238                     ; 135 }
 241  0000 80            	iret
 264                     ; 142 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 143 {
 265                     .text:	section	.text,new
 266  0000               f_EXTI_PORTC_IRQHandler:
 270                     ; 147 }
 273  0000 80            	iret
 296                     ; 154 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 296                     ; 155 {
 297                     .text:	section	.text,new
 298  0000               f_EXTI_PORTD_IRQHandler:
 302                     ; 159 }
 305  0000 80            	iret
 328                     ; 166 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 328                     ; 167 {
 329                     .text:	section	.text,new
 330  0000               f_EXTI_PORTE_IRQHandler:
 334                     ; 171 }
 337  0000 80            	iret
 359                     ; 218 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 359                     ; 219 {
 360                     .text:	section	.text,new
 361  0000               f_SPI_IRQHandler:
 365                     ; 223 }
 368  0000 80            	iret
 391                     ; 230 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 231 {
 392                     .text:	section	.text,new
 393  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 397                     ; 233 }
 400  0000 80            	iret
 402                     	bsct
 403  0000               L151_rise:
 404  0000 0000          	dc.w	0
 405  0002               L351_riseValid:
 406  0002 00            	dc.b	0
 466                     ; 240 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 466                     ; 241 {
 467                     .text:	section	.text,new
 468  0000               f_TIM1_CAP_COM_IRQHandler:
 470  0000 8a            	push	cc
 471  0001 84            	pop	a
 472  0002 a4bf          	and	a,#191
 473  0004 88            	push	a
 474  0005 86            	pop	cc
 475       00000002      OFST:	set	2
 476  0006 3b0002        	push	c_x+2
 477  0009 be00          	ldw	x,c_x
 478  000b 89            	pushw	x
 479  000c 3b0002        	push	c_y+2
 480  000f be00          	ldw	x,c_y
 481  0011 89            	pushw	x
 482  0012 89            	pushw	x
 485                     ; 245         if (TIM1_GetITStatus(TIM1_IT_CC1) != RESET) {
 487  0013 a602          	ld	a,#2
 488  0015 cd0000        	call	_TIM1_GetITStatus
 490  0018 4d            	tnz	a
 491  0019 2716          	jreq	L302
 492                     ; 246                 if (!riseValid) {
 494  001b 3d02          	tnz	L351_riseValid
 495  001d 260d          	jrne	L502
 496                     ; 247 										rise = TIM1_GetCapture1();
 498  001f cd0000        	call	_TIM1_GetCapture1
 500  0022 bf00          	ldw	L151_rise,x
 501                     ; 248 										riseValid = 1;
 503  0024 35010002      	mov	L351_riseValid,#1
 504                     ; 249 										colonToggle = 1;
 506  0028 35010000      	mov	_colonToggle,#1
 507  002c               L502:
 508                     ; 251 								TIM1_ClearITPendingBit(TIM1_IT_CC1);
 510  002c a602          	ld	a,#2
 511  002e cd0000        	call	_TIM1_ClearITPendingBit
 513  0031               L302:
 514                     ; 253         if (TIM1_GetITStatus(TIM1_IT_CC2) != RESET) {
 516  0031 a604          	ld	a,#4
 517  0033 cd0000        	call	_TIM1_GetITStatus
 519  0036 4d            	tnz	a
 520  0037 2735          	jreq	L702
 521                     ; 254 					if (riseValid){
 523  0039 3d02          	tnz	L351_riseValid
 524  003b 272c          	jreq	L112
 525                     ; 255 								fall = TIM1_GetCapture2();
 527  003d cd0000        	call	_TIM1_GetCapture2
 529  0040 1f01          	ldw	(OFST-1,sp),x
 531                     ; 256 								pulseWidth = (fall >= rise)
 531                     ; 257 										? (fall - rise)
 531                     ; 258 										: (0xFFFF - rise + fall + 1);
 533  0042 1e01          	ldw	x,(OFST-1,sp)
 534  0044 b300          	cpw	x,L151_rise
 535  0046 2508          	jrult	L63
 536  0048 1e01          	ldw	x,(OFST-1,sp)
 537  004a 72b00000      	subw	x,L151_rise
 538  004e 200b          	jra	L04
 539  0050               L63:
 540  0050 aeffff        	ldw	x,#65535
 541  0053 72b00000      	subw	x,L151_rise
 542  0057 72fb01        	addw	x,(OFST-1,sp)
 543  005a 5c            	incw	x
 544  005b               L04:
 545  005b bf00          	ldw	_pulseWidth,x
 546                     ; 259 								silenceTicks = 0;
 548  005d 3f00          	clr	_silenceTicks
 549                     ; 260 								ms_counter = 0; 
 551  005f 3f00          	clr	_ms_counter
 552                     ; 261 								pulseReady = 1;
 554  0061 35010000      	mov	_pulseReady,#1
 555                     ; 262 								riseValid  = 0;
 557  0065 3f02          	clr	L351_riseValid
 558                     ; 263 								colonToggle = 0;
 560  0067 3f00          	clr	_colonToggle
 561  0069               L112:
 562                     ; 265 						TIM1_ClearITPendingBit(TIM1_IT_CC2);
 564  0069 a604          	ld	a,#4
 565  006b cd0000        	call	_TIM1_ClearITPendingBit
 567  006e               L702:
 568                     ; 267 }
 571  006e 5b02          	addw	sp,#2
 572  0070 85            	popw	x
 573  0071 bf00          	ldw	c_y,x
 574  0073 320002        	pop	c_y+2
 575  0076 85            	popw	x
 576  0077 bf00          	ldw	c_x,x
 577  0079 320002        	pop	c_x+2
 578  007c 80            	iret
 601                     ; 301 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 601                     ; 302  {
 602                     .text:	section	.text,new
 603  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 607                     ; 304  }
 610  0000 80            	iret
 633                     ; 311  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 633                     ; 312  {
 634                     .text:	section	.text,new
 635  0000               f_TIM2_CAP_COM_IRQHandler:
 639                     ; 316  }
 642  0000 80            	iret
 665                     ; 353  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 665                     ; 354  {
 666                     .text:	section	.text,new
 667  0000               f_UART1_TX_IRQHandler:
 671                     ; 358  }
 674  0000 80            	iret
 697                     ; 365  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 697                     ; 366  {
 698                     .text:	section	.text,new
 699  0000               f_UART1_RX_IRQHandler:
 703                     ; 370  }
 706  0000 80            	iret
 728                     ; 404 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 728                     ; 405 {
 729                     .text:	section	.text,new
 730  0000               f_I2C_IRQHandler:
 734                     ; 409 }
 737  0000 80            	iret
 759                     ; 483  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 759                     ; 484  {
 760                     .text:	section	.text,new
 761  0000               f_ADC1_IRQHandler:
 765                     ; 488  }
 768  0000 80            	iret
 796                     ; 509  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 796                     ; 510  {
 797                     .text:	section	.text,new
 798  0000               f_TIM4_UPD_OVF_IRQHandler:
 800  0000 8a            	push	cc
 801  0001 84            	pop	a
 802  0002 a4bf          	and	a,#191
 803  0004 88            	push	a
 804  0005 86            	pop	cc
 805  0006 3b0002        	push	c_x+2
 806  0009 be00          	ldw	x,c_x
 807  000b 89            	pushw	x
 808  000c 3b0002        	push	c_y+2
 809  000f be00          	ldw	x,c_y
 810  0011 89            	pushw	x
 813                     ; 511     ms_counter++;
 815  0012 3c00          	inc	_ms_counter
 816                     ; 512     clock_ms_counter++;
 818  0014 be00          	ldw	x,_clock_ms_counter
 819  0016 1c0001        	addw	x,#1
 820  0019 bf00          	ldw	_clock_ms_counter,x
 821                     ; 514     if (clock_ms_counter >= 1000)
 823  001b be00          	ldw	x,_clock_ms_counter
 824  001d a303e8        	cpw	x,#1000
 825  0020 250d          	jrult	L303
 826                     ; 516 				clock_ms_counter = 0;
 828  0022 5f            	clrw	x
 829  0023 bf00          	ldw	_clock_ms_counter,x
 830                     ; 517         clock_seconds++;
 832  0025 3c00          	inc	_clock_seconds
 833                     ; 518         if (clock_seconds > 59) clock_seconds = 0;
 835  0027 b600          	ld	a,_clock_seconds
 836  0029 a13c          	cp	a,#60
 837  002b 2502          	jrult	L303
 840  002d 3f00          	clr	_clock_seconds
 841  002f               L303:
 842                     ; 521     if (ms_counter >= 100)
 844  002f b600          	ld	a,_ms_counter
 845  0031 a164          	cp	a,#100
 846  0033 2504          	jrult	L703
 847                     ; 523         silenceTicks++;
 849  0035 3c00          	inc	_silenceTicks
 850                     ; 524         ms_counter = 0;
 852  0037 3f00          	clr	_ms_counter
 853  0039               L703:
 854                     ; 526     TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 856  0039 a601          	ld	a,#1
 857  003b cd0000        	call	_TIM4_ClearITPendingBit
 859                     ; 527  }
 862  003e 85            	popw	x
 863  003f bf00          	ldw	c_y,x
 864  0041 320002        	pop	c_y+2
 865  0044 85            	popw	x
 866  0045 bf00          	ldw	c_x,x
 867  0047 320002        	pop	c_x+2
 868  004a 80            	iret
 891                     ; 535 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 891                     ; 536 {
 892                     .text:	section	.text,new
 893  0000               f_EEPROM_EEC_IRQHandler:
 897                     ; 540 }
 900  0000 80            	iret
 912                     	xdef	f_EEPROM_EEC_IRQHandler
 913                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 914                     	xdef	f_ADC1_IRQHandler
 915                     	xdef	f_I2C_IRQHandler
 916                     	xdef	f_UART1_RX_IRQHandler
 917                     	xdef	f_UART1_TX_IRQHandler
 918                     	xdef	f_TIM2_CAP_COM_IRQHandler
 919                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 920                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 921                     	xdef	f_TIM1_CAP_COM_IRQHandler
 922                     	xdef	f_SPI_IRQHandler
 923                     	xdef	f_EXTI_PORTE_IRQHandler
 924                     	xdef	f_EXTI_PORTD_IRQHandler
 925                     	xdef	f_EXTI_PORTC_IRQHandler
 926                     	xdef	f_EXTI_PORTB_IRQHandler
 927                     	xdef	f_EXTI_PORTA_IRQHandler
 928                     	xdef	f_CLK_IRQHandler
 929                     	xdef	f_AWU_IRQHandler
 930                     	xdef	f_TLI_IRQHandler
 931                     	xdef	f_TRAP_IRQHandler
 932                     	xdef	f_NonHandledInterrupt
 933                     	xref.b	_pulseReady
 934                     	xref.b	_pulseWidth
 935                     	xref.b	_colonToggle
 936                     	xref.b	_clock_seconds
 937                     	xref.b	_clock_ms_counter
 938                     	xref.b	_silenceTicks
 939                     	xref.b	_ms_counter
 940                     	xref	_TIM4_ClearITPendingBit
 941                     	xref	_TIM1_ClearITPendingBit
 942                     	xref	_TIM1_GetITStatus
 943                     	xref	_TIM1_GetCapture2
 944                     	xref	_TIM1_GetCapture1
 945                     	xref.b	c_x
 946                     	xref.b	c_y
 965                     	end
