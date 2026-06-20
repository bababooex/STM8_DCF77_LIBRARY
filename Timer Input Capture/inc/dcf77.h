#ifndef DCF77_STM8_H
#define DCF77_STM8_H

#include "stm8s.h"
#include "stm8s_it.h"
#include "extern_variables.h"
//bit thresholds - in tenths of 10uS 
#define BIT0_MIN     5000  
#define BIT0_MAX     12500
#define BIT1_MIN     12500
#define BIT1_MAX     22000
//treshold for detection of new frame start 1 tick = 100ms
#define THRESHOLD_TICK 17 
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

#endif /* DCF77_STM8_H */
