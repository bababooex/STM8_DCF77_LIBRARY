   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  43                     ; 52 void TIM2_DeInit(void)
  43                     ; 53 {
  45                     .text:	section	.text,new
  46  0000               _TIM2_DeInit:
  50                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  55  0004 725f5303      	clr	21251
  56                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  58  0008 725f5305      	clr	21253
  59                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  61  000c 725f530a      	clr	21258
  62                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  64  0010 725f530b      	clr	21259
  65                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  0014 725f530a      	clr	21258
  68                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0018 725f530b      	clr	21259
  71                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  73  001c 725f5307      	clr	21255
  74                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  76  0020 725f5308      	clr	21256
  77                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  79  0024 725f5309      	clr	21257
  80                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  82  0028 725f530c      	clr	21260
  83                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  85  002c 725f530d      	clr	21261
  86                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  88  0030 725f530e      	clr	21262
  89                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  91  0034 35ff530f      	mov	21263,#255
  92                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  94  0038 35ff5310      	mov	21264,#255
  95                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  97  003c 725f5311      	clr	21265
  98                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 100  0040 725f5312      	clr	21266
 101                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 103  0044 725f5313      	clr	21267
 104                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 106  0048 725f5314      	clr	21268
 107                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 109  004c 725f5315      	clr	21269
 110                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 112  0050 725f5316      	clr	21270
 113                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 115  0054 725f5304      	clr	21252
 116                     ; 81 }
 119  0058 81            	ret
 287                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 287                     ; 90                         uint16_t TIM2_Period)
 287                     ; 91 {
 288                     .text:	section	.text,new
 289  0000               _TIM2_TimeBaseInit:
 291  0000 88            	push	a
 292       00000000      OFST:	set	0
 295                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 297  0001 c7530e        	ld	21262,a
 298                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 300  0004 7b04          	ld	a,(OFST+4,sp)
 301  0006 c7530f        	ld	21263,a
 302                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 304  0009 7b05          	ld	a,(OFST+5,sp)
 305  000b c75310        	ld	21264,a
 306                     ; 97 }
 309  000e 84            	pop	a
 310  000f 81            	ret
 467                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 467                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 467                     ; 110                   uint16_t TIM2_Pulse,
 467                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 467                     ; 112 {
 468                     .text:	section	.text,new
 469  0000               _TIM2_OC1Init:
 471  0000 89            	pushw	x
 472  0001 88            	push	a
 473       00000001      OFST:	set	1
 476                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 478                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 480                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 482                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 484  0002 c6530a        	ld	a,21258
 485  0005 a4fc          	and	a,#252
 486  0007 c7530a        	ld	21258,a
 487                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 487                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 489  000a 7b08          	ld	a,(OFST+7,sp)
 490  000c a402          	and	a,#2
 491  000e 6b01          	ld	(OFST+0,sp),a
 493  0010 9f            	ld	a,xl
 494  0011 a401          	and	a,#1
 495  0013 1a01          	or	a,(OFST+0,sp)
 496  0015 ca530a        	or	a,21258
 497  0018 c7530a        	ld	21258,a
 498                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 498                     ; 126                           (uint8_t)TIM2_OCMode);
 500  001b c65307        	ld	a,21255
 501  001e a48f          	and	a,#143
 502  0020 1a02          	or	a,(OFST+1,sp)
 503  0022 c75307        	ld	21255,a
 504                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 506  0025 7b06          	ld	a,(OFST+5,sp)
 507  0027 c75311        	ld	21265,a
 508                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 510  002a 7b07          	ld	a,(OFST+6,sp)
 511  002c c75312        	ld	21266,a
 512                     ; 131 }
 515  002f 5b03          	addw	sp,#3
 516  0031 81            	ret
 580                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 580                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 580                     ; 144                   uint16_t TIM2_Pulse,
 580                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 580                     ; 146 {
 581                     .text:	section	.text,new
 582  0000               _TIM2_OC2Init:
 584  0000 89            	pushw	x
 585  0001 88            	push	a
 586       00000001      OFST:	set	1
 589                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 591                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 593                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 595                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 597  0002 c6530a        	ld	a,21258
 598  0005 a4cf          	and	a,#207
 599  0007 c7530a        	ld	21258,a
 600                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 600                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 602  000a 7b08          	ld	a,(OFST+7,sp)
 603  000c a420          	and	a,#32
 604  000e 6b01          	ld	(OFST+0,sp),a
 606  0010 9f            	ld	a,xl
 607  0011 a410          	and	a,#16
 608  0013 1a01          	or	a,(OFST+0,sp)
 609  0015 ca530a        	or	a,21258
 610  0018 c7530a        	ld	21258,a
 611                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 611                     ; 162                           (uint8_t)TIM2_OCMode);
 613  001b c65308        	ld	a,21256
 614  001e a48f          	and	a,#143
 615  0020 1a02          	or	a,(OFST+1,sp)
 616  0022 c75308        	ld	21256,a
 617                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 619  0025 7b06          	ld	a,(OFST+5,sp)
 620  0027 c75313        	ld	21267,a
 621                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 623  002a 7b07          	ld	a,(OFST+6,sp)
 624  002c c75314        	ld	21268,a
 625                     ; 168 }
 628  002f 5b03          	addw	sp,#3
 629  0031 81            	ret
 693                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 693                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 693                     ; 181                   uint16_t TIM2_Pulse,
 693                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 693                     ; 183 {
 694                     .text:	section	.text,new
 695  0000               _TIM2_OC3Init:
 697  0000 89            	pushw	x
 698  0001 88            	push	a
 699       00000001      OFST:	set	1
 702                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 704                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 706                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 708                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 710  0002 c6530b        	ld	a,21259
 711  0005 a4fc          	and	a,#252
 712  0007 c7530b        	ld	21259,a
 713                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 713                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 715  000a 7b08          	ld	a,(OFST+7,sp)
 716  000c a402          	and	a,#2
 717  000e 6b01          	ld	(OFST+0,sp),a
 719  0010 9f            	ld	a,xl
 720  0011 a401          	and	a,#1
 721  0013 1a01          	or	a,(OFST+0,sp)
 722  0015 ca530b        	or	a,21259
 723  0018 c7530b        	ld	21259,a
 724                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 724                     ; 196                           (uint8_t)TIM2_OCMode);
 726  001b c65309        	ld	a,21257
 727  001e a48f          	and	a,#143
 728  0020 1a02          	or	a,(OFST+1,sp)
 729  0022 c75309        	ld	21257,a
 730                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 732  0025 7b06          	ld	a,(OFST+5,sp)
 733  0027 c75315        	ld	21269,a
 734                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 736  002a 7b07          	ld	a,(OFST+6,sp)
 737  002c c75316        	ld	21270,a
 738                     ; 201 }
 741  002f 5b03          	addw	sp,#3
 742  0031 81            	ret
 935                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 935                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 935                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 935                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 935                     ; 216                  uint8_t TIM2_ICFilter)
 935                     ; 217 {
 936                     .text:	section	.text,new
 937  0000               _TIM2_ICInit:
 939  0000 89            	pushw	x
 940       00000000      OFST:	set	0
 943                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 945                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 947                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 949                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 951                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 953                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 955  0001 9e            	ld	a,xh
 956  0002 4d            	tnz	a
 957  0003 2614          	jrne	L104
 958                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 958                     ; 229                (uint8_t)TIM2_ICSelection,
 958                     ; 230                (uint8_t)TIM2_ICFilter);
 960  0005 7b07          	ld	a,(OFST+7,sp)
 961  0007 88            	push	a
 962  0008 7b06          	ld	a,(OFST+6,sp)
 963  000a 97            	ld	xl,a
 964  000b 7b03          	ld	a,(OFST+3,sp)
 965  000d 95            	ld	xh,a
 966  000e cd0000        	call	L3_TI1_Config
 968  0011 84            	pop	a
 969                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 971  0012 7b06          	ld	a,(OFST+6,sp)
 972  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 975  0017 202c          	jra	L304
 976  0019               L104:
 977                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 979  0019 7b01          	ld	a,(OFST+1,sp)
 980  001b a101          	cp	a,#1
 981  001d 2614          	jrne	L504
 982                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 982                     ; 239                (uint8_t)TIM2_ICSelection,
 982                     ; 240                (uint8_t)TIM2_ICFilter);
 984  001f 7b07          	ld	a,(OFST+7,sp)
 985  0021 88            	push	a
 986  0022 7b06          	ld	a,(OFST+6,sp)
 987  0024 97            	ld	xl,a
 988  0025 7b03          	ld	a,(OFST+3,sp)
 989  0027 95            	ld	xh,a
 990  0028 cd0000        	call	L5_TI2_Config
 992  002b 84            	pop	a
 993                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 995  002c 7b06          	ld	a,(OFST+6,sp)
 996  002e cd0000        	call	_TIM2_SetIC2Prescaler
 999  0031 2012          	jra	L304
