;Fibonacci numbers的定义：f1=1，f2=1，fn= fn-1 + fn-2 （n>=3） 编程输出Fibonacci numbers的第n项。
;测试案例 30项 832040
DATA SEGMENT
     NUM   DB 3     ;存放n
     VALUE DW 0     ;存放第n项的数据
DATA ENDS

STACK SEGMENT
     FIBO  DW 100 DUP(?)
     TOP   DW LENGTH FIBO
STACK ENDS

CODE SEGMENT
              ASSUME DS:DATA,SS:STACK,CS:CODE
     MAIN:    
              MOV    AX,DATA
              MOV    DS,AX
              MOV    AX,STACK
              MOV    SS,AX
              MOV    SP,TOP

     ;思路:将数据存到栈当中
     ;先压栈第一项和第二项
              MOV    AX,1
              PUSH   AX
              PUSH   AX
     ;先判断是不是第一项或者第二项
              MOV    AL,NUM
              CMP    AL,2
              JG     DONE
     ;表示为第一项或者第二项
              MOV    AX,1
              MOV    VALUE,AX
              JMP    EXIT

     DONE:    
     ;后续的项
              MOV    AL,NUM
              SUB    AL,2
              MOV    CH,0
              MOV    CL,AL                        ;直接写NUM - 2 会报错
     LOP:     
              MOV    BP,SP
              MOV    AX,[BP+2]
              ADD    AX,[BP+4]
              PUSH   AX
              LOOP   LOP

     GETVALUE:
              POP    AX
              MOV    VALUE,AX

     EXIT:    
              MOV    AH,4CH
              INT    21H
CODE ENDS
     END MAIN
