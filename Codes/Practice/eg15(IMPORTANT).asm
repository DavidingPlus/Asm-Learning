; 从键盘输入两个2位十进制正数转换成十六进制数后，对这两个数相加，结果以十六进制数形式显示在屏幕上。
;      例如：
;      输入：12 34
;      屏幕上显示：2E

DATA SEGMENT
      STRING     DB 6 DUP('$')
      NUM1       DB 0
      NUM2       DB 0
      SUM        DB 0
      RET_STRING DB 3 DUP('$')
      CHANGEROW  DB 0DH,0AH,'$'
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
                 ASSUME DS:DATA,SS:STACK,CS:CODE
      MAIN:      
                 MOV    AX,DATA
                 MOV    DS,AX
                 LEA    BX,STRING
                 MOV    CX,5

      ;输入 一个字符的输入 存入STRING中 1左移一位加上2得NUM1 空格分开
      INPUT:     
                 MOV    AH,1
                 INT    21H
      ;将字符数字转化为数字存入内存 '1'=31H '1'-1=30H
                 CMP    AL ,' '
                 JE     DONE
                 SUB    AL,30H
      DONE:      
                 MOV    [BX],AL
                 INC    BX
                 LOOP   INPUT
      
      GETNUM1:   
                 LEA    BX,STRING
                 MOV    AL,[BX]                       ;NUM1的十位数字
                 MOV    CL,3
                 SAL    AL,CL
                 MOV    DL,[BX]
                 SAL    DL,1
                 ADD    AL,DL
                 MOV    NUM1,AL                       ;得到十位部分
              
                 INC    BX
                 MOV    AL,[BX]
                 ADD    NUM1,AL                       ;得到十位数

                 ADD    BX,2

      GETNUM2:   
                 MOV    AL,[BX]                       ;NUM1的十位数字
                 MOV    CL,3
                 SAL    AL,CL
                 MOV    DL,[BX]
                 SAL    DL,1
                 ADD    AL,DL
                 MOV    NUM2,AL                       ;得到十位部分
              
                 INC    BX
                 MOV    AL,[BX]
                 ADD    NUM2,AL                       ;得到十位数
      
      GETSUM:    
                 MOV    AL,NUM1
                 ADD    AL,NUM2
                 MOV    SUM,AL
              
      GET_RESULT:
                 LEA    BX,RET_STRING
                 MOV    AL,SUM
      ;先得到十位数字 逻辑右移
                 MOV    CL,4
                 SHR    AL,CL
                 CALL   DETAIL
                 MOV    [BX],AL
                 
      ;再得到个位数字
                 INC    BX
                 MOV    AL,SUM
                 MOV    CL,4
                 SHL    AL,CL
                 MOV    CL,4
                 SHR    AL,CL
                 CALL   DETAIL
                 MOV    [BX],AL
      
      OUTPUT:    
                 LEA    DX,CHANGEROW
                 MOV    AH,9
                 INT    21H

                 LEA    DX,RET_STRING
                 MOV    AH,9
                 INT    21H

      EXIT:      
                 MOV    AH,4CH
                 INT    21H

      ;对数字进行处理将其变成数字字符 '1'-01H=30H 'A'-0AH=37H
DETAIL PROC
                 CMP    AL,09H
                 JLE    DONE1
                 ADD    AL,37H
                 RET

      DONE1:     
                 ADD    AL,30H
                 RET
DETAIL ENDP


CODE ENDS
    END MAIN
