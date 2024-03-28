;统计AL寄存器中1的个数（相当于AL里面数二进制中1的个数），并屏幕显示
DATA SEGMENT
    NUM  DB ?,24H
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
           ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:  
           MOV    AX,DATA
           MOV    DS,AX

           MOV    AL,33H                      ;赋值
           MOV    BL,0                        ;用BL来存储1的个数
           MOV    CX,8
    LOP:   
    ;将其逻辑右移，由于AL寄存器最多放八位,循环八次即可
           TEST   AL,01H                      ;将AL和01H做与运算看最后一位是不是为1 结果为1则表示为1 为0则表示为0
           JZ     DONE1
           INC    BL
    DONE1: 
           SHR    AL,1
           LOOP   LOP
             
    OUTPUT:
           MOV    NUM,BL
           LEA    DX,NUM
           MOV    AH,9
           INT    21H
    
    EXIT:  
           MOV    AH,4CH
           INT    21H

CODE ENDS
    END MAIN