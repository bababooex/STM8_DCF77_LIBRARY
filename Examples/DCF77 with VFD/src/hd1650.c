#include "hd1650.h"

static uint8_t iCtrl[HD1650_NUM_DIGIT];
static uint8_t iData[HD1650_NUM_DIGIT];

static const uint8_t hd1650_Digit_Table[] = {
    0x3F, /* 0 */
    0x06, /* 1 */
    0x5B, /* 2 */
    0x4F, /* 3 */
    0x66, /* 4 */
    0x6D, /* 5 */
    0x7D, /* 6 */
    0x07, /* 7 */
    0x7F, /* 8 */
    0x6F, /* 9 */
    0x77, /* A */
    0x7C, /* b */
    0x39, /* C */
    0x5E, /* d */
    0x79, /* E */
    0x71, /* F */
    0x00  /* blank (index 0x10) */
};

static void hd1650_i2c_write(uint8_t reg, uint8_t data)
{
    uint8_t buf[1];
    buf[0] = data;
    swi2c_write_array(reg, buf, 1);
}

void HD1650_init(void)
{
    uint8_t dig;
    swi2c_init();
    hd1650_i2c_write(HD1650_DISPLAY_BASE, 0x00);

    for (dig = 0; dig < HD1650_NUM_DIGIT; dig++) {
        iCtrl[dig] = 0x00;
        iData[dig] = 0x00;
    }
}

void HD1650_sendControl(uint8_t data, uint8_t segment)
{
    segment = segment % HD1650_NUM_DIGIT;
    hd1650_i2c_write((uint8_t)(HD1650_CONTROL_BASE + segment), data);
}

void HD1650_sendDigit(uint8_t data, uint8_t segment)
{
    segment = segment % HD1650_NUM_DIGIT;
    hd1650_i2c_write((uint8_t)(HD1650_DISPLAY_BASE - segment*2), data);
}

void HD1650_displayOn(void)
{
    uint8_t i;
    for (i = 0; i < HD1650_NUM_DIGIT; i++) {
        iCtrl[i] = (iCtrl[i] & 0xFE) | 0x01; 
        HD1650_sendControl(iCtrl[i], i);
    }
}

void HD1650_displayOff(void)
{
    uint8_t i;
    for (i = 0; i < HD1650_NUM_DIGIT; i++) {
        iCtrl[i] = iCtrl[i] & 0xFE;       
        HD1650_sendControl(iCtrl[i], i);
    }
}

void HD1650_colonOn(void)
{
    HD1650_sendControl((iCtrl[0] & 0xF7) | 0x08, 0);
}

void HD1650_colonOff(void)
{
    HD1650_sendControl(iCtrl[0] & 0xF7, 0);
}

void HD1650_setBrightness(uint8_t b)
{
    uint8_t i;
    if (b > 0x07) { b = 0x07; }

    for (i = 0; i < HD1650_NUM_DIGIT; i++) {
        iCtrl[i] = (iCtrl[i] & 0xFF) | (uint8_t)(b << 4);
        HD1650_sendControl(iCtrl[i], i);
    }
}

void HD1650_clearDisplay(void)
{
    uint8_t i;
    for (i = 0; i < HD1650_NUM_DIGIT; i++) {
        HD1650_sendDigit(0x00, i);
        iData[i] = 0x00;
    }
}

void HD1650_test(uint8_t pos)
{
    uint8_t i;
    for (i = 0; i < HD1650_NUM_DIGIT; i++) {
        HD1650_sendDigit((i == pos) ? 0xFF : 0x00, i);
    }
}

void HD1650_setDot(uint8_t pos, bool onoff)
{
    uint8_t data;
    pos  = pos % HD1650_NUM_DIGIT;
    data = iData[pos];
    data = onoff ? (data | 0x80) : (data & 0x7F);
    iData[pos] = data;
    HD1650_sendDigit(data, pos);
}

#if HD1650_MEMORY_SAVER == 0

void HD1650_writeNumber(uint16_t num, bool zeroFill)
{
    uint16_t onum = num;
    uint8_t  digit;

    /* Digit 3 (rightmost) */
    digit = (uint8_t)(num % 10u);
    HD1650_sendDigit(hd1650_Digit_Table[digit], 3);
    iData[3] = digit;
    num /= 10u;

    /* Digit 2 */
    digit = (uint8_t)(num % 10u);
    if (!zeroFill && onum < 10u && digit == 0u) {
        HD1650_sendDigit(hd1650_Digit_Table[0x10], 2);
    } else {
        HD1650_sendDigit(hd1650_Digit_Table[digit], 2);
    }
    iData[2] = digit;
    num /= 10u;

    /* Digit 1 */
    digit = (uint8_t)(num % 10u);
    if (!zeroFill && onum < 100u && digit == 0u) {
        HD1650_sendDigit(hd1650_Digit_Table[0x10], 1);
    } else {
        HD1650_sendDigit(hd1650_Digit_Table[digit], 1);
    }
    iData[1] = digit;
    num /= 10u;

    /* Digit 0 (leftmost) */
    digit = (uint8_t)(num % 10u);
    if (!zeroFill && onum < 1000u && digit == 0u) {
        HD1650_sendDigit(hd1650_Digit_Table[0x10], 0);
    } else {
        HD1650_sendDigit(hd1650_Digit_Table[digit], 0);
    }
    iData[0] = digit;
}

void HD1650_writeNum(uint16_t num)
{
    HD1650_writeNumber(num, (uint8_t)HD1650_ZERO_PREFIX);
}

#else


void HD1650_writeNumber(uint16_t num, bool zeroFill)
{
    (void)zeroFill;
    HD1650_writeNum(num);
}

void HD1650_writeNum(uint16_t num)
{
    uint8_t digit;

#if HD1650_ZERO_PREFIX == false
    uint16_t onum = num;
#endif

    /* Digit 3 (rightmost) */
    digit = (uint8_t)(num % 10u);
    HD1650_sendDigit(hd1650_Digit_Table[digit], 3);
    iData[3] = digit;
    num /= 10u;

    /* Digit 2 */
    digit = (uint8_t)(num % 10u);
#if HD1650_ZERO_PREFIX == false
    if (onum < 10u && digit == 0u) { digit = 0x10; }
#endif
    HD1650_sendDigit(hd1650_Digit_Table[digit], 2);
    iData[2] = digit;
    num /= 10u;

    /* Digit 1 */
    digit = (uint8_t)(num % 10u);
#if HD1650_ZERO_PREFIX == false
    if (onum < 100u && digit == 0u) { digit = 0x10; }
#endif
    HD1650_sendDigit(hd1650_Digit_Table[digit], 1);
    iData[1] = digit;
    num /= 10u;

    /* Digit 0 (leftmost) */
    digit = (uint8_t)(num % 10u);
#if HD1650_ZERO_PREFIX == 0
    if (onum < 1000u && digit == 0u) { digit = 0x10; }
#endif
    HD1650_sendDigit(hd1650_Digit_Table[digit], 0);
    iData[0] = digit;
}

#endif /* HD1650_MEMORY_SAVER */
