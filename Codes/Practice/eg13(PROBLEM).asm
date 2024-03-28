; 分别统计下列20个数中大于5、小于零和大于等于零且小于等于5的数据个数，分别存入字节单元RES1、RES2和RES3中。
; BUFF DB -1, 20, 3, 30, -5, 15, 100, -54, 0, 4, 78, 99, -12, 32, 3, 23, -7, 24, 60,-51

;有符号数比较 G L E
;无符号数比较 A B E

DATA SEGMENT
      BUFF DB -1, 20, 3, 30, -5, 15, 100, -54, 0, 4, 78, 99, -12, 32, 3, 23, -7, 24, 60,-51
      RES1 DB 0
      RES2 DB 0
      RES3 DB 0
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
            ASSUME DS:DATA,SS:STACK,CS:CODE
      MAIN: 
            MOV    AX,DATA
            MOV    DS,AX

            LEA    BX,BUFF
            MOV    CX,20
      LOP:  
            CMP    [BX],5
            JLE    DONE1
            INC    RES1                          ;inc和decz指令可以操作寄存器或者内存单元，但是不可以操作段寄存器
            JMP    JUMP
      DONE1:
            CMP    [BX],0
            JL     DONE2
            INC    RES3
            JMP    JUMP
      DONE2:
            INC    RES2
            JMP    JUMP

      JUMP: 
            INC    BX
            LOOP   LOP

      EXIT: 
            MOV    AH,4CH
            INT    21H

CODE ENDS
END MAIN
