#include "stm8_dcf77.h"

volatile uint16_t pulseWidth = 0;
volatile uint8_t  pulseReady  = 0;
static volatile uint8_t signals[60];
static volatile uint8_t signalIndex = 0;
static volatile dcf_state_t state = DCF_SEARCH_SYNC;
volatile uint8_t silenceTicks = 0;
static volatile uint8_t timeReceived = 0;
static DCF77_dateTime_t lastTimeValue;
volatile uint8_t ms_counter;

void TIM1_setup(void)//dual edge detection
{
    TIM1_DeInit();
    TIM1_TimeBaseInit(160, TIM1_COUNTERMODE_UP, 65535, 0);//10uS
		
    TIM1_ICInit(TIM1_CHANNEL_1,
                TIM1_ICPOLARITY_RISING,
                TIM1_ICSELECTION_DIRECTTI,
                TIM1_ICPSC_DIV1, 0);


    TIM1_ICInit(TIM1_CHANNEL_2,
                TIM1_ICPOLARITY_FALLING,
                TIM1_ICSELECTION_INDIRECTTI,
                TIM1_ICPSC_DIV1, 0);
		TIM1_ClearFlag(TIM1_FLAG_CC1);
		TIM1_ClearFlag(TIM1_FLAG_CC2);
		TIM1_ITConfig(TIM1_IT_CC1 | TIM1_IT_CC2, ENABLE);
    TIM1_Cmd(ENABLE);
}

void TIM4_setup(void)
{
	  TIM4_DeInit();
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125-1);//1ms clock
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    TIM4_Cmd(ENABLE);
}
static uint8_t getMinutes(void)
{
    uint8_t u =
        (signals[21] ? 1 : 0) |
        (signals[22] ? 2 : 0) |
        (signals[23] ? 4 : 0) |
        (signals[24] ? 8 : 0);

    uint8_t t =
        (signals[25] ? 1 : 0) |
        (signals[26] ? 2 : 0) |
        (signals[27] ? 4 : 0);

    return t * 10 + u;
}

static uint8_t getHours(void)
{
    uint8_t u =
        (signals[29] ? 1 : 0) |
        (signals[30] ? 2 : 0) |
        (signals[31] ? 4 : 0) |
        (signals[32] ? 8 : 0);

    uint8_t t =
        (signals[33] ? 1 : 0) |
        (signals[34] ? 2 : 0);

    return t * 10 + u;
}

static uint8_t getDayOfMonth(void)
{
    uint8_t u =
        (signals[36] ? 1 : 0) |
        (signals[37] ? 2 : 0) |
        (signals[38] ? 4 : 0) |
        (signals[39] ? 8 : 0);

    uint8_t t =
        (signals[40] ? 1 : 0) |
        (signals[41] ? 2 : 0);

    return t * 10 + u;
}

static uint8_t getDayOfWeek(void)//bcd conversion not needed
{
    return (signals[42] ? 1 : 0) |
           (signals[43] ? 2 : 0) |
           (signals[44] ? 4 : 0);
}

static uint8_t getMonths(void)
{
    uint8_t u =
        (signals[45] ? 1 : 0) |
        (signals[46] ? 2 : 0) |
        (signals[47] ? 4 : 0) |
        (signals[48] ? 8 : 0);

    uint8_t t =
        (signals[49] ? 1 : 0);

    return t * 10 + u;
}

static uint8_t getYears(void)
{
    uint8_t u =
        (signals[50] ? 1 : 0) |
        (signals[51] ? 2 : 0) |
        (signals[52] ? 4 : 0) |
        (signals[53] ? 8 : 0);

    uint8_t t =
        (signals[54] ? 1 : 0) |
        (signals[55] ? 2 : 0) |
        (signals[56] ? 4 : 0) |
        (signals[57] ? 8 : 0);

    return t * 10 + u;
}

static uint8_t DCF77_CheckParity(void)
{
    uint8_t pMin = 0, pHour = 0, pDate = 0;
    uint8_t a,b,c;
    for (a = 21; a <= 27; a++) pMin ^= signals[a];
    for (b = 29; b <= 34; b++) pHour ^= signals[b];
    for (c = 36; c <= 57; c++) pDate ^= signals[c];

    if (pMin  != signals[28]) return 0;
    if (pHour != signals[35]) return 0;
    if (pDate != signals[58]) return 0;

    return 1;//correct parity check
}

static void DCF77_ProcessPulse(uint16_t w)
{
    uint8_t bit;
    silenceTicks = 0;
		
    if (state != DCF_IN_FRAME && state != DCF_SEARCH_SYNC)
        return;
    //bit decoding logic
    if (w >= BIT0_MIN && w < BIT0_MAX)
        bit = 0;
    else if (w >= BIT1_MIN && w < BIT1_MAX)
        bit = 1;
    else
    {
        //pulse width
        state = DCF_SEARCH_SYNC;
        signalIndex = 0;
        return;
    }

    //first pulse detection and full frame confirm
    if (state == DCF_SEARCH_SYNC)
        state = DCF_IN_FRAME;

    signals[signalIndex++] = bit;

    if (signalIndex >= FRAME_BITS)
        state = DCF_FRAME_READY;
}

static void DCF77_CommitFrame(void)
{
    if (!DCF77_CheckParity())//correct parity check
    {
        state = DCF_SEARCH_SYNC;
        signalIndex = 0;
        return;
    }
    lastTimeValue.minutes     = getMinutes();
    lastTimeValue.hours       = getHours();
		lastTimeValue.dayOfWeek   = getDayOfWeek();
    lastTimeValue.dayOfMonth  = getDayOfMonth();
    lastTimeValue.months      = getMonths();
    lastTimeValue.years       = getYears();

    timeReceived = 1;

    state = DCF_SEARCH_SYNC;
    signalIndex = 0;
}

static void DCF77_Monitor(void)
{
    if (silenceTicks > THRESHOLD_TICK)   
    {
        state = DCF_SEARCH_SYNC;
        signalIndex = 0;
        silenceTicks = 0;
    }
}

void DCF77_Update(void)
{
	  DCF77_Monitor();
    if (pulseReady)
    {
        uint16_t w;

        //disableInterrupts();
        w = pulseWidth;
        pulseReady = 0;
			  //enableInterrupts();

        DCF77_ProcessPulse(w);
    }
    if (state == DCF_FRAME_READY)
    {
        DCF77_CommitFrame();
    }
}

bool DCF77_GetTime(void)
{
    if (timeReceived)
    {
        timeReceived = 0;
        return 1;
    }
    return 0;
}

//last decoded time copy to struct
void DCF77_ReadTime(DCF77_dateTime_t *out)
{
	  //disableInterrupts();
    *out = lastTimeValue;
		//enableInterrupts();
}


void DCF77_Init(void)
{
    signalIndex = 0;
    state = DCF_SEARCH_SYNC;
		ms_counter = 0;
    silenceTicks = 0;
    timeReceived = 0;
		TIM4_setup();
		TIM1_setup();
		//enableInterrupts();
}