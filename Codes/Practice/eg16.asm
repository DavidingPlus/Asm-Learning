; 将ax的内容压入栈中，将栈中的内容弹出并输出。
DATA SEGMENT
DATA ENDS

STACK SEGMENT
        NUMS  DB 1024 DUP(?)
        TOP   DW LENGTH NUMS
STACK ENDS

CODE SEGMENT
                ASSUME DS:DATA,SS:STACK,CS:CODE
        MAIN:   
                MOV    AX,DATA
                MOV    DS,AX
                MOV    AX,STACK
                MOV    SS,AX
                MOV    AX,TOP
                MOV    SP,AX

        PUSHING:
                MOV    AX,63H
                PUSH   AX

        POPPING:
                POP    DX
                MOV    AH,2
                INT    21H

        EXIT:   
                MOV    AH,4CH
                INT    21H

CODE ENDS
    END MAIN