;求 X Y Z 里面最大的那一个并放到 W 里
DATA SEGMENT
      X    DW 1234H
      Y    DW 2345H
      Z    DW -1234H
      W    DW ?
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
            ASSUME DS:DATA,SS:STACK,CS:CODE
      MAIN: 
            MOV    AX,DATA
            MOV    DS,AX
      ;先比较x和y
            MOV    AX,X
            CMP    AX,Y
            JGE    MOVE                          ;AX(存X)比Y大
            MOV    AX,Y

      MOVE: 
            CMP    AX,Z
            JGE    MOVE2                         ;AX(存X)比Z大
            MOV    AX,Z

      MOVE2:
            MOV    W,AX
          
            MOV    AH,4CH
            INT    21H

CODE ENDS
END MAIN