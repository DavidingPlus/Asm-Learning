;求1-100的和，存入SUM单元
DATA SEGMENT
       SUM  DW 0
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
              ASSUME DS:DATA,SS:STACK,CS:CODE
       MAIN:  
              MOV    AX,DATA
              MOV    DS,AX

              MOV    BX,0
              MOV    DX,1
              MOV    CX,100

       GETSUM:
              ADD    BX,DX
              INC    DX
              LOOP   GETSUM

              MOV    SUM,BX
        
       EXIT:  
              MOV    AH,4CH
              INT    21H

CODE ENDS
END MAIN