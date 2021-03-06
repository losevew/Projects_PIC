#include <KlDisp.h>


unsigned int scan_it(void)
{
    unsigned int key, pattern;
    key=1; 
    pattern = 0x01;/* ��������� �������� ����� �'11111110' */
    while(key<13)              /* � ��� 12 ������ */
    {
        PORT_B = ~pattern;      /* �������� ������ */
        if(!COL1) {break;}     /* ��������� ��������� ������� �������, */
        key++;                 /* ������ �� ����� ��� ������� �������� */
        if(!COL2) {break;}     /* ����� �������������� ������� ����� */
        key++;
        if(!COL3) {break;}
        key++;
        pattern = pattern << 1;  /* �������� ����� �� ���� ��� �����        */
    }
    if(key==13)  {key = 0xFF;}  /* ���� � �������� ����� 13, �������  ������� ����������� */
    return key;
}

unsigned int get_it(void) 
{
    unsigned int count, old_key, new_key; 
    count = 0;
    while(count<255) 
    {
        new_key = scan_it();
        if(new_key == old_key)
        { count++;}
        else
        {
            old_key = new_key;
            count = 0;
        }
    }
    return (old_key);
}

void spi_write(datum)
{
    int k;
    for (k=0; k<4; k++)
    {
        if((datum & 0x08)) { SDO = 1;}
        else {SDO = 0;}
        SCK = 1;
        SCK = 0;
        
        datum = datum <<1;
    }
    SDO = 0;
}

void main()
{
    set_tris_a(0x00); 
    set_tris_b(0xf0);
    port_b_pullups(TRUE);
    
    unsigned int inpkey, oldkey;
    
    SDO = 0;
    SCK = 0;
    while (TRUE)
    {
        if(scan_it()!= 0xFF)
        {
           inpkey = get_it();
           if(inpkey != oldkey)
           {
                switch(inpkey)
                {
                    case 11:
                    { 
                        spi_write(0);
                        oldkey = inpkey;
                        inpkey = 0;
                    }
                    break;
                    case 10:
                    { 
                        spi_write(0);
                        spi_write(0);
                        oldkey = inpkey;
                        inpkey = 0;
                    }
                    break;
                    case 12:
                    { 
                        spi_write(0);
                        spi_write(0);
                        spi_write(0);
                        oldkey = inpkey;
                        inpkey = 0;
                    }
                    break;
                    case 255:
                    { 
                        oldkey = inpkey;
                        inpkey = 0;
                    }
                    break;
                    default:
                    {
                        spi_write(inpkey);
                        oldkey = inpkey;
                        inpkey = 0;
                    }
                    break;
                }
            }
        }
    }

}

