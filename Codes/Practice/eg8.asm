;统计键盘输入的大写字母的个数,回车符结束
DATA SEGMENT
    NUM  DB 0
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
         ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
         MOV    AX,DATA
         MOV    DS,AX
         MOV    BL,0                        ;用BL保存大写字母个数

    LOP: 
    ;一个一个字符输入 输入1 10 输出 2 9 分别对应单个字符和字符串
         MOV    AH,1
         INT    21H

    ;判断是不是回车 回车是0DH
         CMP    AL,0DH
         JZ     EXIT
         
    ;'a'='A'+20H 键盘输入的字符不一定是字母有可能为数字 所以要做两次判断
         CMP    AL,'A'
         JL     DONE
         CMP    AL,'Z'
         JG     DONE
         INC    BL

    DONE:
         LOOP   LOP

    EXIT:
         MOV    NUM,BL
         MOV    AH,4CH
         INT    21H

CODE ENDS
    END MAIN