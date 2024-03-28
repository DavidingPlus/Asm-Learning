;求十个数的最大值
DATA SEGMENT
    BUF  DB 2,-5,6,-8,0,0,1,-9,5,4    ;定义了十个变量
    MAX  DB ?
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
          ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN: 
          MOV    AX,DATA
          MOV    DS,AX

          LEA    BX,BUF
          MOV    AL,[BX]                     ;将循环当中较大的数放到AL当中
    ;可以放在[]内进行间接寻址的寄存器只有BX，BP，SI和DI，其他寄存器可以存放偏移地址，但不可用来寻址。
          INC    DX
          MOV    CX,9
    LOP:  
          CMP    AL,[BX]
          JGE    DONE1
          MOV    AL,[BX]

    DONE1:
          INC    BX
          LOOP   LOP
          MOV    MAX,AL
    
    EXIT: 
          MOV    AH,4CH
          INT    21H

CODE ENDS
END MAIN