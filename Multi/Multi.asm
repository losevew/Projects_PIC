;***********************************************************************************************
; Multi.asm
; �����������������  ��������������.
; PIC16F84A      ����� 4 ���.
;===============================================================================================
            LIST        p=16F84A    ; ��������� ���� ����������������.
            __CONFIG    03FF1H      ; ��� ������ ��������, WDT ��������, 
                                    ; ����������� XT - ���������.
;===============================================================================================
; �����������  ���������  ���������  ������������  ����������.
;===============================================================================================
Status      equ         03h         ; ������� ������ �����.
TrisB       equ         06h         ; ������� ������ ����������� ������ ������� ����� �.
PortB       equ         06h         ; ������� ���������� ��������� ����� �.
;===============================================================================================
; �����������  ��������  �  ���������  ���������  ������  ����������.
;===============================================================================================
Sec         equ         0Ch         ; ������� ������� �����������.
;===============================================================================================
; ����������� ����� ���������� ����������� ��������.
;===============================================================================================
F           equ         1           ; ��������� ��������� � �������.
;===============================================================================================
            org         0           ; ������ ���������� ��������� � ������ 0 PC.
            goto        Start       ; ������� � �� Start.


;***********************************************************************************************
;                          ����� ������� ����� ���������.
;***********************************************************************************************
; ��������� ����������� ������ RB0 - �� �����.
;-----------------------------------------------------------------------------------------------
Start       bsf         Status,5    ; ������� � 1-� ���� (���������� � 1 5-� ���
                                    ; �������� Status).
            movlw       .0          ; �������� ��������� 0 � ����������� (W).
            movwf       TrisB       ; ����������� 0 �� W � ������� TrisB.

            bcf         Status,5    ; ������� � 0-� ���� (���������� � 0 5-� ���
                                    ; �������� Status).
;-----------------------------------------------------------------------------------------------
; ����������� ������� ����������� (�������� ��������� � ������� Sec).
;-----------------------------------------------------------------------------------------------
            movlw       .32         ; �������� � ������� W ��������� .32
            movwf       Sec         ; ����������� .32 �� W � ������� Sec.
;-----------------------------------------------------------------------------------------------
; ������������ �� ������ RB0 �������� ������.
;-----------------------------------------------------------------------------------------------
            bcf         PortB, 0    ; ���������� �� ������ ������� RB0 ����.

            nop                     ; ������������� �������� ����.
            nop                     ; -------------"--------------
Pause_1     decfsz      Sec,F       ; ��������� ����������� �������� Sec � ���������� ������-
            goto        Pause_1     ; ���� ���������� � ���� �� �������.
                                    ; ���� ���� ��������� ��=0, �� �������������� �������
                                    ; � �� Pause_1 ("�����������" � ���� ��).
                                    ; ���� =0, �� ��������� ����������� �����.
;-----------------------------------------------------------------------------------------------
; ����������� ������� ����������� (�������� ��������� � ������� Sec).
;-----------------------------------------------------------------------------------------------
            movlw       .30         ; �������� � ������� W ��������� .30
            movwf       Sec         ; ����������� .30 �� W � ������� Sec.
;-----------------------------------------------------------------------------------------------
; ������������ �� ������ RB0 ���������� ������.
;-----------------------------------------------------------------------------------------------
            bsf         PortB,0     ; ���������� �� ������ ������� RB0 �������.

            nop                     ; �� �� �����, ��� � ��� �������� ������,
            nop                     ; ������ "�����������" ���������� � �� Pause_2.
Pause_2     decfsz      Sec,F       ; ------------------"-------------------
            goto        Pause_2     ; ------------------"-------------------

            goto        Start       ; ������� �� ����� ������ ���� ���������.
;***********************************************************************************************                        
            end                     ; ��������� ����� ��������� (������ ��������� �����).                              
