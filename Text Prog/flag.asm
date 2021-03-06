;***********************************************************************************************
; flag.asm         ������ ������������� ����� �������� ���������� "Z"
;***********************************************************************************************
    ������: ��� ������ ���������?
    �����: ����, �� ������ ������� ����������� �������� �������� ������, � ��� �������� �����
           �� ����� �� .00 �� .04 ������������, �� ������� ����� ��������� ������ "����"
           � ���� �������� ������ "���������" (� ������������ YES), � ���� ���������  ���� �����
           �� ������ �  "����" ����� �� .00 �� .04 ������������, �� ������� ����� ���������
           ������ "����" � ������ �������� ������ "���������" (� ������������ NO). 

;***********************************************************************************************
;                                 "����� ���������"
;===============================================================================================
;.............................................................
;.............................................................
;===============================================================================================
; ����������� ��������� ��������� ������������ ����������. 
;===============================================================================================
Status      equ        03h         ; ������� Status.
;.............................................................
;.............................................................
;===============================================================================================
; ����������� �������� � ��������� ��������� ������ ���������.
;===============================================================================================
Registr     equ        0Ch         ; ������� �������� ������.
;.............................................................
;.............................................................
;===============================================================================================
; ����������� ����� ���������� ����������� ��������.
;===============================================================================================
W           equ        0           ; ��������� ��������� � �����������.
;.............................................................
;===============================================================================================
; ������������ ����� ��������.
;===============================================================================================
RP0         equ        5           ; ��� ������ �����.
Z           equ        2           ; ��� ����� �������� ����������.
;.............................................................
;===============================================================================================
            org        0           ; ������ ���������� ��������� 
            goto       START       ; � ������������ START.
;***********************************************************************************************

 

;***********************************************************************************************
;                               ������� ����� ���������
;***********************************************************************************************
START       ......................................
            ......................................
            ......................................
;-----------------------------------------------------------------------------------------------
; �� NO, � ������� "������" ������� ����� ���������, ���� ������������� ����� �� �������� �
; "����" ����� �� .00 �� .04 ������������.
;-----------------------------------------------------------------------------------------------
NO          ......................................
            ......................................
;-----------------------------------------------------------------------------------------------
            ......................................
            ......................................
;===============================================================================================
; ���������� ��������� �����������.
; ������� ������ � ��������� ��� ��� �������������� ����� � "����" ����� �� .00 �� .04 ������������.
;================================================================================================
            movf       Registr,W   ; ����������� ���������� �������� Registr � ������� W. 
            bcf        Status,Z    ; �������� ���� �������� ���������� Z.

            sublw      .00         ; ������� �� ��������� .00 ���������� �������� W.
            btfsc      Status,Z    ; �������� ��������� ����� �������� ���������� Z.
            goto       YES         ; ���� Z=1 (������� ��������� ��������), �� "����" � �� YES.
            movf       Registr,W   ; ���� Z=0 (��������� ��������� ��������), �� ����������
                                   ; �������� Registr ���������� � ������� W.

            sublw      .01         ; ������� �� ��������� .01 ���������� �������� W.
            btfsc      Status,Z    ; --------------"--------------
            goto       YES         ; --------------"--------------   
            movf       Registr,W   ; --------------"--------------
                                   ; --------------"--------------
                            
            sublw      .02         ; ������� �� ��������� .02 ���������� �������� W.
            btfsc      Status,Z    ; --------------"--------------
            goto       YES         ; --------------"--------------   
            movf       Registr,W   ; --------------"--------------
                                   ; --------------"--------------

            sublw      .03         ; ������� �� ��������� .03 ���������� �������� W.
            btfsc      Status,Z    ; --------------"--------------
            goto       YES         ; --------------"--------------    
            movf       Registr,W   ; --------------"--------------
                                   ; --------------"--------------

            sublw      .04         ; ������� �� ��������� .04 ���������� �������� W.
            btfsc      Status,Z    ; �������� ��������� ����� �������� ���������� Z.
            goto       YES         ; ���� Z=1 (������� ��������� ��������), �� "����" � �� YES.
            
            goto       NO          ; ���� Z=0 (��������� ��������� ��������), �� ����������
                                   ; ����������� ������� � �� NO.
;---------------------------------------------------------------------------------------------
; �� YES, � ������� "������" ������� ����� ���������, ���� ������������� ����� �������� �
; "����" ����� �� .00 �� .04 ������������.
;---------------------------------------------------------------------------------------------
YES         ......................................
            ......................................
;---------------------------------------------------------------------------------------------
            ......................................
            ......................................
;*********************************************************************************************
            end                     ; ����� ���������.
