
;***********************************************************************************************
;                         ������� ������������� ����������� ���������
;***********************************************************************************************

;===============================================================================================
;************************************** ������ � 1 *********************************************
;===============================================================================================
; � ������ ������, ���������� ���������� � ������� RA0 � RA1 (2 ������ ��� ��������).
; � "�����" ��������� ������ ���� "��������" ������� PC (PC  equ  02h) � ��
; ���������� ������� movf PortA,W, ������ ����� �, ������������ � ����������, ������ ����
; ����������� �� ������ "�� ����".
;-----------------------------------------------------------------------------------------------
            ......     ......      ;
            ......     ......      ;
            movf       PortA,W     ; ����� ���������� (����������� �����, ��������������� �� 
                                   ; ������� ����� �, � ������� W).
;-----------------------------------------------------------------------------------------------
;                        ���������� ������������ ��������.
; (������� �� ���������� ��������� ��������� � ����������� �� ��������� ����������)
;-----------------------------------------------------------------------------------------------
            addwf      PC,F        ; ���������� PC � ����������� �� ��������� ����������
                                   ; (�����, ����������� ��� ������ ����������, � ������� W).

            goto       Function    ; ����� ��������� ��.                 0000 0000  
            goto       Plus        ; "���� ��".                          0000 0001  
            goto       Minus       ; "����� ��".                         0000 0010  

            ......     ......      ; ��������� ����������� �����         0000 0011  
            ......     ......      ;
;-----------------------------------------------------------------------------------------------

;===============================================================================================
;************************************** ������ � 2 *********************************************
;===============================================================================================
; � "�����" ��������� ������ ���� "��������" ������� PC (PC  equ  02h).
;-----------------------------------------------------------------------------------------------
            ......     ......      ;
            ......     ......      ; 
            call       TABLE       ; ������� �� ����� � �� TABLE.

            ......     ......      ;<--������� �� ����� �� �� TABLE, ����� ���� ���������
            ......     ......      ; ����������� �����.
;-----------------------------------------------------------------------------------------------
;                   ���������� ������������ ��������.
; (�������������� �������-����������� ���� � ��� 7-����������� ����������)
;-----------------------------------------------------------------------------------------------                
TABLE       addwf      PC,F        ; ���������� �������� ������ PC �������������
                                   ; �� �������� ����������� ������������ W.
            retlw      b'00111111' ; ..FEDCBA = 0            
            retlw      b'00000110' ; .....CB. = 1             
            retlw      b'01011011' ; .G.ED.BA = 2           
            retlw      b'01001111' ; .G..DCBA = 3           
            retlw      b'01100110' ; .GF..CB. = 4       
            retlw      b'01101101' ; .GF.DC.A = 5       
            retlw      b'01111101' ; .GFEDC.A = 6       
            retlw      b'00000111' ; .....CBA = 7                                     
            retlw      b'01111111' ; .GFEDCBA = 8                                     
            retlw      b'01101111' ; .GF.DCBA = 9                                   
            retlw      .00         ; ........ = ��� ������� ��������.                 
            retlw      .113        ; .GFE...A = F  ������� ������ ��������� ��.
            retlw      .246        ; HGFE.CB. = H. ������� ������ "���� ��".               
            retlw      .184        ; H.FED... = L. ������� ������ "����� ��".
            retlw      .241        ; HGFE...A = F. ������� ������ �����������.
;----------------------------------------------------------------------------------------------

