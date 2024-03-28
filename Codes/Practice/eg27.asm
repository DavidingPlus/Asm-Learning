;最大值和最小值
DATA SEGMENT
    ARRAY DW 1,4,-2,3,-1,5,7,-3,-2,2
    MAX   DW 0                          ;最大值
    MIN   DW 0                          ;最小值
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
          ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN: 
          MOV    AX,DATA
          MOV    DS,AX

          LEA    BX,ARRAY
    ;将第一个数填入MAX和MIN单元中
          MOV    AX,[BX]
          MOV    MAX,AX
          MOV    MIN,AX
    ;   INC    BX
    ;双字加2
          ADD    BX,2
          MOV    CX,9

    LOP:  
          MOV    AX,[BX]
          CMP    MAX,AX
          JGE    DONE
          MOV    MAX,AX
    DONE: 
          CMP    MIN,AX
          JLE    DONE2
          MOV    MIN,AX
    DONE2:
    ;   INC    BX
          ADD    BX,2
          LOOP   LOP

    EXIT: 
          MOV    AH,4CH
          INT    21H
CODE ENDS
END MAIN