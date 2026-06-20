   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  43                     ; 67 void I2C_DeInit(void)
  43                     ; 68 {
  45                     .text:	section	.text,new
  46  0000               _I2C_DeInit:
  50                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  52  0000 725f5210      	clr	21008
  53                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  55  0004 725f5211      	clr	21009
  56                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  58  0008 725f5212      	clr	21010
  59                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  61  000c 725f5213      	clr	21011
  62                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  64  0010 725f5214      	clr	21012
  65                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  67  0014 725f521a      	clr	21018
  68                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  70  0018 725f521b      	clr	21019
  71                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  73  001c 725f521c      	clr	21020
  74                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  76  0020 3502521d      	mov	21021,#2
  77                     ; 78 }
  80  0024 81            	ret
 259                     .const:	section	.text
 260  0000               L01:
 261  0000 000186a1      	dc.l	100001
 262  0004               L21:
 263  0004 000f4240      	dc.l	1000000
 264                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 264                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 264                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 264                     ; 99 {
 265                     .text:	section	.text,new
 266  0000               _I2C_Init:
 268  0000 5209          	subw	sp,#9
 269       00000009      OFST:	set	9
 272                     ; 100   uint16_t result = 0x0004;
 274                     ; 101   uint16_t tmpval = 0;
 276                     ; 102   uint8_t tmpccrh = 0;
 278  0002 0f07          	clr	(OFST-2,sp)
 280                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 282                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 284                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 286                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 288                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 290                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 292                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 294  0004 c65212        	ld	a,21010
 295  0007 a4c0          	and	a,#192
 296  0009 c75212        	ld	21010,a
 297                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 299  000c c65212        	ld	a,21010
 300  000f 1a15          	or	a,(OFST+12,sp)
 301  0011 c75212        	ld	21010,a
 302                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 304  0014 72115210      	bres	21008,#0
 305                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 307  0018 c6521c        	ld	a,21020
 308  001b a430          	and	a,#48
 309  001d c7521c        	ld	21020,a
 310                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 312  0020 725f521b      	clr	21019
 313                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 315  0024 96            	ldw	x,sp
 316  0025 1c000c        	addw	x,#OFST+3
 317  0028 cd0000        	call	c_ltor
 319  002b ae0000        	ldw	x,#L01
 320  002e cd0000        	call	c_lcmp
 322  0031 2403          	jruge	L41
 323  0033 cc00c0        	jp	L131
 324  0036               L41:
 325                     ; 131     tmpccrh = I2C_CCRH_FS;
 327  0036 a680          	ld	a,#128
 328  0038 6b07          	ld	(OFST-2,sp),a
 330                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 332  003a 0d12          	tnz	(OFST+9,sp)
 333  003c 2630          	jrne	L331
 334                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 336  003e 96            	ldw	x,sp
 337  003f 1c000c        	addw	x,#OFST+3
 338  0042 cd0000        	call	c_ltor
 340  0045 a603          	ld	a,#3
 341  0047 cd0000        	call	c_smul
 343  004a 96            	ldw	x,sp
 344  004b 1c0001        	addw	x,#OFST-8
 345  004e cd0000        	call	c_rtol
 348  0051 7b15          	ld	a,(OFST+12,sp)
 349  0053 b703          	ld	c_lreg+3,a
 350  0055 3f02          	clr	c_lreg+2
 351  0057 3f01          	clr	c_lreg+1
 352  0059 3f00          	clr	c_lreg
 353  005b ae0004        	ldw	x,#L21
 354  005e cd0000        	call	c_lmul
 356  0061 96            	ldw	x,sp
 357  0062 1c0001        	addw	x,#OFST-8
 358  0065 cd0000        	call	c_ludv
 360  0068 be02          	ldw	x,c_lreg+2
 361  006a 1f08          	ldw	(OFST-1,sp),x
 364  006c 2034          	jra	L531
 365  006e               L331:
 366                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 368  006e 96            	ldw	x,sp
 369  006f 1c000c        	addw	x,#OFST+3
 370  0072 cd0000        	call	c_ltor
 372  0075 a619          	ld	a,#25
 373  0077 cd0000        	call	c_smul
 375  007a 96            	ldw	x,sp
 376  007b 1c0001        	addw	x,#OFST-8
 377  007e cd0000        	call	c_rtol
 380  0081 7b15          	ld	a,(OFST+12,sp)
 381  0083 b703          	ld	c_lreg+3,a
 382  0085 3f02          	clr	c_lreg+2
 383  0087 3f01          	clr	c_lreg+1
 384  0089 3f00          	clr	c_lreg
 385  008b ae0004        	ldw	x,#L21
 386  008e cd0000        	call	c_lmul
 388  0091 96            	ldw	x,sp
 389  0092 1c0001        	addw	x,#OFST-8
 390  0095 cd0000        	call	c_ludv
 392  0098 be02          	ldw	x,c_lreg+2
 393  009a 1f08          	ldw	(OFST-1,sp),x
 395                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 397  009c 7b07          	ld	a,(OFST-2,sp)
 398  009e aa40          	or	a,#64
 399  00a0 6b07          	ld	(OFST-2,sp),a
 401  00a2               L531:
 402                     ; 147     if (result < (uint16_t)0x01)
 404  00a2 1e08          	ldw	x,(OFST-1,sp)
 405  00a4 2605          	jrne	L731
 406                     ; 150       result = (uint16_t)0x0001;
 408  00a6 ae0001        	ldw	x,#1
 409  00a9 1f08          	ldw	(OFST-1,sp),x
 411  00ab               L731:
 412                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 414  00ab 7b15          	ld	a,(OFST+12,sp)
 415  00ad 97            	ld	xl,a
 416  00ae a603          	ld	a,#3
 417  00b0 42            	mul	x,a
 418  00b1 a60a          	ld	a,#10
 419  00b3 cd0000        	call	c_sdivx
 421  00b6 5c            	incw	x
 422  00b7 1f05          	ldw	(OFST-4,sp),x
 424                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 426  00b9 7b06          	ld	a,(OFST-3,sp)
 427  00bb c7521d        	ld	21021,a
 429  00be 2043          	jra	L141
 430  00c0               L131:
 431                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 433  00c0 96            	ldw	x,sp
 434  00c1 1c000c        	addw	x,#OFST+3
 435  00c4 cd0000        	call	c_ltor
 437  00c7 3803          	sll	c_lreg+3
 438  00c9 3902          	rlc	c_lreg+2
 439  00cb 3901          	rlc	c_lreg+1
 440  00cd 3900          	rlc	c_lreg
 441  00cf 96            	ldw	x,sp
 442  00d0 1c0001        	addw	x,#OFST-8
 443  00d3 cd0000        	call	c_rtol
 446  00d6 7b15          	ld	a,(OFST+12,sp)
 447  00d8 b703          	ld	c_lreg+3,a
 448  00da 3f02          	clr	c_lreg+2
 449  00dc 3f01          	clr	c_lreg+1
 450  00de 3f00          	clr	c_lreg
 451  00e0 ae0004        	ldw	x,#L21
 452  00e3 cd0000        	call	c_lmul
 454  00e6 96            	ldw	x,sp
 455  00e7 1c0001        	addw	x,#OFST-8
 456  00ea cd0000        	call	c_ludv
 458  00ed be02          	ldw	x,c_lreg+2
 459  00ef 1f08          	ldw	(OFST-1,sp),x
 461                     ; 167     if (result < (uint16_t)0x0004)
 463  00f1 1e08          	ldw	x,(OFST-1,sp)
 464  00f3 a30004        	cpw	x,#4
 465  00f6 2405          	jruge	L341
 466                     ; 170       result = (uint16_t)0x0004;
 468  00f8 ae0004        	ldw	x,#4
 469  00fb 1f08          	ldw	(OFST-1,sp),x
 471  00fd               L341:
 472                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 474  00fd 7b15          	ld	a,(OFST+12,sp)
 475  00ff 4c            	inc	a
 476  0100 c7521d        	ld	21021,a
 477  0103               L141:
 478                     ; 181   I2C->CCRL = (uint8_t)result;
 480  0103 7b09          	ld	a,(OFST+0,sp)
 481  0105 c7521b        	ld	21019,a
 482                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 484  0108 7b08          	ld	a,(OFST-1,sp)
 485  010a a40f          	and	a,#15
 486  010c 1a07          	or	a,(OFST-2,sp)
 487  010e c7521c        	ld	21020,a
 488                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 490  0111 72105210      	bset	21008,#0
 491                     ; 188   I2C_AcknowledgeConfig(Ack);
 493  0115 7b13          	ld	a,(OFST+10,sp)
 494  0117 cd0000        	call	_I2C_AcknowledgeConfig
 496                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 498  011a 7b11          	ld	a,(OFST+8,sp)
 499  011c c75213        	ld	21011,a
 500                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 500                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 502  011f 1e10          	ldw	x,(OFST+7,sp)
 503  0121 4f            	clr	a
 504  0122 01            	rrwa	x,a
 505  0123 48            	sll	a
 506  0124 59            	rlcw	x
 507  0125 01            	rrwa	x,a
 508  0126 a406          	and	a,#6
 509  0128 5f            	clrw	x
 510  0129 6b04          	ld	(OFST-5,sp),a
 512  012b 7b14          	ld	a,(OFST+11,sp)
 513  012d aa40          	or	a,#64
 514  012f 1a04          	or	a,(OFST-5,sp)
 515  0131 c75214        	ld	21012,a
 516                     ; 194 }
 519  0134 5b09          	addw	sp,#9
 520  0136 81            	ret
 575                     ; 202 void I2C_Cmd(FunctionalState NewState)
 575                     ; 203 {
 576                     .text:	section	.text,new
 577  0000               _I2C_Cmd:
 581                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 583                     ; 207   if (NewState != DISABLE)
 585  0000 4d            	tnz	a
 586  0001 2706          	jreq	L371
 587                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 589  0003 72105210      	bset	21008,#0
 591  0007 2004          	jra	L571
 592  0009               L371:
 593                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 595  0009 72115210      	bres	21008,#0
 596  000d               L571:
 597                     ; 217 }
 600  000d 81            	ret
 635                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 635                     ; 226 {
 636                     .text:	section	.text,new
 637  0000               _I2C_GeneralCallCmd:
 641                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 643                     ; 230   if (NewState != DISABLE)
 645  0000 4d            	tnz	a
 646  0001 2706          	jreq	L512
 647                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 649  0003 721c5210      	bset	21008,#6
 651  0007 2004          	jra	L712
 652  0009               L512:
 653                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 655  0009 721d5210      	bres	21008,#6
 656  000d               L712:
 657                     ; 240 }
 660  000d 81            	ret
 695                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 695                     ; 251 {
 696                     .text:	section	.text,new
 697  0000               _I2C_GenerateSTART:
 701                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 703                     ; 255   if (NewState != DISABLE)
 705  0000 4d            	tnz	a
 706  0001 2706          	jreq	L732
 707                     ; 258     I2C->CR2 |= I2C_CR2_START;
 709  0003 72105211      	bset	21009,#0
 711  0007 2004          	jra	L142
 712  0009               L732:
 713                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 715  0009 72115211      	bres	21009,#0
 716  000d               L142:
 717                     ; 265 }
 720  000d 81            	ret
 755                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 755                     ; 274 {
 756                     .text:	section	.text,new
 757  0000               _I2C_GenerateSTOP:
 761                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 763                     ; 278   if (NewState != DISABLE)
 765  0000 4d            	tnz	a
 766  0001 2706          	jreq	L162
 767                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 769  0003 72125211      	bset	21009,#1
 771  0007 2004          	jra	L362
 772  0009               L162:
 773                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 775  0009 72135211      	bres	21009,#1
 776  000d               L362:
 777                     ; 288 }
 780  000d 81            	ret
 816                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 816                     ; 297 {
 817                     .text:	section	.text,new
 818  0000               _I2C_SoftwareResetCmd:
 822                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 824                     ; 301   if (NewState != DISABLE)
 826  0000 4d            	tnz	a
 827  0001 2706          	jreq	L303
 828                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 830  0003 721e5211      	bset	21009,#7
 832  0007 2004          	jra	L503
 833  0009               L303:
 834                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 836  0009 721f5211      	bres	21009,#7
 837  000d               L503:
 838                     ; 311 }
 841  000d 81            	ret
 877                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 877                     ; 321 {
 878                     .text:	section	.text,new
 879  0000               _I2C_StretchClockCmd:
 883                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 885                     ; 325   if (NewState != DISABLE)
 887  0000 4d            	tnz	a
 888  0001 2706          	jreq	L523
 889                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 891  0003 721f5210      	bres	21008,#7
 893  0007 2004          	jra	L723
 894  0009               L523:
 895                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 897  0009 721e5210      	bset	21008,#7
 898  000d               L723:
 899                     ; 336 }
 902  000d 81            	ret
 938                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 938                     ; 346 {
 939                     .text:	section	.text,new
 940  0000               _I2C_AcknowledgeConfig:
 942  0000 88            	push	a
 943       00000000      OFST:	set	0
 946                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 948                     ; 350   if (Ack == I2C_ACK_NONE)
 950  0001 4d            	tnz	a
 951  0002 2606          	jrne	L743
 952                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 954  0004 72155211      	bres	21009,#2
 956  0008 2014          	jra	L153
 957  000a               L743:
 958                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 960  000a 72145211      	bset	21009,#2
 961                     ; 360     if (Ack == I2C_ACK_CURR)
 963  000e 7b01          	ld	a,(OFST+1,sp)
 964  0010 a101          	cp	a,#1
 965  0012 2606          	jrne	L353
 966                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 968  0014 72175211      	bres	21009,#3
 970  0018 2004          	jra	L153
 971  001a               L353:
 972                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 974  001a 72165211      	bset	21009,#3
 975  001e               L153:
 976                     ; 371 }
 979  001e 84            	pop	a
 980  001f 81            	ret
