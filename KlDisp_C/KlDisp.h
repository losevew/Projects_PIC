#include <16F84A.h>

#FUSES NOWDT                     //No Watch Dog Timer
#FUSES HS                        //High speed Osc (> 4mhz for PCM/PCH) (>10mhz for PCD)

#use delay(clock=4000000)

#use fixed_io(a_outputs=PIN_A0, PIN_A1)
#use fixed_io(b_outputs=PIN_B0, PIN_B1, PIN_B2, PIN_B3)

#byte PORT_A = 5
#byte PORT_B = 6
#bit COL1 = PORT_B.5         // Столбец 1 - RB5
#bit COL2 = PORT_B.6         // Столбец 2 - RB6
#bit COL3 = PORT_B.7         // Столбец 3 - RB7
#bit SDO = PORT_A.0
#bit SCK = PORT_A.1

