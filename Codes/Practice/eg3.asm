;从键盘中输入一串字符串,将里面的所有大写变成小写,并且返回出来
; 'a'='A'+20H

DATA SEGMENT
    ; 10号指令：从键盘输入字符串
    ; 内存里需要划分三个部分：
    ; 1.一个字节存放最大长度（你写，溢出会被裁掉）
    ; 2.一个字节存放实际长度（指令运行完CPU会写）
    ; 3.一些字节用来存字符串
    MAXLENGTH    DB 100
    ACTUALLENGTH DB ?
    STRING       DB 100 DUP(?)
    CHANGEROW    DB 0DH,0AH,'$'
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
              ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:     
              MOV    AX,DATA
              MOV    DS,AX

    INPUT:    
              LEA    DX,MAXLENGTH                ;在哪里输入字符串
              MOV    AH,10
              INT    21H                         ;10号指令输入字符串

              LEA    BX,STRING                   ;从string的每个字符开始对比
              MOV    CH,0
              MOV    CL,ACTUALLENGTH             ;因为字节不能直接给字赋值
    PROGESS:  
              MOV    AL,[BX]
              CALL   TURNSMALL
              MOV    [BX],AL
              INC    BX
              LOOP   PROGESS

    ADDTAIL:  
              LEA    BX,STRING                   ;找到数组的最后一个元素的下一个元素并且加上'$'
              MOV    DH,0
              MOV    DL,ACTUALLENGTH
              ADD    BX,DX

              MOV    AL,'$'                      ;24H
              MOV    [BX],AL

    OUTPUT:   
              LEA    DX,CHANGEROW
              MOV    AH,9
              INT    21H
                

              LEA    DX,STRING
              MOV    AH,9
              INT    21H
    EXIT:     
              MOV    AH,4CH
              INT    21H

TURNSMALL PROC
              CMP    AL,'a'                      ;'a'='A'+20H
              JGE    DONE
              ADD    AL,20H
    DONE:     
              RET
TURNSMALL ENDP

CODE ENDS
    END MAIN