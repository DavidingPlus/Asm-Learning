;分段函数，如果x < 1,y = x; 如果1<= x < 10,y = 2x - 1;如果x >= 10,y = 3x - 1
DATA SEGMENT
    X    DB 13
    Y    DB ?
DATA ENDS

STACK SEGMENT
STACK ENDS
    
CODE SEGMENT
          ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN: 
          MOV    AX,DATA
          MOV    DS,AX

          MOV    AL,X
          CMP    AL,1
          JGE    DONE1
    ;Y=X
          MOV    Y,AL
          JMP    EXIT

    DONE1:
          CMP    AL,10
          JGE    DONE2
    ;Y=2X-1
          SAL    AL,1
          SUB    AL,1
          MOV    Y,AL
          JMP    EXIT
    
    DONE2:
    ;Y=3X-1
          SAL    AL,1
          ADD    AL,X
          SUB    AL,1
          MOV    Y,AL
          JMP    EXIT

    EXIT: 
          MOV    AH,4CH
          INT    21H
    ;  HLT

CODE ENDS
        END MAIN