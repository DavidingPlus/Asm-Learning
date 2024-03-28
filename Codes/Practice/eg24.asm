; 己定义了两个整数变量A和B，试编写程序完成下列功能：
; A.若两个数中有一个是奇数，则将奇数存入A中，偶数存入B中
; B.若两个数均为奇数，则将两数均加1后存回原变量
; C.若两个数均为偶数，则两个变量均不改变
DATA SEGMENT
      A    DB 4
      B    DB 6
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
            ASSUME DS:DATA,SS:STACK,CS:CODE
      MAIN: 
            MOV    AX,DATA
            MOV    DS,AX

      ;判断是否为奇数 将这个二进制数与01H相与 偶数0 奇数1
            TEST   A,01H
            JZ     DONE1
      ;A奇数 现在判断B
            TEST   B,01H
            JZ     DONE3
      ;A B均是奇数
            MOV    AL,A
            ADD    AL,1
            MOV    A,AL
            MOV    AL,B
            ADD    AL,1
            MOV    B,AL
            JMP    EXIT
      DONE1:
      ;A是偶数 现在判断B
            TEST   B,01H
            JZ     DONE2
      ;A偶数 B奇数
            CALL   SWAP
            JMP    EXIT
      DONE2:
      ;A B均是偶数
            JMP    EXIT
      DONE3:
      ;A奇数 B偶数
            CALL   SWAP
            JMP    EXIT

      EXIT: 
            MOV    AH,4CH
            INT    21H

      ;交换A B
SWAP PROC
            MOV    AL,A
            MOV    BL,B
            MOV    A,BL
            MOV    B,AL
            RET
SWAP ENDP

CODE ENDS
END MAIN
