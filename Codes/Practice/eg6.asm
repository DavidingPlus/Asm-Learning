DATA SEGMENT
      BUF   DB 2,-5,6,-8,0,0,1,-9,5,4      ;定义了十个变量
      PLUS  DB 0                           ;存放正负零的个数
      MINUS DB 0
      ZERO  DB 0
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
            ASSUME DS:DATA,SS:STACK,CS:CODE
      MAIN: 
            MOV    AX,DATA
            MOV    DS,AX

            LEA    BX,BUF
            MOV    CX,10
      LOP:  
            CMP    [BX],0
            JGE    DONE1
            INC    MINUS                         ;inc和decz指令可以操作寄存器或者内存单元，但是不可以操作段寄存器
      DONE1:
            CMP    [BX],0
            JG     DONE2
            INC    ZERO
      DONE2:
            INC    PLUS
         
            LOOP   LOP
    
      EXIT: 
            MOV    AH,4CH
            INT    21H

CODE ENDS
END MAIN