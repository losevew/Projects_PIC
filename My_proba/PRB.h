#include <16C73B.h>
#device ADC=16

#FUSES NOWDT                    //No Watch Dog Timer
#FUSES NOBROWNOUT               //No brownout reset

#use delay(crystal=10000000)
//#use FIXED_IO( B_outputs=PIN_B3 )
#use i2c(Master,Fast,sda=PIN_C4,scl=PIN_C3)

