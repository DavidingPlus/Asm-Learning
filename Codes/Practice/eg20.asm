;己知DATA1字节单元有一个数据，试编制一程序段将该数据的低4位变为1010B，最高位置1，其余3位不变，结果送DAT2字节单元
DATA SEGMENT
    DATA1 DB 0F4H
    DATA2 DB ?
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
         ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
         MOV    AX,DATA
         MOV    DS,AX
        
    ;处理高四位 把第四位变成0
         MOV    AL,DATA1
         OR     AL,80H
         AND    AL,0F0H
    ;处理低四位
         ADD    AL,0BH
         MOV    DATA2,AL

    EXIT:
         MOV    AH,4CH
         INT    21H

CODE ENDS
    END MAIN