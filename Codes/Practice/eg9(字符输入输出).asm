;字符输入输出
DATA SEGMENT
    ROWCHANGE DB 0DH,0AH,'$'
DATA ENDS
    
STACK SEGMENT
STACK ENDS

CODE SEGMENT
              ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:     
              MOV    AX,DATA
              MOV    DS,AX

    ;从键盘中输入单个字符 1号 默认输入到AL
    INPUT:    
              MOV    AH,1
              INT    21H
        
    ;字符输出的时候需要把内容给到DL 2号
    OUPUT:    
              CALL   CHANGEROW
              MOV    DL,AL
              MOV    AH,2
              INT    21H

    ;换行
CHANGEROW PROC
              LEA    DX,ROWCHANGE
              MOV    AH,9
              INT    21H
              RET                                ;需要return
CHANGEROW ENDP

    EXIT:     
              MOV    AH,4CH
              INT    21H

CODE ENDS
END MAIN