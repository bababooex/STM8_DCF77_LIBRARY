#ifndef EXTERN_VARIABLES_H
#define EXTERN_VARIABLES_H

#include "stm8s.h"
#include "hd1650.h"
void visual_handler(void);
//timings edge + time
extern volatile uint8_t  ms_counter;//for ms
extern volatile uint8_t  silenceTicks;//for 100ms

extern volatile uint16_t  clock_ms_counter;//for ms
extern volatile uint8_t  clock_seconds;//for ss
//visual
extern volatile uint8_t colonToggle;//for colon indicator
//pulses
extern volatile uint16_t  pulseWidth;//pulse width detection
extern volatile uint8_t  pulseReady;//ready pulse check
#endif // EXTERN_VARIABLES_H