1052                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1052                     ; 382 {
1053                     .text:	section	.text,new
1054  0000               _I2C_ITConfig:
1056  0000 89            	pushw	x
1057       00000000      OFST:	set	0
1060                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1062                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1064                     ; 387   if (NewState != DISABLE)
1066  0001 9f            	ld	a,xl
1067  0002 4d            	tnz	a
1068  0003 2709          	jreq	L314
1069                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1071  0005 9e            	ld	a,xh
1072  0006 ca521a        	or	a,21018
1073  0009 c7521a        	ld	21018,a
1075  000c 2009          	jra	L514
1076  000e               L314:
1077                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1079  000e 7b01          	ld	a,(OFST+1,sp)
1080  0010 43            	cpl	a
1081  0011 c4521a        	and	a,21018
1082  0014 c7521a        	ld	21018,a
1083  0017               L514:
1084                     ; 397 }
1087  0017 85            	popw	x
1088  0018 81            	ret
1124                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1124                     ; 406 {
1125                     .text:	section	.text,new
1126  0000               _I2C_FastModeDutyCycleConfig:
1130                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1132                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1134  0000 a140          	cp	a,#64
1135  0002 2606          	jrne	L534
1136                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1138  0004 721c521c      	bset	21020,#6
1140  0008 2004          	jra	L734
1141  000a               L534:
1142                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1144  000a 721d521c      	bres	21020,#6
1145  000e               L734:
1146                     ; 420 }
1149  000e 81            	ret
1172                     ; 427 uint8_t I2C_ReceiveData(void)
1172                     ; 428 {
1173                     .text:	section	.text,new
1174  0000               _I2C_ReceiveData:
1178                     ; 430   return ((uint8_t)I2C->DR);
1180  0000 c65216        	ld	a,21014
1183  0003 81            	ret
1248                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1248                     ; 441 {
1249                     .text:	section	.text,new
1250  0000               _I2C_Send7bitAddress:
1252  0000 89            	pushw	x
1253       00000000      OFST:	set	0
1256                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1258                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1260                     ; 447   Address &= (uint8_t)0xFE;
1262  0001 7b01          	ld	a,(OFST+1,sp)
1263  0003 a4fe          	and	a,#254
1264  0005 6b01          	ld	(OFST+1,sp),a
1265                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1267  0007 7b01          	ld	a,(OFST+1,sp)
1268  0009 1a02          	or	a,(OFST+2,sp)
1269  000b c75216        	ld	21014,a
1270                     ; 451 }
1273  000e 85            	popw	x
1274  000f 81            	ret
1308                     ; 458 void I2C_SendData(uint8_t Data)
1308                     ; 459 {
1309                     .text:	section	.text,new
1310  0000               _I2C_SendData:
1314                     ; 461   I2C->DR = Data;
1316  0000 c75216        	ld	21014,a
1317                     ; 462 }
1320  0003 81            	ret
1544                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1544                     ; 579 {
1545                     .text:	section	.text,new
1546  0000               _I2C_CheckEvent:
1548  0000 89            	pushw	x
1549  0001 5206          	subw	sp,#6
1550       00000006      OFST:	set	6
1553                     ; 580   __IO uint16_t lastevent = 0x00;
1555  0003 5f            	clrw	x
1556  0004 1f04          	ldw	(OFST-2,sp),x
1558                     ; 581   uint8_t flag1 = 0x00 ;
1560                     ; 582   uint8_t flag2 = 0x00;
1562                     ; 583   ErrorStatus status = ERROR;
1564                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1566                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1568  0006 1e07          	ldw	x,(OFST+1,sp)
1569  0008 a30004        	cpw	x,#4
1570  000b 260b          	jrne	L136
1571                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1573  000d c65218        	ld	a,21016
1574  0010 a404          	and	a,#4
1575  0012 5f            	clrw	x
1576  0013 97            	ld	xl,a
1577  0014 1f04          	ldw	(OFST-2,sp),x
1580  0016 201f          	jra	L336
1581  0018               L136:
1582                     ; 594     flag1 = I2C->SR1;
1584  0018 c65217        	ld	a,21015
1585  001b 6b03          	ld	(OFST-3,sp),a
1587                     ; 595     flag2 = I2C->SR3;
1589  001d c65219        	ld	a,21017
1590  0020 6b06          	ld	(OFST+0,sp),a
1592                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1594  0022 7b03          	ld	a,(OFST-3,sp)
1595  0024 5f            	clrw	x
1596  0025 97            	ld	xl,a
1597  0026 1f01          	ldw	(OFST-5,sp),x
1599  0028 7b06          	ld	a,(OFST+0,sp)
1600  002a 5f            	clrw	x
1601  002b 97            	ld	xl,a
1602  002c 4f            	clr	a
1603  002d 02            	rlwa	x,a
1604  002e 01            	rrwa	x,a
1605  002f 1a02          	or	a,(OFST-4,sp)
1606  0031 01            	rrwa	x,a
1607  0032 1a01          	or	a,(OFST-5,sp)
1608  0034 01            	rrwa	x,a
1609  0035 1f04          	ldw	(OFST-2,sp),x
1611  0037               L336:
1612                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1614  0037 1e04          	ldw	x,(OFST-2,sp)
1615  0039 01            	rrwa	x,a
1616  003a 1408          	and	a,(OFST+2,sp)
1617  003c 01            	rrwa	x,a
1618  003d 1407          	and	a,(OFST+1,sp)
1619  003f 01            	rrwa	x,a
1620  0040 1307          	cpw	x,(OFST+1,sp)
1621  0042 2606          	jrne	L536
1622                     ; 602     status = SUCCESS;
1624  0044 a601          	ld	a,#1
1625  0046 6b06          	ld	(OFST+0,sp),a
1628  0048 2002          	jra	L736
1629  004a               L536:
1630                     ; 607     status = ERROR;
1632  004a 0f06          	clr	(OFST+0,sp)
1634  004c               L736:
1635                     ; 611   return status;
1637  004c 7b06          	ld	a,(OFST+0,sp)
1640  004e 5b08          	addw	sp,#8
1641  0050 81            	ret
1694                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1694                     ; 629 {
1695                     .text:	section	.text,new
1696  0000               _I2C_GetLastEvent:
1698  0000 5206          	subw	sp,#6
1699       00000006      OFST:	set	6
1702                     ; 630   __IO uint16_t lastevent = 0;
1704  0002 5f            	clrw	x
1705  0003 1f05          	ldw	(OFST-1,sp),x
1707                     ; 631   uint16_t flag1 = 0;
1709                     ; 632   uint16_t flag2 = 0;
1711                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1713  0005 c65218        	ld	a,21016
1714  0008 a504          	bcp	a,#4
1715  000a 2707          	jreq	L766
1716                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1718  000c ae0004        	ldw	x,#4
1719  000f 1f05          	ldw	(OFST-1,sp),x
1722  0011 201b          	jra	L176
1723  0013               L766:
1724                     ; 641     flag1 = I2C->SR1;
1726  0013 c65217        	ld	a,21015
1727  0016 5f            	clrw	x
1728  0017 97            	ld	xl,a
1729  0018 1f01          	ldw	(OFST-5,sp),x
1731                     ; 642     flag2 = I2C->SR3;
1733  001a c65219        	ld	a,21017
1734  001d 5f            	clrw	x
1735  001e 97            	ld	xl,a
1736  001f 1f03          	ldw	(OFST-3,sp),x
1738                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1740  0021 1e03          	ldw	x,(OFST-3,sp)
1741  0023 4f            	clr	a
1742  0024 02            	rlwa	x,a
1743  0025 01            	rrwa	x,a
1744  0026 1a02          	or	a,(OFST-4,sp)
1745  0028 01            	rrwa	x,a
1746  0029 1a01          	or	a,(OFST-5,sp)
1747  002b 01            	rrwa	x,a
1748  002c 1f05          	ldw	(OFST-1,sp),x
1750  002e               L176:
1751                     ; 648   return (I2C_Event_TypeDef)lastevent;
1753  002e 1e05          	ldw	x,(OFST-1,sp)
1756  0030 5b06          	addw	sp,#6
1757  0032 81            	ret
1972                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1972                     ; 680 {
1973                     .text:	section	.text,new
1974  0000               _I2C_GetFlagStatus:
1976  0000 89            	pushw	x
1977  0001 89            	pushw	x
1978       00000002      OFST:	set	2
1981                     ; 681   uint8_t tempreg = 0;
1983  0002 0f02          	clr	(OFST+0,sp)
1985                     ; 682   uint8_t regindex = 0;
1987                     ; 683   FlagStatus bitstatus = RESET;
1989                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1991                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1993  0004 9e            	ld	a,xh
1994  0005 6b01          	ld	(OFST-1,sp),a
1996                     ; 691   switch (regindex)
1998  0007 7b01          	ld	a,(OFST-1,sp)
2000                     ; 708     default:
2000                     ; 709       break;
2001  0009 4a            	dec	a
2002  000a 2708          	jreq	L376
2003  000c 4a            	dec	a
2004  000d 270c          	jreq	L576
2005  000f 4a            	dec	a
2006  0010 2710          	jreq	L776
2007  0012 2013          	jra	L3101
2008  0014               L376:
2009                     ; 694     case 0x01:
2009                     ; 695       tempreg = (uint8_t)I2C->SR1;
2011  0014 c65217        	ld	a,21015
2012  0017 6b02          	ld	(OFST+0,sp),a
2014                     ; 696       break;
2016  0019 200c          	jra	L3101
2017  001b               L576:
2018                     ; 699     case 0x02:
2018                     ; 700       tempreg = (uint8_t)I2C->SR2;
2020  001b c65218        	ld	a,21016
2021  001e 6b02          	ld	(OFST+0,sp),a
2023                     ; 701       break;
2025  0020 2005          	jra	L3101
2026  0022               L776:
2027                     ; 704     case 0x03:
2027                     ; 705       tempreg = (uint8_t)I2C->SR3;
2029  0022 c65219        	ld	a,21017
2030  0025 6b02          	ld	(OFST+0,sp),a
2032                     ; 706       break;
2034  0027               L107:
2035                     ; 708     default:
2035                     ; 709       break;
2037  0027               L3101:
2038                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2040  0027 7b04          	ld	a,(OFST+2,sp)
2041  0029 1502          	bcp	a,(OFST+0,sp)
2042  002b 2706          	jreq	L5101
2043                     ; 716     bitstatus = SET;
2045  002d a601          	ld	a,#1
2046  002f 6b02          	ld	(OFST+0,sp),a
2049  0031 2002          	jra	L7101
2050  0033               L5101:
2051                     ; 721     bitstatus = RESET;
2053  0033 0f02          	clr	(OFST+0,sp)
2055  0035               L7101:
2056                     ; 724   return bitstatus;
2058  0035 7b02          	ld	a,(OFST+0,sp)
2061  0037 5b04          	addw	sp,#4
2062  0039 81            	ret
2106                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2106                     ; 760 {
2107                     .text:	section	.text,new
2108  0000               _I2C_ClearFlag:
2110  0000 89            	pushw	x
2111       00000002      OFST:	set	2
2114                     ; 761   uint16_t flagpos = 0;
2116                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2118                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2120  0001 01            	rrwa	x,a
2121  0002 a4ff          	and	a,#255
2122  0004 5f            	clrw	x
2123  0005 02            	rlwa	x,a
2124  0006 1f01          	ldw	(OFST-1,sp),x
2125  0008 01            	rrwa	x,a
2127                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2129  0009 7b02          	ld	a,(OFST+0,sp)
2130  000b 43            	cpl	a
2131  000c c75218        	ld	21016,a
2132                     ; 769 }
2135  000f 85            	popw	x
2136  0010 81            	ret
2302                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2302                     ; 792 {
2303                     .text:	section	.text,new
2304  0000               _I2C_GetITStatus:
2306  0000 89            	pushw	x
2307  0001 5204          	subw	sp,#4
2308       00000004      OFST:	set	4
2311                     ; 793   ITStatus bitstatus = RESET;
2313                     ; 794   __IO uint8_t enablestatus = 0;
2315  0003 0f03          	clr	(OFST-1,sp)
2317                     ; 795   uint16_t tempregister = 0;
2319                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2321                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2323  0005 9e            	ld	a,xh
2324  0006 a407          	and	a,#7
2325  0008 5f            	clrw	x
2326  0009 97            	ld	xl,a
2327  000a 1f01          	ldw	(OFST-3,sp),x
2329                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2331  000c c6521a        	ld	a,21018
2332  000f 1402          	and	a,(OFST-2,sp)
2333  0011 6b03          	ld	(OFST-1,sp),a
2335                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2337  0013 7b05          	ld	a,(OFST+1,sp)
2338  0015 97            	ld	xl,a
2339  0016 7b06          	ld	a,(OFST+2,sp)
2340  0018 9f            	ld	a,xl
2341  0019 a430          	and	a,#48
2342  001b 97            	ld	xl,a
2343  001c 4f            	clr	a
2344  001d 02            	rlwa	x,a
2345  001e a30100        	cpw	x,#256
2346  0021 2615          	jrne	L1311
2347                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2349  0023 c65217        	ld	a,21015
2350  0026 1506          	bcp	a,(OFST+2,sp)
2351  0028 270a          	jreq	L3311
2353  002a 0d03          	tnz	(OFST-1,sp)
2354  002c 2706          	jreq	L3311
2355                     ; 811       bitstatus = SET;
2357  002e a601          	ld	a,#1
2358  0030 6b04          	ld	(OFST+0,sp),a
2361  0032 2017          	jra	L7311
2362  0034               L3311:
2363                     ; 816       bitstatus = RESET;
2365  0034 0f04          	clr	(OFST+0,sp)
2367  0036 2013          	jra	L7311
2368  0038               L1311:
2369                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2371  0038 c65218        	ld	a,21016
2372  003b 1506          	bcp	a,(OFST+2,sp)
2373  003d 270a          	jreq	L1411
2375  003f 0d03          	tnz	(OFST-1,sp)
2376  0041 2706          	jreq	L1411
2377                     ; 825       bitstatus = SET;
2379  0043 a601          	ld	a,#1
2380  0045 6b04          	ld	(OFST+0,sp),a
2383  0047 2002          	jra	L7311
2384  0049               L1411:
2385                     ; 830       bitstatus = RESET;
2387  0049 0f04          	clr	(OFST+0,sp)
2389  004b               L7311:
2390                     ; 834   return  bitstatus;
2392  004b 7b04          	ld	a,(OFST+0,sp)
2395  004d 5b06          	addw	sp,#6
2396  004f 81            	ret
2441                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2441                     ; 872 {
2442                     .text:	section	.text,new
2443  0000               _I2C_ClearITPendingBit:
2445  0000 89            	pushw	x
2446       00000002      OFST:	set	2
2449                     ; 873   uint16_t flagpos = 0;
2451                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2453                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2455  0001 01            	rrwa	x,a
2456  0002 a4ff          	and	a,#255
2457  0004 5f            	clrw	x
2458  0005 02            	rlwa	x,a
2459  0006 1f01          	ldw	(OFST-1,sp),x
2460  0008 01            	rrwa	x,a
2462                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2464  0009 7b02          	ld	a,(OFST+0,sp)
2465  000b 43            	cpl	a
2466  000c c75218        	ld	21016,a
2467                     ; 883 }
2470  000f 85            	popw	x
2471  0010 81            	ret
2484                     	xdef	_I2C_ClearITPendingBit
2485                     	xdef	_I2C_GetITStatus
2486                     	xdef	_I2C_ClearFlag
2487                     	xdef	_I2C_GetFlagStatus
2488                     	xdef	_I2C_GetLastEvent
2489                     	xdef	_I2C_CheckEvent
2490                     	xdef	_I2C_SendData
2491                     	xdef	_I2C_Send7bitAddress
2492                     	xdef	_I2C_ReceiveData
2493                     	xdef	_I2C_ITConfig
2494                     	xdef	_I2C_FastModeDutyCycleConfig
2495                     	xdef	_I2C_AcknowledgeConfig
2496                     	xdef	_I2C_StretchClockCmd
2497                     	xdef	_I2C_SoftwareResetCmd
2498                     	xdef	_I2C_GenerateSTOP
2499                     	xdef	_I2C_GenerateSTART
2500                     	xdef	_I2C_GeneralCallCmd
2501                     	xdef	_I2C_Cmd
2502                     	xdef	_I2C_Init
2503                     	xdef	_I2C_DeInit
2504                     	xref.b	c_lreg
2505                     	xref.b	c_x
2524                     	xref	c_sdivx
2525                     	xref	c_ludv
2526                     	xref	c_rtol
2527                     	xref	c_smul
2528                     	xref	c_lmul
2529                     	xref	c_lcmp
2530                     	xref	c_ltor
2531                     	end
