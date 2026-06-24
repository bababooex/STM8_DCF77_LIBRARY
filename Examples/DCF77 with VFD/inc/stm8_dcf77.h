#ifndef STM8_DCF77_H_
#define STM8_DCF77_H_
#include "stm8s.h"
#include "stm8s_it.h"
#include "extern_variables.h"//do not forget this also

/*
 * stm8_DCF77.h
 *
 *  Created on: 24. 6. 2026
 *  Author: Adam Fucik
 *  
 */

/*
  library for decoding DCF77, tested with DCF77 simulator via flipper zero, but needs filtering via hardware 
  V1.0
	
	Library needs external _delay_us() function (like in "delay.h" library). Digit positions start from 1!
 
  How to use this?
	1. Declare struct DCF77_dateTime_t t, in main, do DCF77_Init(); and enableInterrupts();
	2. In while loop, do DCF77_Update();, after time is correct, use if (DCF77_GetTime()) to verify and jump to this if
	3. Read time structure via DCF77_ReadTime(&t); and print all data like so ex. lcd_print(t.minutes,1);...
		 See example code with VFD

*/

//bit thresholds - in tenths of 10uS 
#define BIT0_MIN     5000  
#define BIT0_MAX     12500
#define BIT1_MIN     12500
#define BIT1_MAX     22000
//treshold for detection of new frame start 1 tick = 100ms
#define THRESHOLD_TICK 17 //1.7 sec
//frame lenght
#define FRAME_BITS   59
//for second function in my code (tim4), otherwise disable
#define TIMSEC 
//states
typedef enum {
    DCF_SEARCH_SYNC = 0,
    DCF_IN_FRAME,
    DCF_FRAME_READY
} dcf_state_t;
//getters
typedef struct {
    uint8_t minutes;
    uint8_t hours;
    uint8_t dayOfWeek;
    uint8_t dayOfMonth;
    uint8_t months;
    uint8_t years;
} DCF77_dateTime_t;

/**
 * @brief dcf77 clock library
 * - initialise timers and function
 * - update (needs loop)
 * - correct time flag
 */
void    DCF77_Init(void);
void    DCF77_Update(void);
bool 		DCF77_GetTime(void);
void    DCF77_ReadTime(DCF77_dateTime_t *out);

void TIM4_setup(void);//for clock
void TIM1_setup(void);//for edges

#endif /* STM8_DCF77_H_ */