;通过堆栈的方式来写三个数的最大值
DATA SEGMENT
    X    DW 1234H
    Y    DW 2345H
    Z    DW -1234H
    W    DW ?
DATA ENDS

STACK SEGMENT
    NUMS  DW 1024 DUP(?)
    TOP   DW LENGTH NUMS
STACK ENDS

CODE SEGMENT
              ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:     
              MOV    AX,DATA
              MOV    DS,AX
              MOV    AX,STACK
              MOV    SS,AX
              MOV    SP,TOP

    ;压栈
    PUSHING:  
              MOV    AX,X
              PUSH   AX
              MOV    AX,Y
              PUSH   AX
              MOV    AX,Z
              PUSH   AX

    ;取得栈顶指针来进行比较
              MOV    BP,SP
              CALL   GETMAXNUM
              MOV    W,AX
        
    EXIT:     
              MOV    AH,4CH
              INT    21H

    ;得到最大值
GETMAXNUM PROC
    ;在栈里面是从高地址开始访问的 与数据段的访问有些不同 最上面是Z 访问Z是[BP+2]
              MOV    AX,[BP+2]                   ;Z
              CMP    AX,[BP+4]                   ;Y Z比较
              JGE    DONE1
              MOV    AX,[BP+4]                   ;Y
    DONE1:    
              CMP    AX,[BP+6]                   ;Y Z大的和X比较
              JGE    DONE2
              MOV    AX,[BP+6]
    DONE2:    
              RET
GETMAXNUM ENDP

CODE ENDS
    END MAIN