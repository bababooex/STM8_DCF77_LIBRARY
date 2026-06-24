#ifndef HD1650_STM8_H
#define HD1650_STM8_H

#include "swi2c.h"  //needs swi2c
#include <stdbool.h> //for bool usage

#define HD1650_DISPLAY_BASE   0x6E
#define HD1650_CONTROL_BASE   0x48
#define HD1650_NUM_DIGIT         4
#define HD1650_MEMORY_SAVER   	 0
#define HD1650_ZERO_PREFIX    false

/**
 * @brief hd1650 display library, difference between tm1650 is in segment indexing
 * - initialise 
 * - switch display on/off
 * - clear whole display
 * - set brightness (0 - max, 7 - min)
 * - switch colon on/off (for time)
 * - set dot on/off on position
 * - write number from left to right
 */
void HD1650_init(void);

void HD1650_displayOn(void);
void HD1650_displayOff(void);
void HD1650_clearDisplay(void);
void HD1650_setBrightness(uint8_t b);

void HD1650_colonOn(void);
void HD1650_colonOff(void);

void HD1650_setDot(uint8_t pos, bool onoff);
void HD1650_writeNumber(uint16_t num, bool zeroFill);
//other functions (private)
void HD1650_sendControl(uint8_t data, uint8_t segment);
void HD1650_sendDigit(uint8_t data, uint8_t segment);
void HD1650_test(uint8_t pos);
void HD1650_writeNum(uint16_t num);

#endif /* HD1650_STM8_H */
