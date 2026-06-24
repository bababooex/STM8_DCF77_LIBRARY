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
 233                     ; 130 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 131 {
 234                     .text:	section	.text,new
 235  0000               f_EXTI_PORTB_IRQHandler:
 239                     ; 132     rtc_second = 1;
 241  0000 35010000      	mov	_rtc_second,#1
 242                     ; 133 }
 245  0004 80            	iret
 268                     ; 140 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 268                     ; 141 {
 269                     .text:	section	.text,new
 270  0000               f_EXTI_PORTC_IRQHandler:
 274                     ; 145 }
 277  0000 80            	iret
 300                     ; 152 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 300                     ; 153 {
 301                     .text:	section	.text,new
 302  0000               f_EXTI_PORTD_IRQHandler:
 306                     ; 157 }
 309  0000 80            	iret
 332                     ; 164 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 332                     ; 165 {
 333                     .text:	section	.text,new
 334  0000               f_EXTI_PORTE_IRQHandler:
 338                     ; 169 }
 341  0000 80            	iret
 363                     ; 216 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 363                     ; 217 {
 364                     .text:	section	.text,new
 365  0000               f_SPI_IRQHandler:
 369                     ; 221 }
 372  0000 80            	iret
 395                     ; 228 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 395                     ; 229 {
 396                     .text:	section	.text,new
 397  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 401                     ; 231 }
 404  0000 80            	iret
 406                     	bsct
 407  0000               L151_rise:
 408  0000 0000          	dc.w	0
 409  0002               L351_fall:
 410  0002 0000          	dc.w	0
 411  0004               L551_riseValid:
 412  0004 00            	dc.b	0
 472                     ; 238 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 472                     ; 239 {
 473                     .text:	section	.text,new
 474  0000               f_TIM1_CAP_COM_IRQHandler:
 476  0000 8a            	push	cc
 477  0001 84            	pop	a
 478  0002 a4bf          	and	a,#191
 479  0004 88            	push	a
 480  0005 86            	pop	cc
 481  0006 3b0002        	push	c_x+2
 482  0009 be00          	ldw	x,c_x
 483  000b 89            	pushw	x
 484  000c 3b0002        	push	c_y+2
 485  000f be00          	ldw	x,c_y
 486  0011 89            	pushw	x
 489                     ; 243         if (TIM1_GetITStatus(TIM1_IT_CC1) != RESET) {
 491  0012 a602          	ld	a,#2
 492  0014 cd0000        	call	_TIM1_GetITStatus
 494  0017 4d            	tnz	a
 495  0018 2716          	jreq	L502
 496                     ; 244                 if (!riseValid) {
 498  001a 3d04          	tnz	L551_riseValid
 499  001c 260d          	jrne	L702
 500                     ; 245 										rise = TIM1_GetCapture1();
 502  001e cd0000        	call	_TIM1_GetCapture1
 504  0021 bf00          	ldw	L151_rise,x
 505                     ; 246 										riseValid = 1;
 507  0023 35010004      	mov	L551_riseValid,#1
 508                     ; 247 										colonToggle = 1;
 510  0027 35010000      	mov	_colonToggle,#1
 511  002b               L702:
 512                     ; 249 								TIM1_ClearITPendingBit(TIM1_IT_CC1);
 514  002b a602          	ld	a,#2
 515  002d cd0000        	call	_TIM1_ClearITPendingBit
 517  0030               L502:
 518                     ; 251         if (TIM1_GetITStatus(TIM1_IT_CC2) != RESET) {
 520  0030 a604          	ld	a,#4
 521  0032 cd0000        	call	_TIM1_GetITStatus
 523  0035 4d            	tnz	a
 524  0036 2736          	jreq	L112
 525                     ; 252 					if (riseValid){
 527  0038 3d04          	tnz	L551_riseValid
 528  003a 272d          	jreq	L312
 529                     ; 253 								fall = TIM1_GetCapture2();
 531  003c cd0000        	call	_TIM1_GetCapture2
 533  003f bf02          	ldw	L351_fall,x
 534                     ; 254 								pulseWidth = (fall >= rise)
 534                     ; 255 										? (fall - rise)
 534                     ; 256 										: (0xFFFF - rise + fall + 1);
 536  0041 be02          	ldw	x,L351_fall
 537  0043 b300          	cpw	x,L151_rise
 538  0045 2508          	jrult	L63
 539  0047 be02          	ldw	x,L351_fall
 540  0049 72b00000      	subw	x,L151_rise
 541  004d 200c          	jra	L04
 542  004f               L63:
 543  004f aeffff        	ldw	x,#65535
 544  0052 72b00000      	subw	x,L151_rise
 545  0056 72bb0002      	addw	x,L351_fall
 546  005a 5c            	incw	x
 547  005b               L04:
 548  005b bf00          	ldw	_pulseWidth,x
 549                     ; 257 								silenceTicks = 0;
 551  005d 3f00          	clr	_silenceTicks
 552                     ; 258 								ms_counter = 0; 
 554  005f 3f00          	clr	_ms_counter
 555                     ; 259 								pulseReady = 1;
 557  0061 35010000      	mov	_pulseReady,#1
 558                     ; 260 								riseValid  = 0;
 560  0065 3f04          	clr	L551_riseValid
 561                     ; 261 								colonToggle = 0;
 563  0067 3f00          	clr	_colonToggle
 564  0069               L312:
 565                     ; 263 						TIM1_ClearITPendingBit(TIM1_IT_CC2);
 567  0069 a604          	ld	a,#4
 568  006b cd0000        	call	_TIM1_ClearITPendingBit
 570  006e               L112:
 571                     ; 265 }
 574  006e 85            	popw	x
 575  006f bf00          	ldw	c_y,x
 576  0071 320002        	pop	c_y+2
 577  0074 85            	popw	x
 578  0075 bf00          	ldw	c_x,x
 579  0077 320002        	pop	c_x+2
 580  007a 80            	iret
 603                     ; 299 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 603                     ; 300  {
 604                     .text:	section	.text,new
 605  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 609                     ; 302  }
 612  0000 80            	iret
 635                     ; 309  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 635                     ; 310  {
 636                     .text:	section	.text,new
 637  0000               f_TIM2_CAP_COM_IRQHandler:
 641                     ; 314  }
 644  0000 80            	iret
 667                     ; 351  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 667                     ; 352  {
 668                     .text:	section	.text,new
 669  0000               f_UART1_TX_IRQHandler:
 673                     ; 356  }
 676  0000 80            	iret
 699                     ; 363  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 699                     ; 364  {
 700                     .text:	section	.text,new
 701  0000               f_UART1_RX_IRQHandler:
 705                     ; 368  }
 708  0000 80            	iret
 730                     ; 402 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 730                     ; 403 {
 731                     .text:	section	.text,new
 732  0000               f_I2C_IRQHandler:
 736                     ; 407 }
 739  0000 80            	iret
 761                     ; 481  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 761                     ; 482  {
 762                     .text:	section	.text,new
 763  0000               f_ADC1_IRQHandler:
 767                     ; 486  }
 770  0000 80            	iret
 796                     ; 507  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 796                     ; 508  {
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
 813                     ; 509     ms_counter++;
 815  0012 3c00          	inc	_ms_counter
 816                     ; 511     if (ms_counter >= 100)
 818  0014 b600          	ld	a,_ms_counter
 819  0016 a164          	cp	a,#100
 820  0018 2504          	jrult	L503
 821                     ; 513         silenceTicks++;
 823  001a 3c00          	inc	_silenceTicks
 824                     ; 514         ms_counter = 0;
 826  001c 3f00          	clr	_ms_counter
 827  001e               L503:
 828                     ; 516     TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 830  001e a601          	ld	a,#1
 831  0020 cd0000        	call	_TIM4_ClearITPendingBit
 833                     ; 517  }
 836  0023 85            	popw	x
 837  0024 bf00          	ldw	c_y,x
 838  0026 320002        	pop	c_y+2
 839  0029 85            	popw	x
 840  002a bf00          	ldw	c_x,x
 841  002c 320002        	pop	c_x+2
 842  002f 80            	iret
 865                     ; 525 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 865                     ; 526 {
 866                     .text:	section	.text,new
 867  0000               f_EEPROM_EEC_IRQHandler:
 871                     ; 530 }
 874  0000 80            	iret
 886                     	xdef	f_EEPROM_EEC_IRQHandler
 887                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 888                     	xdef	f_ADC1_IRQHandler
 889                     	xdef	f_I2C_IRQHandler
 890                     	xdef	f_UART1_RX_IRQHandler
 891                     	xdef	f_UART1_TX_IRQHandler
 892                     	xdef	f_TIM2_CAP_COM_IRQHandler
 893                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 894                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 895                     	xdef	f_TIM1_CAP_COM_IRQHandler
 896                     	xdef	f_SPI_IRQHandler
 897                     	xdef	f_EXTI_PORTE_IRQHandler
 898                     	xdef	f_EXTI_PORTD_IRQHandler
 899                     	xdef	f_EXTI_PORTC_IRQHandler
 900                     	xdef	f_EXTI_PORTB_IRQHandler
 901                     	xdef	f_EXTI_PORTA_IRQHandler
 902                     	xdef	f_CLK_IRQHandler
 903                     	xdef	f_AWU_IRQHandler
 904                     	xdef	f_TLI_IRQHandler
 905                     	xdef	f_TRAP_IRQHandler
 906                     	xdef	f_NonHandledInterrupt
 907                     	xref.b	_pulseReady
 908                     	xref.b	_pulseWidth
 909                     	xref.b	_colonToggle
 910                     	xref.b	_rtc_second
 911                     	xref.b	_silenceTicks
 912                     	xref.b	_ms_counter
 913                     	xref	_TIM4_ClearITPendingBit
 914                     	xref	_TIM1_ClearITPendingBit
 915                     	xref	_TIM1_GetITStatus
 916                     	xref	_TIM1_GetCapture2
 917                     	xref	_TIM1_GetCapture1
 918                     	xref.b	c_x
 919                     	xref.b	c_y
 938                     	end
