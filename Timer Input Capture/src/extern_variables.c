#include "extern_variables.h"
volatile uint8_t colonToggle;
void visual_handler(void)//handle blink edge
{
		uint8_t col;
		col = colonToggle;
		if (col) HD1650_colonOn();
		else     HD1650_colonOff();
}
