;在DATA段中定义了长度为LEN的字符串,请从键盘中输入字符串并且统计出其中大写字母的个数并存放到LARGE单元中
;并且显示在屏幕上
DATA SEGMENT
    MAXLENGTH DB 100
    LEN       DB ?
    STRING    DB 100 DUP('$')
    LARGE     DB ?
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
          ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN: 
          MOV    AX,DATA
          MOV    DS,AX

    INPUT:
          LEA    DX,MAXLENGTH
          MOV    AH,10
          INT    21H
    
          LEA    BX,STRING
          MOV    CH,0
          MOV    CL,LEN
    LOP:  
    ;'a'='A'+20H
          MOV    AL,[BX]
          CMP    AL,'a'
          JGE    DONE
    ;大写字母的处理
          INC    LARGE
    DONE: 
          INC    BX
          LOOP   LOP

    EXIT: 
          MOV    AH,4CH
          INT    21H

CODE ENDS
    END MAIN