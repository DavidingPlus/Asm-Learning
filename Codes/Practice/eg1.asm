;求 z = x + y
DATA SEGMENT
    X    DW 1234H
    Y    DW 2345H
    Z    DW ?
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
         ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
         MOV    AX,DATA
         MOV    DS,AX

         MOV    AX,X
         ADD    AX,Y
         MOV    Z,AX

    ;程序退出指令(固定)
         MOV    AH,4CH
         INT    21H
CODE ENDS
END MAIN