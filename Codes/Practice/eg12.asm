;计算表达式 Z=(5X+2Y-7)/2
;设X、Y的值放在字节变量VARX、VARY中，结果存放在字节单元VARZ

DATA SEGMENT
    VARX DB 10
    VARY DB 5
    VARZ DB ?
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
         ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
         MOV    AX,DATA
         MOV    DS,AX
    ;5X=2^2X+X 先当于将X算术左移两位在加上X
    GETX:
         MOV    AL,VARX
         MOV    BL,AL
         MOV    CL,2
         SAL    BL,CL
         ADD    AL,BL                       ;AL里面存放着5X
        
    GETY:
         MOV    BL,VARY
         SAL    BL,1                        ;BL里面存放着2Y

    GETZ:
         ADD    AL,BL
         SUB    AL,7
         SAR    AL,1
         MOV    VARZ,AL

    EXIT:
         MOV    AH,4CH
         INT    21H

CODE ENDS
    END MAIN