;字符串输入输出
; ##### 10号指令：从键盘输入字符串

; 内存里需要划分三个部分：
; 	1.一个字节存放最大长度（你写，溢出会被裁掉）
; 	2.一个字节存放实际长度（指令运行完CPU会写)!!!!!
; 	3.一些字节用来存字符串

DATA SEGMENT
    MAXLENGTH    DB 100
    ACTUALLENGTH DB ?
    STRING       DB 100 DUP(?)
    CHANGEROW    DB 0DH,0AH,24H
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

    OUTPUT: 
            CALL   ADDTAIL
    ;先输出换行
            LEA    DX,CHANGEROW
            MOV    AH,9
            INT    21H
    ;在输出字符串
            LEA    DX,STRING
            MOV    AH,9
            INT    21H

    ;在字符串尾部加上'$'(24H)
ADDTAIL PROC
            LEA    BX,STRING
            MOV    DH,0
            MOV    DL,ACTUALLENGTH
            ADD    BX,DX
            MOV    [BX],24H
            RET
ADDTAIL ENDP

    EXIT:   
            MOV    AH,4CH
            INT    21H

CODE ENDS
    END MAIN