1000  0033               L504:
1001                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1001                     ; 249                (uint8_t)TIM2_ICSelection,
1001                     ; 250                (uint8_t)TIM2_ICFilter);
1003  0033 7b07          	ld	a,(OFST+7,sp)
1004  0035 88            	push	a
1005  0036 7b06          	ld	a,(OFST+6,sp)
1006  0038 97            	ld	xl,a
1007  0039 7b03          	ld	a,(OFST+3,sp)
1008  003b 95            	ld	xh,a
1009  003c cd0000        	call	L7_TI3_Config
1011  003f 84            	pop	a
1012                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1014  0040 7b06          	ld	a,(OFST+6,sp)
1015  0042 cd0000        	call	_TIM2_SetIC3Prescaler
1017  0045               L304:
1018                     ; 255 }
1021  0045 85            	popw	x
1022  0046 81            	ret
1118                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1118                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1118                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1118                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1118                     ; 270                      uint8_t TIM2_ICFilter)
1118                     ; 271 {
1119                     .text:	section	.text,new
1120  0000               _TIM2_PWMIConfig:
1122  0000 89            	pushw	x
1123  0001 89            	pushw	x
1124       00000002      OFST:	set	2
1127                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1129                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1131                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1133                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1135                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1137                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1139                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1141  0002 9f            	ld	a,xl
1142  0003 a144          	cp	a,#68
1143  0005 2706          	jreq	L754
1144                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1146  0007 a644          	ld	a,#68
1147  0009 6b01          	ld	(OFST-1,sp),a
1150  000b 2002          	jra	L164
1151  000d               L754:
1152                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1154  000d 0f01          	clr	(OFST-1,sp)
1156  000f               L164:
1157                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1159  000f 7b07          	ld	a,(OFST+5,sp)
1160  0011 a101          	cp	a,#1
1161  0013 2606          	jrne	L364
1162                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1164  0015 a602          	ld	a,#2
1165  0017 6b02          	ld	(OFST+0,sp),a
1168  0019 2004          	jra	L564
1169  001b               L364:
1170                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1172  001b a601          	ld	a,#1
1173  001d 6b02          	ld	(OFST+0,sp),a
1175  001f               L564:
1176                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1178  001f 0d03          	tnz	(OFST+1,sp)
1179  0021 2626          	jrne	L764
1180                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1180                     ; 305                (uint8_t)TIM2_ICFilter);
1182  0023 7b09          	ld	a,(OFST+7,sp)
1183  0025 88            	push	a
1184  0026 7b08          	ld	a,(OFST+6,sp)
1185  0028 97            	ld	xl,a
1186  0029 7b05          	ld	a,(OFST+3,sp)
1187  002b 95            	ld	xh,a
1188  002c cd0000        	call	L3_TI1_Config
1190  002f 84            	pop	a
1191                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1193  0030 7b08          	ld	a,(OFST+6,sp)
1194  0032 cd0000        	call	_TIM2_SetIC1Prescaler
1196                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1198  0035 7b09          	ld	a,(OFST+7,sp)
1199  0037 88            	push	a
1200  0038 7b03          	ld	a,(OFST+1,sp)
1201  003a 97            	ld	xl,a
1202  003b 7b02          	ld	a,(OFST+0,sp)
1203  003d 95            	ld	xh,a
1204  003e cd0000        	call	L5_TI2_Config
1206  0041 84            	pop	a
1207                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1209  0042 7b08          	ld	a,(OFST+6,sp)
1210  0044 cd0000        	call	_TIM2_SetIC2Prescaler
1213  0047 2024          	jra	L174
1214  0049               L764:
1215                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1215                     ; 320                (uint8_t)TIM2_ICFilter);
1217  0049 7b09          	ld	a,(OFST+7,sp)
1218  004b 88            	push	a
1219  004c 7b08          	ld	a,(OFST+6,sp)
1220  004e 97            	ld	xl,a
1221  004f 7b05          	ld	a,(OFST+3,sp)
1222  0051 95            	ld	xh,a
1223  0052 cd0000        	call	L5_TI2_Config
1225  0055 84            	pop	a
1226                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1228  0056 7b08          	ld	a,(OFST+6,sp)
1229  0058 cd0000        	call	_TIM2_SetIC2Prescaler
1231                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1233  005b 7b09          	ld	a,(OFST+7,sp)
1234  005d 88            	push	a
1235  005e 7b03          	ld	a,(OFST+1,sp)
1236  0060 97            	ld	xl,a
1237  0061 7b02          	ld	a,(OFST+0,sp)
1238  0063 95            	ld	xh,a
1239  0064 cd0000        	call	L3_TI1_Config
1241  0067 84            	pop	a
1242                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1244  0068 7b08          	ld	a,(OFST+6,sp)
1245  006a cd0000        	call	_TIM2_SetIC1Prescaler
1247  006d               L174:
1248                     ; 331 }
1251  006d 5b04          	addw	sp,#4
1252  006f 81            	ret
1307                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1307                     ; 340 {
1308                     .text:	section	.text,new
1309  0000               _TIM2_Cmd:
1313                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1315                     ; 345   if (NewState != DISABLE)
1317  0000 4d            	tnz	a
1318  0001 2706          	jreq	L125
1319                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1321  0003 72105300      	bset	21248,#0
1323  0007 2004          	jra	L325
1324  0009               L125:
1325                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1327  0009 72115300      	bres	21248,#0
1328  000d               L325:
1329                     ; 353 }
1332  000d 81            	ret
1411                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1411                     ; 369 {
1412                     .text:	section	.text,new
1413  0000               _TIM2_ITConfig:
1415  0000 89            	pushw	x
1416       00000000      OFST:	set	0
1419                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1421                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1423                     ; 374   if (NewState != DISABLE)
1425  0001 9f            	ld	a,xl
1426  0002 4d            	tnz	a
1427  0003 2709          	jreq	L365
1428                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1430  0005 9e            	ld	a,xh
1431  0006 ca5303        	or	a,21251
1432  0009 c75303        	ld	21251,a
1434  000c 2009          	jra	L565
1435  000e               L365:
1436                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1438  000e 7b01          	ld	a,(OFST+1,sp)
1439  0010 43            	cpl	a
1440  0011 c45303        	and	a,21251
1441  0014 c75303        	ld	21251,a
1442  0017               L565:
1443                     ; 384 }
1446  0017 85            	popw	x
1447  0018 81            	ret
1483                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1483                     ; 393 {
1484                     .text:	section	.text,new
1485  0000               _TIM2_UpdateDisableConfig:
1489                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1491                     ; 398   if (NewState != DISABLE)
1493  0000 4d            	tnz	a
1494  0001 2706          	jreq	L506
1495                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1497  0003 72125300      	bset	21248,#1
1499  0007 2004          	jra	L706
1500  0009               L506:
1501                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1503  0009 72135300      	bres	21248,#1
1504  000d               L706:
1505                     ; 406 }
1508  000d 81            	ret
1566                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1566                     ; 417 {
1567                     .text:	section	.text,new
1568  0000               _TIM2_UpdateRequestConfig:
1572                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1574                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1576  0000 4d            	tnz	a
1577  0001 2706          	jreq	L736
1578                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1580  0003 72145300      	bset	21248,#2
1582  0007 2004          	jra	L146
1583  0009               L736:
1584                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1586  0009 72155300      	bres	21248,#2
1587  000d               L146:
1588                     ; 430 }
1591  000d 81            	ret
1648                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1648                     ; 441 {
1649                     .text:	section	.text,new
1650  0000               _TIM2_SelectOnePulseMode:
1654                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1656                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1658  0000 4d            	tnz	a
1659  0001 2706          	jreq	L176
1660                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1662  0003 72165300      	bset	21248,#3
1664  0007 2004          	jra	L376
1665  0009               L176:
1666                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1668  0009 72175300      	bres	21248,#3
1669  000d               L376:
1670                     ; 454 }
1673  000d 81            	ret
1741                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1741                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1741                     ; 486 {
1742                     .text:	section	.text,new
1743  0000               _TIM2_PrescalerConfig:
1747                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1749                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1751                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1753  0000 9e            	ld	a,xh
1754  0001 c7530e        	ld	21262,a
1755                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1757  0004 9f            	ld	a,xl
1758  0005 c75306        	ld	21254,a
1759                     ; 496 }
1762  0008 81            	ret
1820                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1820                     ; 508 {
1821                     .text:	section	.text,new
1822  0000               _TIM2_ForcedOC1Config:
1824  0000 88            	push	a
1825       00000000      OFST:	set	0
1828                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1830                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1830                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1832  0001 c65307        	ld	a,21255
1833  0004 a48f          	and	a,#143
1834  0006 1a01          	or	a,(OFST+1,sp)
1835  0008 c75307        	ld	21255,a
1836                     ; 515 }
1839  000b 84            	pop	a
1840  000c 81            	ret
1876                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1876                     ; 527 {
1877                     .text:	section	.text,new
1878  0000               _TIM2_ForcedOC2Config:
1880  0000 88            	push	a
1881       00000000      OFST:	set	0
1884                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1886                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1886                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1888  0001 c65308        	ld	a,21256
1889  0004 a48f          	and	a,#143
1890  0006 1a01          	or	a,(OFST+1,sp)
1891  0008 c75308        	ld	21256,a
1892                     ; 534 }
1895  000b 84            	pop	a
1896  000c 81            	ret
1932                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1932                     ; 546 {
1933                     .text:	section	.text,new
1934  0000               _TIM2_ForcedOC3Config:
1936  0000 88            	push	a
1937       00000000      OFST:	set	0
1940                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1942                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1942                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1944  0001 c65309        	ld	a,21257
1945  0004 a48f          	and	a,#143
1946  0006 1a01          	or	a,(OFST+1,sp)
1947  0008 c75309        	ld	21257,a
1948                     ; 553 }
1951  000b 84            	pop	a
1952  000c 81            	ret
1988                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1988                     ; 562 {
1989                     .text:	section	.text,new
1990  0000               _TIM2_ARRPreloadConfig:
1994                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1996                     ; 567   if (NewState != DISABLE)
1998  0000 4d            	tnz	a
1999  0001 2706          	jreq	L7201
2000                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2002  0003 721e5300      	bset	21248,#7
2004  0007 2004          	jra	L1301
2005  0009               L7201:
2006                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2008  0009 721f5300      	bres	21248,#7
2009  000d               L1301:
2010                     ; 575 }
2013  000d 81            	ret
2049                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2049                     ; 584 {
2050                     .text:	section	.text,new
2051  0000               _TIM2_OC1PreloadConfig:
2055                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2057                     ; 589   if (NewState != DISABLE)
2059  0000 4d            	tnz	a
2060  0001 2706          	jreq	L1501
2061                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2063  0003 72165307      	bset	21255,#3
2065  0007 2004          	jra	L3501
2066  0009               L1501:
2067                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2069  0009 72175307      	bres	21255,#3
2070  000d               L3501:
2071                     ; 597 }
2074  000d 81            	ret
2110                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2110                     ; 606 {
2111                     .text:	section	.text,new
2112  0000               _TIM2_OC2PreloadConfig:
2116                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2118                     ; 611   if (NewState != DISABLE)
2120  0000 4d            	tnz	a
2121  0001 2706          	jreq	L3701
2122                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2124  0003 72165308      	bset	21256,#3
2126  0007 2004          	jra	L5701
2127  0009               L3701:
2128                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2130  0009 72175308      	bres	21256,#3
2131  000d               L5701:
2132                     ; 619 }
2135  000d 81            	ret
2171                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2171                     ; 628 {
2172                     .text:	section	.text,new
2173  0000               _TIM2_OC3PreloadConfig:
2177                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2179                     ; 633   if (NewState != DISABLE)
2181  0000 4d            	tnz	a
2182  0001 2706          	jreq	L5111
2183                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2185  0003 72165309      	bset	21257,#3
2187  0007 2004          	jra	L7111
2188  0009               L5111:
2189                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2191  0009 72175309      	bres	21257,#3
2192  000d               L7111:
2193                     ; 641 }
2196  000d 81            	ret
2269                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2269                     ; 654 {
2270                     .text:	section	.text,new
2271  0000               _TIM2_GenerateEvent:
2275                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2277                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2279  0000 c75306        	ld	21254,a
2280                     ; 660 }
2283  0003 81            	ret
2319                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2319                     ; 671 {
2320                     .text:	section	.text,new
2321  0000               _TIM2_OC1PolarityConfig:
2325                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2327                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2329  0000 4d            	tnz	a
2330  0001 2706          	jreq	L1711
2331                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2333  0003 7212530a      	bset	21258,#1
2335  0007 2004          	jra	L3711
2336  0009               L1711:
2337                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2339  0009 7213530a      	bres	21258,#1
2340  000d               L3711:
2341                     ; 684 }
2344  000d 81            	ret
2380                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2380                     ; 695 {
2381                     .text:	section	.text,new
2382  0000               _TIM2_OC2PolarityConfig:
2386                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2388                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2390  0000 4d            	tnz	a
2391  0001 2706          	jreq	L3121
2392                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2394  0003 721a530a      	bset	21258,#5
2396  0007 2004          	jra	L5121
2397  0009               L3121:
2398                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2400  0009 721b530a      	bres	21258,#5
2401  000d               L5121:
2402                     ; 708 }
2405  000d 81            	ret
2441                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2441                     ; 719 {
2442                     .text:	section	.text,new
2443  0000               _TIM2_OC3PolarityConfig:
2447                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2449                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2451  0000 4d            	tnz	a
2452  0001 2706          	jreq	L5321
2453                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2455  0003 7212530b      	bset	21259,#1
2457  0007 2004          	jra	L7321
2458  0009               L5321:
2459                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2461  0009 7213530b      	bres	21259,#1
2462  000d               L7321:
2463                     ; 732 }
2466  000d 81            	ret
2511                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2511                     ; 746 {
2512                     .text:	section	.text,new
2513  0000               _TIM2_CCxCmd:
2515  0000 89            	pushw	x
2516       00000000      OFST:	set	0
2519                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2521                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2523                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2525  0001 9e            	ld	a,xh
2526  0002 4d            	tnz	a
2527  0003 2610          	jrne	L3621
2528                     ; 754     if (NewState != DISABLE)
2530  0005 9f            	ld	a,xl
2531  0006 4d            	tnz	a
2532  0007 2706          	jreq	L5621
2533                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2535  0009 7210530a      	bset	21258,#0
2537  000d 202a          	jra	L1721
2538  000f               L5621:
2539                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2541  000f 7211530a      	bres	21258,#0
2542  0013 2024          	jra	L1721
2543  0015               L3621:
2544                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2546  0015 7b01          	ld	a,(OFST+1,sp)
2547  0017 a101          	cp	a,#1
2548  0019 2610          	jrne	L3721
2549                     ; 767     if (NewState != DISABLE)
2551  001b 0d02          	tnz	(OFST+2,sp)
2552  001d 2706          	jreq	L5721
2553                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2555  001f 7218530a      	bset	21258,#4
2557  0023 2014          	jra	L1721
2558  0025               L5721:
2559                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2561  0025 7219530a      	bres	21258,#4
2562  0029 200e          	jra	L1721
2563  002b               L3721:
2564                     ; 779     if (NewState != DISABLE)
2566  002b 0d02          	tnz	(OFST+2,sp)
2567  002d 2706          	jreq	L3031
2568                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2570  002f 7210530b      	bset	21259,#0
2572  0033 2004          	jra	L1721
2573  0035               L3031:
2574                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2576  0035 7211530b      	bres	21259,#0
2577  0039               L1721:
2578                     ; 788 }
2581  0039 85            	popw	x
2582  003a 81            	ret
2627                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2627                     ; 811 {
2628                     .text:	section	.text,new
2629  0000               _TIM2_SelectOCxM:
2631  0000 89            	pushw	x
2632       00000000      OFST:	set	0
2635                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2637                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2639                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2641  0001 9e            	ld	a,xh
2642  0002 4d            	tnz	a
2643  0003 2610          	jrne	L1331
2644                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2646  0005 7211530a      	bres	21258,#0
2647                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2647                     ; 823                             | (uint8_t)TIM2_OCMode);
2649  0009 c65307        	ld	a,21255
2650  000c a48f          	and	a,#143
2651  000e 1a02          	or	a,(OFST+2,sp)
2652  0010 c75307        	ld	21255,a
2654  0013 2024          	jra	L3331
2655  0015               L1331:
2656                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2658  0015 7b01          	ld	a,(OFST+1,sp)
2659  0017 a101          	cp	a,#1
2660  0019 2610          	jrne	L5331
2661                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2663  001b 7219530a      	bres	21258,#4
2664                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2664                     ; 832                             | (uint8_t)TIM2_OCMode);
2666  001f c65308        	ld	a,21256
2667  0022 a48f          	and	a,#143
2668  0024 1a02          	or	a,(OFST+2,sp)
2669  0026 c75308        	ld	21256,a
2671  0029 200e          	jra	L3331
2672  002b               L5331:
2673                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2675  002b 7211530b      	bres	21259,#0
2676                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2676                     ; 841                             | (uint8_t)TIM2_OCMode);
2678  002f c65309        	ld	a,21257
2679  0032 a48f          	and	a,#143
2680  0034 1a02          	or	a,(OFST+2,sp)
2681  0036 c75309        	ld	21257,a
2682  0039               L3331:
2683                     ; 843 }
2686  0039 85            	popw	x
2687  003a 81            	ret
2721                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2721                     ; 852 {
2722                     .text:	section	.text,new
2723  0000               _TIM2_SetCounter:
2727                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2729  0000 9e            	ld	a,xh
2730  0001 c7530c        	ld	21260,a
2731                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2733  0004 9f            	ld	a,xl
2734  0005 c7530d        	ld	21261,a
2735                     ; 856 }
2738  0008 81            	ret
2772                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2772                     ; 865 {
2773                     .text:	section	.text,new
2774  0000               _TIM2_SetAutoreload:
2778                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2780  0000 9e            	ld	a,xh
2781  0001 c7530f        	ld	21263,a
2782                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2784  0004 9f            	ld	a,xl
2785  0005 c75310        	ld	21264,a
2786                     ; 869 }
2789  0008 81            	ret
2823                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2823                     ; 878 {
2824                     .text:	section	.text,new
2825  0000               _TIM2_SetCompare1:
2829                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2831  0000 9e            	ld	a,xh
2832  0001 c75311        	ld	21265,a
2833                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2835  0004 9f            	ld	a,xl
2836  0005 c75312        	ld	21266,a
2837                     ; 882 }
2840  0008 81            	ret
2874                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2874                     ; 891 {
2875                     .text:	section	.text,new
2876  0000               _TIM2_SetCompare2:
2880                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2882  0000 9e            	ld	a,xh
2883  0001 c75313        	ld	21267,a
2884                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2886  0004 9f            	ld	a,xl
2887  0005 c75314        	ld	21268,a
2888                     ; 895 }
2891  0008 81            	ret
2925                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2925                     ; 904 {
2926                     .text:	section	.text,new
2927  0000               _TIM2_SetCompare3:
2931                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2933  0000 9e            	ld	a,xh
2934  0001 c75315        	ld	21269,a
2935                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2937  0004 9f            	ld	a,xl
2938  0005 c75316        	ld	21270,a
2939                     ; 908 }
2942  0008 81            	ret
2978                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2978                     ; 921 {
2979                     .text:	section	.text,new
2980  0000               _TIM2_SetIC1Prescaler:
2982  0000 88            	push	a
2983       00000000      OFST:	set	0
2986                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2988                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2988                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2990  0001 c65307        	ld	a,21255
2991  0004 a4f3          	and	a,#243
2992  0006 1a01          	or	a,(OFST+1,sp)
2993  0008 c75307        	ld	21255,a
2994                     ; 928 }
2997  000b 84            	pop	a
2998  000c 81            	ret
3034                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3034                     ; 941 {
3035                     .text:	section	.text,new
3036  0000               _TIM2_SetIC2Prescaler:
3038  0000 88            	push	a
3039       00000000      OFST:	set	0
3042                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3044                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3044                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3046  0001 c65308        	ld	a,21256
3047  0004 a4f3          	and	a,#243
3048  0006 1a01          	or	a,(OFST+1,sp)
3049  0008 c75308        	ld	21256,a
3050                     ; 948 }
3053  000b 84            	pop	a
3054  000c 81            	ret
3090                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3090                     ; 961 {
3091                     .text:	section	.text,new
3092  0000               _TIM2_SetIC3Prescaler:
3094  0000 88            	push	a
3095       00000000      OFST:	set	0
3098                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3100                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3100                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3102  0001 c65309        	ld	a,21257
3103  0004 a4f3          	and	a,#243
3104  0006 1a01          	or	a,(OFST+1,sp)
3105  0008 c75309        	ld	21257,a
3106                     ; 968 }
3109  000b 84            	pop	a
3110  000c 81            	ret
3162                     ; 975 uint16_t TIM2_GetCapture1(void)
3162                     ; 976 {
3163                     .text:	section	.text,new
3164  0000               _TIM2_GetCapture1:
3166  0000 5204          	subw	sp,#4
3167       00000004      OFST:	set	4
3170                     ; 978   uint16_t tmpccr1 = 0;
3172                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3176                     ; 981   tmpccr1h = TIM2->CCR1H;
3178  0002 c65311        	ld	a,21265
3179  0005 6b02          	ld	(OFST-2,sp),a
3181                     ; 982   tmpccr1l = TIM2->CCR1L;
3183  0007 c65312        	ld	a,21266
3184  000a 6b01          	ld	(OFST-3,sp),a
3186                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3188  000c 7b01          	ld	a,(OFST-3,sp)
3189  000e 5f            	clrw	x
3190  000f 97            	ld	xl,a
3191  0010 1f03          	ldw	(OFST-1,sp),x
3193                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3195  0012 7b02          	ld	a,(OFST-2,sp)
3196  0014 5f            	clrw	x
3197  0015 97            	ld	xl,a
3198  0016 4f            	clr	a
3199  0017 02            	rlwa	x,a
3200  0018 01            	rrwa	x,a
3201  0019 1a04          	or	a,(OFST+0,sp)
3202  001b 01            	rrwa	x,a
3203  001c 1a03          	or	a,(OFST-1,sp)
3204  001e 01            	rrwa	x,a
3205  001f 1f03          	ldw	(OFST-1,sp),x
3207                     ; 987   return (uint16_t)tmpccr1;
3209  0021 1e03          	ldw	x,(OFST-1,sp)
3212  0023 5b04          	addw	sp,#4
3213  0025 81            	ret
3265                     ; 995 uint16_t TIM2_GetCapture2(void)
3265                     ; 996 {
3266                     .text:	section	.text,new
3267  0000               _TIM2_GetCapture2:
3269  0000 5204          	subw	sp,#4
3270       00000004      OFST:	set	4
3273                     ; 998   uint16_t tmpccr2 = 0;
3275                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3279                     ; 1001   tmpccr2h = TIM2->CCR2H;
3281  0002 c65313        	ld	a,21267
3282  0005 6b02          	ld	(OFST-2,sp),a
3284                     ; 1002   tmpccr2l = TIM2->CCR2L;
3286  0007 c65314        	ld	a,21268
3287  000a 6b01          	ld	(OFST-3,sp),a
3289                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3291  000c 7b01          	ld	a,(OFST-3,sp)
3292  000e 5f            	clrw	x
3293  000f 97            	ld	xl,a
3294  0010 1f03          	ldw	(OFST-1,sp),x
3296                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3298  0012 7b02          	ld	a,(OFST-2,sp)
3299  0014 5f            	clrw	x
3300  0015 97            	ld	xl,a
3301  0016 4f            	clr	a
3302  0017 02            	rlwa	x,a
3303  0018 01            	rrwa	x,a
3304  0019 1a04          	or	a,(OFST+0,sp)
3305  001b 01            	rrwa	x,a
3306  001c 1a03          	or	a,(OFST-1,sp)
3307  001e 01            	rrwa	x,a
3308  001f 1f03          	ldw	(OFST-1,sp),x
3310                     ; 1007   return (uint16_t)tmpccr2;
3312  0021 1e03          	ldw	x,(OFST-1,sp)
3315  0023 5b04          	addw	sp,#4
3316  0025 81            	ret
3368                     ; 1015 uint16_t TIM2_GetCapture3(void)
3368                     ; 1016 {
3369                     .text:	section	.text,new
3370  0000               _TIM2_GetCapture3:
3372  0000 5204          	subw	sp,#4
3373       00000004      OFST:	set	4
3376                     ; 1018   uint16_t tmpccr3 = 0;
3378                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3382                     ; 1021   tmpccr3h = TIM2->CCR3H;
3384  0002 c65315        	ld	a,21269
3385  0005 6b02          	ld	(OFST-2,sp),a
3387                     ; 1022   tmpccr3l = TIM2->CCR3L;
3389  0007 c65316        	ld	a,21270
3390  000a 6b01          	ld	(OFST-3,sp),a
3392                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3394  000c 7b01          	ld	a,(OFST-3,sp)
3395  000e 5f            	clrw	x
3396  000f 97            	ld	xl,a
3397  0010 1f03          	ldw	(OFST-1,sp),x
3399                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3401  0012 7b02          	ld	a,(OFST-2,sp)
3402  0014 5f            	clrw	x
3403  0015 97            	ld	xl,a
3404  0016 4f            	clr	a
3405  0017 02            	rlwa	x,a
3406  0018 01            	rrwa	x,a
3407  0019 1a04          	or	a,(OFST+0,sp)
3408  001b 01            	rrwa	x,a
3409  001c 1a03          	or	a,(OFST-1,sp)
3410  001e 01            	rrwa	x,a
3411  001f 1f03          	ldw	(OFST-1,sp),x
3413                     ; 1027   return (uint16_t)tmpccr3;
3415  0021 1e03          	ldw	x,(OFST-1,sp)
3418  0023 5b04          	addw	sp,#4
3419  0025 81            	ret
3453                     ; 1035 uint16_t TIM2_GetCounter(void)
3453                     ; 1036 {
3454                     .text:	section	.text,new
3455  0000               _TIM2_GetCounter:
3457  0000 89            	pushw	x
3458       00000002      OFST:	set	2
3461                     ; 1037   uint16_t tmpcntr = 0;
3463                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3465  0001 c6530c        	ld	a,21260
3466  0004 5f            	clrw	x
3467  0005 97            	ld	xl,a
3468  0006 4f            	clr	a
3469  0007 02            	rlwa	x,a
3470  0008 1f01          	ldw	(OFST-1,sp),x
3472                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3474  000a c6530d        	ld	a,21261
3475  000d 5f            	clrw	x
3476  000e 97            	ld	xl,a
3477  000f 01            	rrwa	x,a
3478  0010 1a02          	or	a,(OFST+0,sp)
3479  0012 01            	rrwa	x,a
3480  0013 1a01          	or	a,(OFST-1,sp)
3481  0015 01            	rrwa	x,a
3484  0016 5b02          	addw	sp,#2
3485  0018 81            	ret
3509                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3509                     ; 1050 {
3510                     .text:	section	.text,new
3511  0000               _TIM2_GetPrescaler:
3515                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3517  0000 c6530e        	ld	a,21262
3520  0003 81            	ret
3659                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3659                     ; 1069 {
3660                     .text:	section	.text,new
3661  0000               _TIM2_GetFlagStatus:
3663  0000 89            	pushw	x
3664  0001 89            	pushw	x
3665       00000002      OFST:	set	2
3668                     ; 1070   FlagStatus bitstatus = RESET;
3670                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3674                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3676                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3678  0002 9f            	ld	a,xl
3679  0003 c45304        	and	a,21252
3680  0006 6b01          	ld	(OFST-1,sp),a
3682                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3684  0008 7b03          	ld	a,(OFST+1,sp)
3685  000a 6b02          	ld	(OFST+0,sp),a
3687                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3689  000c c65305        	ld	a,21253
3690  000f 1402          	and	a,(OFST+0,sp)
3691  0011 1a01          	or	a,(OFST-1,sp)
3692  0013 2706          	jreq	L5371
3693                     ; 1081     bitstatus = SET;
3695  0015 a601          	ld	a,#1
3696  0017 6b02          	ld	(OFST+0,sp),a
3699  0019 2002          	jra	L7371
3700  001b               L5371:
3701                     ; 1085     bitstatus = RESET;
3703  001b 0f02          	clr	(OFST+0,sp)
3705  001d               L7371:
3706                     ; 1087   return (FlagStatus)bitstatus;
3708  001d 7b02          	ld	a,(OFST+0,sp)
3711  001f 5b04          	addw	sp,#4
3712  0021 81            	ret
3747                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3747                     ; 1104 {
3748                     .text:	section	.text,new
3749  0000               _TIM2_ClearFlag:
3753                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3755                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3757  0000 9f            	ld	a,xl
3758  0001 43            	cpl	a
3759  0002 c75304        	ld	21252,a
3760                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3762  0005 35ff5305      	mov	21253,#255
3763                     ; 1111 }
3766  0009 81            	ret
3830                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3830                     ; 1124 {
3831                     .text:	section	.text,new
3832  0000               _TIM2_GetITStatus:
3834  0000 88            	push	a
3835  0001 89            	pushw	x
3836       00000002      OFST:	set	2
3839                     ; 1125   ITStatus bitstatus = RESET;
3841                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3845                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3847                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3849  0002 c45304        	and	a,21252
3850  0005 6b01          	ld	(OFST-1,sp),a
3852                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3854  0007 c65303        	ld	a,21251
3855  000a 1403          	and	a,(OFST+1,sp)
3856  000c 6b02          	ld	(OFST+0,sp),a
3858                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3860  000e 0d01          	tnz	(OFST-1,sp)
3861  0010 270a          	jreq	L1102
3863  0012 0d02          	tnz	(OFST+0,sp)
3864  0014 2706          	jreq	L1102
3865                     ; 1137     bitstatus = SET;
3867  0016 a601          	ld	a,#1
3868  0018 6b02          	ld	(OFST+0,sp),a
3871  001a 2002          	jra	L3102
3872  001c               L1102:
3873                     ; 1141     bitstatus = RESET;
3875  001c 0f02          	clr	(OFST+0,sp)
3877  001e               L3102:
3878                     ; 1143   return (ITStatus)(bitstatus);
3880  001e 7b02          	ld	a,(OFST+0,sp)
3883  0020 5b03          	addw	sp,#3
3884  0022 81            	ret
3920                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3920                     ; 1157 {
3921                     .text:	section	.text,new
3922  0000               _TIM2_ClearITPendingBit:
3926                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3928                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3930  0000 43            	cpl	a
3931  0001 c75304        	ld	21252,a
3932                     ; 1163 }
3935  0004 81            	ret
3987                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3987                     ; 1182                        uint8_t TIM2_ICSelection,
3987                     ; 1183                        uint8_t TIM2_ICFilter)
3987                     ; 1184 {
3988                     .text:	section	.text,new
3989  0000               L3_TI1_Config:
3991  0000 89            	pushw	x
3992  0001 88            	push	a
3993       00000001      OFST:	set	1
3996                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3998  0002 7211530a      	bres	21258,#0
3999                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3999                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4001  0006 7b06          	ld	a,(OFST+5,sp)
4002  0008 97            	ld	xl,a
4003  0009 a610          	ld	a,#16
4004  000b 42            	mul	x,a
4005  000c 9f            	ld	a,xl
4006  000d 1a03          	or	a,(OFST+2,sp)
4007  000f 6b01          	ld	(OFST+0,sp),a
4009  0011 c65307        	ld	a,21255
4010  0014 a40c          	and	a,#12
4011  0016 1a01          	or	a,(OFST+0,sp)
4012  0018 c75307        	ld	21255,a
4013                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4015  001b 0d02          	tnz	(OFST+1,sp)
4016  001d 2706          	jreq	L1602
4017                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4019  001f 7212530a      	bset	21258,#1
4021  0023 2004          	jra	L3602
4022  0025               L1602:
4023                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4025  0025 7213530a      	bres	21258,#1
4026  0029               L3602:
4027                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4029  0029 7210530a      	bset	21258,#0
4030                     ; 1203 }
4033  002d 5b03          	addw	sp,#3
4034  002f 81            	ret
4086                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4086                     ; 1222                        uint8_t TIM2_ICSelection,
4086                     ; 1223                        uint8_t TIM2_ICFilter)
4086                     ; 1224 {
4087                     .text:	section	.text,new
4088  0000               L5_TI2_Config:
4090  0000 89            	pushw	x
4091  0001 88            	push	a
4092       00000001      OFST:	set	1
4095                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4097  0002 7219530a      	bres	21258,#4
4098                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4098                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4100  0006 7b06          	ld	a,(OFST+5,sp)
4101  0008 97            	ld	xl,a
4102  0009 a610          	ld	a,#16
4103  000b 42            	mul	x,a
4104  000c 9f            	ld	a,xl
4105  000d 1a03          	or	a,(OFST+2,sp)
4106  000f 6b01          	ld	(OFST+0,sp),a
4108  0011 c65308        	ld	a,21256
4109  0014 a40c          	and	a,#12
4110  0016 1a01          	or	a,(OFST+0,sp)
4111  0018 c75308        	ld	21256,a
4112                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4114  001b 0d02          	tnz	(OFST+1,sp)
4115  001d 2706          	jreq	L3112
4116                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4118  001f 721a530a      	bset	21258,#5
4120  0023 2004          	jra	L5112
4121  0025               L3112:
4122                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4124  0025 721b530a      	bres	21258,#5
4125  0029               L5112:
4126                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4128  0029 7218530a      	bset	21258,#4
4129                     ; 1245 }
4132  002d 5b03          	addw	sp,#3
4133  002f 81            	ret
4185                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4185                     ; 1262                        uint8_t TIM2_ICFilter)
4185                     ; 1263 {
4186                     .text:	section	.text,new
4187  0000               L7_TI3_Config:
4189  0000 89            	pushw	x
4190  0001 88            	push	a
4191       00000001      OFST:	set	1
4194                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4196  0002 7211530b      	bres	21259,#0
4197                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4197                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4199  0006 7b06          	ld	a,(OFST+5,sp)
4200  0008 97            	ld	xl,a
4201  0009 a610          	ld	a,#16
4202  000b 42            	mul	x,a
4203  000c 9f            	ld	a,xl
4204  000d 1a03          	or	a,(OFST+2,sp)
4205  000f 6b01          	ld	(OFST+0,sp),a
4207  0011 c65309        	ld	a,21257
4208  0014 a40c          	and	a,#12
4209  0016 1a01          	or	a,(OFST+0,sp)
4210  0018 c75309        	ld	21257,a
4211                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4213  001b 0d02          	tnz	(OFST+1,sp)
4214  001d 2706          	jreq	L5412
4215                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4217  001f 7212530b      	bset	21259,#1
4219  0023 2004          	jra	L7412
4220  0025               L5412:
4221                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4223  0025 7213530b      	bres	21259,#1
4224  0029               L7412:
4225                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4227  0029 7210530b      	bset	21259,#0
4228                     ; 1283 }
4231  002d 5b03          	addw	sp,#3
4232  002f 81            	ret
4245                     	xdef	_TIM2_ClearITPendingBit
4246                     	xdef	_TIM2_GetITStatus
4247                     	xdef	_TIM2_ClearFlag
4248                     	xdef	_TIM2_GetFlagStatus
4249                     	xdef	_TIM2_GetPrescaler
4250                     	xdef	_TIM2_GetCounter
4251                     	xdef	_TIM2_GetCapture3
4252                     	xdef	_TIM2_GetCapture2
4253                     	xdef	_TIM2_GetCapture1
4254                     	xdef	_TIM2_SetIC3Prescaler
4255                     	xdef	_TIM2_SetIC2Prescaler
4256                     	xdef	_TIM2_SetIC1Prescaler
4257                     	xdef	_TIM2_SetCompare3
4258                     	xdef	_TIM2_SetCompare2
4259                     	xdef	_TIM2_SetCompare1
4260                     	xdef	_TIM2_SetAutoreload
4261                     	xdef	_TIM2_SetCounter
4262                     	xdef	_TIM2_SelectOCxM
4263                     	xdef	_TIM2_CCxCmd
4264                     	xdef	_TIM2_OC3PolarityConfig
4265                     	xdef	_TIM2_OC2PolarityConfig
4266                     	xdef	_TIM2_OC1PolarityConfig
4267                     	xdef	_TIM2_GenerateEvent
4268                     	xdef	_TIM2_OC3PreloadConfig
4269                     	xdef	_TIM2_OC2PreloadConfig
4270                     	xdef	_TIM2_OC1PreloadConfig
4271                     	xdef	_TIM2_ARRPreloadConfig
4272                     	xdef	_TIM2_ForcedOC3Config
4273                     	xdef	_TIM2_ForcedOC2Config
4274                     	xdef	_TIM2_ForcedOC1Config
4275                     	xdef	_TIM2_PrescalerConfig
4276                     	xdef	_TIM2_SelectOnePulseMode
4277                     	xdef	_TIM2_UpdateRequestConfig
4278                     	xdef	_TIM2_UpdateDisableConfig
4279                     	xdef	_TIM2_ITConfig
4280                     	xdef	_TIM2_Cmd
4281                     	xdef	_TIM2_PWMIConfig
4282                     	xdef	_TIM2_ICInit
4283                     	xdef	_TIM2_OC3Init
4284                     	xdef	_TIM2_OC2Init
4285                     	xdef	_TIM2_OC1Init
4286                     	xdef	_TIM2_TimeBaseInit
4287                     	xdef	_TIM2_DeInit
4306                     	end
