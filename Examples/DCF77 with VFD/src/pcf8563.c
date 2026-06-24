#include "PCF8563.h"

bool err;
struct {
    unsigned char s;
    unsigned char m;
    unsigned char h;
    unsigned char dy;
    unsigned char dt;
    unsigned char mt;
    unsigned char yr;
} time;
void PCF8563_init(void)//call after swi2c init
{
    PCF8563_write(PCF8563_CONTROL1, 0x00);
    PCF8563_write(PCF8563_CONTROL2, 0x00);
}

unsigned char PCF8563_read(unsigned char address)
{
    uint8_t value = 0x00;
    swi2c_read_buf(PCF8563_ADDR, address, &value, 1);
		return value;
}

void PCF8563_write(unsigned char address, unsigned char value)
{
    swi2c_write_buf(PCF8563_ADDR, address, &value, 1);
}

unsigned char bcd_to_decimal(unsigned char value)
{
    return ((value & 0x0F) + (((value >> 4) & 0x0F) * 10));
}

unsigned char decimal_to_bcd(unsigned char value)
{
    return (((value / 10) << 4) | (value % 10));
}

void PCF8563_get_time(void)
{
    uint8_t buf[7];
		if (swi2c_read_buf(PCF8563_ADDR, PCF8563_SEC_REG, buf, 7) != 0) {
        err=true;
    }
		else{
			  err=false;
		}
    time.s  = bcd_to_decimal(buf[0] & 0x7F);
    time.m  = bcd_to_decimal(buf[1] & 0x7F);
    time.h  = bcd_to_decimal(buf[2] & 0x3F);
    time.dt = bcd_to_decimal(buf[3] & 0x3F);
    time.dy = bcd_to_decimal(buf[4] & 0x07);
    time.mt = bcd_to_decimal(buf[5] & 0x1F);
    time.yr = bcd_to_decimal(buf[6]);
}

void PCF8563_set_time(void)
{
    uint8_t buf[7];

    buf[0] = decimal_to_bcd(time.s) & 0x7F;
    buf[1] = decimal_to_bcd(time.m) & 0x7F;
    buf[2] = decimal_to_bcd(time.h) & 0x3F;
    buf[3] = decimal_to_bcd(time.dt) & 0x3F;
    buf[4] = decimal_to_bcd(time.dy) & 0x07;
    buf[5] = decimal_to_bcd(time.mt) & 0x1F;
    buf[6] = decimal_to_bcd(time.yr);

    swi2c_write_buf(PCF8563_ADDR, PCF8563_SEC_REG, buf, 7);
}

void display_time(void)
{
	  static uint8_t last_s = 255;
    PCF8563_get_time();
		/*
		if (err==true) {
        lcd_gotoxy(x_pos,y_pos);
				lcd_puts("--");
				lcd_gotoxy(x_pos + 3,y_pos);
				lcd_puts("--");
        return;
    }
		*/
		pt6311_clock_format(3,time.h,1); //write int (good for 4 digits max)
		pt6311_clock_format(5,time.m,1);
		pt6311_clock_format(7,time.s,0);
}
/*
//doesnt need fix, not used
void display_date(void)
{
	  uint16_t n = time.yr;
		static uint8_t last_dt = 255;
    static uint8_t last_mt = 255;
    static uint8_t last_yr = 255;
    PCF8563_get_time();
    if (time.dt != last_dt || time.mt != last_mt || time.yr != last_yr) //same logic, if not changed, skip
    {
        //cs16311_write_int(time.dt, 6);
       // cs16311_write_int(time.mt, 8);
				
//				cs16311_write_int(n, 6);

        last_dt = time.dt;
        last_mt = time.mt;
        last_yr = time.yr;
    }
}
*/
void PCF8563_clk_sec(void)
{
    PCF8563_write(0x0D, 0x83);
}
//set custom time - only once, then disable!
void custom_time(void)
{
    time.h  = 0;
    time.m  = 0;
    time.s  = 0;
    time.dt = 0;
    time.mt = 0;
    time.yr = 0;
    time.dy = 0;
		PCF8563_set_time();
}