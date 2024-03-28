;输入一段字符串求长度
DATA SEGMENT
    STRING DB 30 DUP('$')
    LENG   DB 0
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
             ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:    
             MOV    AX,DATA
             MOV    DS,AX

    INPUT:   
             LEA    DX,STRING
             MOV    AH,10
             INT    21H
        
    GETLENTH:
             LEA    BX,STRING
             MOV    DL,0
             MOV    CL,10
    LOP:     
             MOV    AL,[BX]
             CMP    AL,24H
             JZ     EXIT
             INC    LENG
             INC    BX
             INC    CL
             LOOP   LOP

    EXIT:    
             MOV    AH,4CH
             INT    21H
CODE ENDS
    END MAIN