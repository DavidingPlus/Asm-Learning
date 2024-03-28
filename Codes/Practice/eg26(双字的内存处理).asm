; 有一个首地址为array的10个有符号的双字数组，编程分别求出偶数和与奇数和并输出。
DATA SEGMENT
    ARRAY   DW 1,4,-2,3,-1,5,7,-3,-2,2
    ODDSUM  DW 0                          ;奇数和
    EVENSUM DW 0                          ;偶数和
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
         ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
         MOV    AX,DATA
         MOV    DS,AX

         LEA    BX,ARRAY
         MOV    CX,10
    LOP: 
         MOV    AX,[BX]
    ;判断是不是为偶数 将该二进制数与0001H作与运算 偶数0 奇数1
    ;注意 负数用补码表示 但是不影响奇数或者偶数 因为除了符号位 按位取反再末尾加1
         TEST   AX,0001H
         JZ     DONE
    ;奇数
         ADD    ODDSUM,AX
         ADD    BX,2                        ;由于是用双字(16)位存储的,那么内存应该加2每次!!!!!!!!
         LOOP   LOP
    DONE:
    ;偶数
         ADD    EVENSUM,AX
         ADD    BX,2
         LOOP   LOP

    EXIT:
         MOV    AH,4CH
         INT    21H
CODE ENDS
    END MAIN