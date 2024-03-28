;内存中交换两个数的位置
DATA SEGMENT
    A    DB 12H
    B    DB 24H
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
         ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
         MOV    AX,DATA
         MOV    DS,AX

         MOV    BL,A
         MOV    DL,B
         MOV    A,DL
         MOV    B,BL

         MOV    AH,4CH
         INT    21H
CODE ENDS
    END MAIN