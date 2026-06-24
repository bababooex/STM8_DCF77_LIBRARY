#include "stm8_pt6311.h"
#include "stm8s.h"
#include "swi2c.h"
#include "stm8_dcf77.h"
#include "extern_variables.h"
#include <stdio.h>

/*
 *  Example code for DCF77 library for STM8, that uses VFD to make radio controlled clock and also RTC for precise timing, that is better than internal timer
 *  1. Time starts at all zeroes -> not synced yet, so SC is lit up
 *  2. If correct signal is decoded, SC will disappear and RTC will sync
 *  3. After chosen time, sync handler will set SC back to being lit up, indicating, that signal wasnt avaiable after chosen time
 *
 *  tested on stm8s103f3p6 chip
 *  Created on: 24. 6. 2026
 *  Author: Adam Fucik
 *  
 */
#define SYNC_HANDLER 1000//time between last sync in seconds, respectively if sync is lost, set how you like it
//rtc struct
extern struct {
    unsigned char s;
    unsigned char m;
    unsigned char h;
    unsigned char dy;
    unsigned char dt;
    unsigned char mt;
    unsigned char yr;
} time;
//time struct
DCF77_dateTime_t t;
//was received flag
uint8_t was_received=0;
uint16_t sync_second=0;
//syncing
uint8_t sync_on_zero_pending = 0;
uint8_t next_hour = 0;
uint8_t next_minute = 0;
//
void clock_setup(void);
void EXTI_setup(void);
void main(void)
{
	  //set pins for edge detection and EXTI
	  GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);//edge detection via timer, doesnt require it set
		GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_IT);//or internal pull up, if you dont use external resistor
    clock_setup();
		swi2c_init();//init i2c
		pt6311_init(9); 
		pt6311_write_string(1,"HELLO");
		delay_ms(1000);
		pt6311_clear_display();
		pt6311_write_string(1,"DCF SYNC");
		delay_ms(1000);
		pt6311_clear_display();
		pt6311_write_string(1,"SC");//snyc visual
		PCF8563_init();
		custom_time();//time set to 00:00:00 - unknown
		PCF8563_set_time();//set it
		PCF8563_clk_sec();//set clk out pin as 1 Hz
		PCF8563_get_time();//display start unknown time
		display_time();
		EXTI_setup();//lastly setup EXTI and DCF_77 library
		DCF77_Init();
		enableInterrupts();
		while (1){
				uint8_t zero_pulse = pulseReady;//little delay doesnt matter
        DCF77_Update();//update DCF (needs to run always)
				if (sync_on_zero_pending) {//sync on first edge
								if (zero_pulse) {
									  sync_on_zero_pending = 0;
										time.h = next_hour;
										time.m = next_minute;
										time.s = 59;
										PCF8563_set_time();
										//display_time();//time is displayed in pcf8563
							}
				}
        if (DCF77_GetTime())
						{
								DCF77_ReadTime(&t);
								next_minute = t.minutes;
								next_hour = t.hours;
								sync_on_zero_pending = 1;//wait for first rising edge
								was_received = 1;
								sync_second = 0;   // reset lost-sync timer
						}
				visual_handler();//handle blink each edge
				if (rtc_second)//update visual secs each second, handled by EXTI
				{
							rtc_second = 0;
							sync_second++;
							display_time();//time is displayed in pcf8563
				}
				if(was_received==1){
						pt6311_write_string(1,"  ");
						was_received=0;
				}
				if (sync_second >= SYNC_HANDLER){//time might not be correct, syncing continues
						pt6311_write_string(1,"SC");
				}
			}
	}


void EXTI_setup(void)
{
	ITC_DeInit();
	ITC_SetSoftwarePriority(ITC_IRQ_PORTB, ITC_PRIORITYLEVEL_1);//set priority to 1 just to be safe
	
	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_RISE_ONLY);
	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_RISE_ONLY);
}

void clock_setup(void)
	{
		//setup clock for 16 MHz
    CLK_DeInit();
                
    CLK_HSECmd(DISABLE);
    CLK_LSICmd(DISABLE);
    CLK_HSICmd(ENABLE);
    while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
                
    CLK_ClockSwitchCmd(ENABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
                
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
    DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
		CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
		CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
  }


#ifdef USE_FULL_ASSERT
void assert_failed(u8 *file, u32 line)
{
    (void)file;
    (void)line;
    while (1) {}
}
#endif
