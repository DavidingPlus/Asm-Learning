;编写一个程序，先提示输入数字“Input Number：0～9”，然后在下一行显示输入的数字，结束；
;如果不是键入了0～9数字，就提示错误“Error!”，继续等待输入数字。
DATA SEGMENT
    WORD1     DB 'Input Number: 0~9',0DH,0AH,24H
    WORD2     DB 'Error!',0DH,0AH,24H
    NUM       DB ?,0DH,0AH,24H
    CHANGEROW DB 0DH,0AH,24H
DATA ENDS
    
STACK SEGMENT
STACK ENDS

CODE SEGMENT
              ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:     
              MOV    AX,DATA
              MOV    DS,AX

    DISPLAY1: 
              LEA    DX,WORD1
              MOV    AH,9
              INT    21H

    INPUT:    
              MOV    AH,1
              INT    21H
              MOV    NUM,AL
              CALL   ROWCHANGE
    ;现在加入循环
              MOV    CX,10
    JUDGE:    
    ;判断是不是数字0-9 但是由于输入的是字符 所以应该用字符去比较
              MOV    AL,'0'
              CMP    AL,NUM
              JLE    NEXT
              JMP    NOTNUM
    NEXT:     
              MOV    AL,'9'
              CMP    AL,NUM
              JL     NOTNUM
    ;如果是数字则展示出来
    DISPLAY2: 
              LEA    DX,NUM
              MOV    AH,9
              INT    21H
              JMP    EXIT
    NOTNUM:   
              LEA    DX,WORD2
              MOV    AH,9
              INT    21H
              JMP    LOP
            
    LOP:      
              INC    CX
              LOOP   INPUT

    EXIT:     
              MOV    AH,4CH
              INT    21H

    ;换行
ROWCHANGE PROC
              LEA    DX,CHANGEROW
              MOV    AH,9
              INT    21H
              RET
ROWCHANGE ENDP

CODE ENDS
        END MAIN
        