;统计不同分数段的人数
DATA SEGMENT
     GRADE  DB  76,69,84,90,73,88,99,63,100,80
     LEN    EQU $-GRADE                            ;与字符串相同的意思!!!
     COUNT1 DB  0
     COUNT2 DB  0
     COUNT3 DB  0
     COUNT4 DB  0
     COUNT5 DB  0
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
          ASSUME DS:DATA,SS:STACK,CS:CODE
     MAIN:
          MOV    AX,DATA
          MOV    DS,AX

          LEA    BX,GRADE
          MOV    CL,LEN
     LOP: 
          MOV    AL,[BX]
          CMP    AL,60
         

     EXIT:
          MOV    AH,4CH
          INT    21H
CODE ENDS
END MAIN