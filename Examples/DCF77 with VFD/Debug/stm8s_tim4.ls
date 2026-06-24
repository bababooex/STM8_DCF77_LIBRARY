   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.6 - 07 Jan 2026
  43                     ; 49 void TIM4_DeInit(void)
  43                     ; 50 {
  45                     .text:	section	.text,new
  46  0000               _TIM4_DeInit:
  50                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  52  0000 725f5340      	clr	21312
  53                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  55  0004 725f5343      	clr	21315
  56                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  58  0008 725f5346      	clr	21318
  59                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  61  000c 725f5347      	clr	21319
  62                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  64  0010 35ff5348      	mov	21320,#255
  65                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  67  0014 725f5344      	clr	21316
  68                     ; 57 }
  71  0018 81            	ret
 177                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 177                     ; 66 {
 178                     .text:	section	.text,new
 179  0000               _TIM4_TimeBaseInit:
 183                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 185                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 187  0000 9e            	ld	a,xh
 188  0001 c75347        	ld	21319,a
 189                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 191  0004 9f            	ld	a,xl
 192  0005 c75348        	ld	21320,a
 193                     ; 73 }
 196  0008 81            	ret
 251                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 251                     ; 82 {
 252                     .text:	section	.text,new
 253  0000               _TIM4_Cmd:
 257                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 259                     ; 87   if (NewState != DISABLE)
 261  0000 4d            	tnz	a
 262  0001 2706          	jreq	L511
 263                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 265  0003 72105340      	bset	21312,#0
 267  0007 2004          	jra	L711
 268  0009               L511:
 269                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 271  0009 72115340      	bres	21312,#0
 272  000d               L711:
 273                     ; 95 }
 276  000d 81            	ret
 334                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 334                     ; 108 {
 335                     .text:	section	.text,new
 336  0000               _TIM4_ITConfig:
 338  0000 89            	pushw	x
 339       00000000      OFST:	set	0
 342                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 344                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 346                     ; 113   if (NewState != DISABLE)
 348  0001 9f            	ld	a,xl
 349  0002 4d            	tnz	a
 350  0003 2709          	jreq	L151
 351                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 353  0005 9e            	ld	a,xh
 354  0006 ca5343        	or	a,21315
 355  0009 c75343        	ld	21315,a
 357  000c 2009          	jra	L351
 358  000e               L151:
 359                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 361  000e 7b01          	ld	a,(OFST+1,sp)
 362  0010 43            	cpl	a
 363  0011 c45343        	and	a,21315
 364  0014 c75343        	ld	21315,a
 365  0017               L351:
 366                     ; 123 }
 369  0017 85            	popw	x
 370  0018 81            	ret
 406                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 406                     ; 132 {
 407                     .text:	section	.text,new
 408  0000               _TIM4_UpdateDisableConfig:
 412                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 414                     ; 137   if (NewState != DISABLE)
 416  0000 4d            	tnz	a
 417  0001 2706          	jreq	L371
 418                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 420  0003 72125340      	bset	21312,#1
 422  0007 2004          	jra	L571
 423  0009               L371:
 424                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 426  0009 72135340      	bres	21312,#1
 427  000d               L571:
 428                     ; 145 }
 431  000d 81            	ret
 489                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 489                     ; 156 {
 490                     .text:	section	.text,new
 491  0000               _TIM4_UpdateRequestConfig:
 495                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 497                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 499  0000 4d            	tnz	a
 500  0001 2706          	jreq	L522
 501                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 503  0003 72145340      	bset	21312,#2
 505  0007 2004          	jra	L722
 506  0009               L522:
 507                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 509  0009 72155340      	bres	21312,#2
 510  000d               L722:
 511                     ; 169 }
 514  000d 81            	ret
 571                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 571                     ; 180 {
 572                     .text:	section	.text,new
 573  0000               _TIM4_SelectOnePulseMode:
 577                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 579                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 581  0000 4d            	tnz	a
 582  0001 2706          	jreq	L752
 583                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 585  0003 72165340      	bset	21312,#3
 587  0007 2004          	jra	L162
 588  0009               L752:
 589                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 591  0009 72175340      	bres	21312,#3
 592  000d               L162:
 593                     ; 193 }
 596  000d 81            	ret
 664                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 664                     ; 216 {
 665                     .text:	section	.text,new
 666  0000               _TIM4_PrescalerConfig:
 670                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 672                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 674                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 676  0000 9e            	ld	a,xh
 677  0001 c75347        	ld	21319,a
 678                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 680  0004 9f            	ld	a,xl
 681  0005 c75345        	ld	21317,a
 682                     ; 226 }
 685  0008 81            	ret
 721                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 721                     ; 235 {
 722                     .text:	section	.text,new
 723  0000               _TIM4_ARRPreloadConfig:
 727                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 729                     ; 240   if (NewState != DISABLE)
 731  0000 4d            	tnz	a
 732  0001 2706          	jreq	L333
 733                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 735  0003 721e5340      	bset	21312,#7
 737  0007 2004          	jra	L533
 738  0009               L333:
 739                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 741  0009 721f5340      	bres	21312,#7
 742  000d               L533:
 743                     ; 248 }
 746  000d 81            	ret
 795                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 795                     ; 258 {
 796                     .text:	section	.text,new
 797  0000               _TIM4_GenerateEvent:
 801                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 803                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 805  0000 c75345        	ld	21317,a
 806                     ; 264 }
 809  0003 81            	ret
 843                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 843                     ; 273 {
 844                     .text:	section	.text,new
 845  0000               _TIM4_SetCounter:
 849                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 851  0000 c75346        	ld	21318,a
 852                     ; 276 }
 855  0003 81            	ret
 889                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 889                     ; 285 {
 890                     .text:	section	.text,new
 891  0000               _TIM4_SetAutoreload:
 895                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 897  0000 c75348        	ld	21320,a
 898                     ; 288 }
 901  0003 81            	ret
 924                     ; 295 uint8_t TIM4_GetCounter(void)
 924                     ; 296 {
 925                     .text:	section	.text,new
 926  0000               _TIM4_GetCounter:
 930                     ; 298   return (uint8_t)(TIM4->CNTR);
 932  0000 c65346        	ld	a,21318
 935  0003 81            	ret
 959                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 959                     ; 307 {
 960                     .text:	section	.text,new
 961  0000               _TIM4_GetPrescaler:
 965                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 967  0000 c65347        	ld	a,21319
 970  0003 81            	ret
1049                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1049                     ; 320 {
1050                     .text:	section	.text,new
1051  0000               _TIM4_GetFlagStatus:
1053  0000 88            	push	a
1054       00000001      OFST:	set	1
1057                     ; 321   FlagStatus bitstatus = RESET;
1059                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1061                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1063  0001 c45344        	and	a,21316
1064  0004 2706          	jreq	L774
1065                     ; 328     bitstatus = SET;
1067  0006 a601          	ld	a,#1
1068  0008 6b01          	ld	(OFST+0,sp),a
1071  000a 2002          	jra	L105
1072  000c               L774:
1073                     ; 332     bitstatus = RESET;
1075  000c 0f01          	clr	(OFST+0,sp)
1077  000e               L105:
1078                     ; 334   return ((FlagStatus)bitstatus);
1080  000e 7b01          	ld	a,(OFST+0,sp)
1083  0010 5b01          	addw	sp,#1
1084  0012 81            	ret
1119                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1119                     ; 345 {
1120                     .text:	section	.text,new
1121  0000               _TIM4_ClearFlag:
1125                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1127                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1129  0000 43            	cpl	a
1130  0001 c75344        	ld	21316,a
1131                     ; 351 }
1134  0004 81            	ret
1198                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1198                     ; 361 {
1199                     .text:	section	.text,new
1200  0000               _TIM4_GetITStatus:
1202  0000 88            	push	a
1203  0001 89            	pushw	x
1204       00000002      OFST:	set	2
1207                     ; 362   ITStatus bitstatus = RESET;
1209                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1213                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1215                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1217  0002 c45344        	and	a,21316
1218  0005 6b01          	ld	(OFST-1,sp),a
1220                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1222  0007 c65343        	ld	a,21315
1223  000a 1403          	and	a,(OFST+1,sp)
1224  000c 6b02          	ld	(OFST+0,sp),a
1226                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1228  000e 0d01          	tnz	(OFST-1,sp)
1229  0010 270a          	jreq	L355
1231  0012 0d02          	tnz	(OFST+0,sp)
1232  0014 2706          	jreq	L355
1233                     ; 375     bitstatus = (ITStatus)SET;
1235  0016 a601          	ld	a,#1
1236  0018 6b02          	ld	(OFST+0,sp),a
1239  001a 2002          	jra	L555
1240  001c               L355:
1241                     ; 379     bitstatus = (ITStatus)RESET;
1243  001c 0f02          	clr	(OFST+0,sp)
1245  001e               L555:
1246                     ; 381   return ((ITStatus)bitstatus);
1248  001e 7b02          	ld	a,(OFST+0,sp)
1251  0020 5b03          	addw	sp,#3
1252  0022 81            	ret
1288                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1288                     ; 392 {
1289                     .text:	section	.text,new
1290  0000               _TIM4_ClearITPendingBit:
1294                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1296                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1298  0000 43            	cpl	a
1299  0001 c75344        	ld	21316,a
1300                     ; 398 }
1303  0004 81            	ret
1316                     	xdef	_TIM4_ClearITPendingBit
1317                     	xdef	_TIM4_GetITStatus
1318                     	xdef	_TIM4_ClearFlag
1319                     	xdef	_TIM4_GetFlagStatus
1320                     	xdef	_TIM4_GetPrescaler
1321                     	xdef	_TIM4_GetCounter
1322                     	xdef	_TIM4_SetAutoreload
1323                     	xdef	_TIM4_SetCounter
1324                     	xdef	_TIM4_GenerateEvent
1325                     	xdef	_TIM4_ARRPreloadConfig
1326                     	xdef	_TIM4_PrescalerConfig
1327                     	xdef	_TIM4_SelectOnePulseMode
1328                     	xdef	_TIM4_UpdateRequestConfig
1329                     	xdef	_TIM4_UpdateDisableConfig
1330                     	xdef	_TIM4_ITConfig
1331                     	xdef	_TIM4_Cmd
1332                     	xdef	_TIM4_TimeBaseInit
1333                     	xdef	_TIM4_DeInit
1352                     	end
