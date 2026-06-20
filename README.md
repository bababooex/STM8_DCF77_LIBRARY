# STM8_DCF77
Code should be almost working, needs a little tweaking. Allows you to decode dcf77 signal pulses - signal needs to be strong, I haven't succeeded to make it working on real dcf77, only from generator via flipper zero. 
Switch allows you to go through 4 modes - hours and minutes, seconds, years and day with month. Of course, if you switch when decoding, it will mess with the switching because of interrupts. Every edge detected appears as blinking colon.
> [!IMPORTANT]
> If you use stm8s103 or similar, you need to set AFR0 option byte to map PC6 and PC7 to timer1 channels in STVP, otherwise it will not detect anything
# What is in program
- Library for controlling HD1650 4 segment display (similar to TM1650, but different segment addresses)
- Library for decoding dcf77 via TIM1 and TIM4 (TIM1 for edges and TIM4 for spaces)
