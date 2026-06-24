#include "extern_variables.h"
volatile uint8_t colonToggle;
volatile uint8_t rtc_second;
void visual_handler(void)//handle blink edge
{
		uint8_t col;
		col = colonToggle;
		if (col) pt6311_write_char(9, '8');//can be made differently, I used images on right
		else     pt6311_write_char(9, ' ');
}
