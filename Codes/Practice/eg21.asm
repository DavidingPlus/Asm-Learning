;加密移动字符串，设缓冲区BUFF中有20个小写字母a，将每个a加上它相对于缓冲区的位移量后传送到缓冲区DBUFF。
DATA SEGMENT
    BUFF  DB 20 DUP('a')
    DBUFF DB 20 DUP(?)
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
         ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:
         MOV    AX,DATA
         MOV    DS,AX

         LEA    BX,DBUFF
         MOV    CX,20
         MOV    DL,0
    LOP: 
         MOV    AL,'a'
         ADD    AL,DL
         MOV    [BX],AL
         INC    BX
         INC    DL
         LOOP   LOP

    EXIT:
         MOV    AH,4CH
         INT    21H
CODE ENDS
END MAIN
