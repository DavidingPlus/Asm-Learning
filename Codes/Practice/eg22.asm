;从键盘输入小写字母,输出大写字母
DATA SEGMENT
       MAXLENGTH     DB 100
       ACTUALLLENGTH DB ?
       STRING        DB 100 DUP(?)
       CHANGEROW     DB 0DH,0AH,'$'
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
               MOV    CL,ACTUALLLENGTH
       LOP:    
               SUB    [BX],20H
               INC    BX
               LOOP   LOP
    
       ADDTAIL:
               LEA    BX,STRING
               MOV    DH,0
               MOV    DL,ACTUALLLENGTH
               ADD    BX,DX
               MOV    [BX],24H

       OUTPUT: 
       ;先换行
               LEA    DX,CHANGEROW
               MOV    AH,9
               INT    21H

               LEA    DX,STRING
               MOV    AH,9
               INT    21H

       EXIT:   
               MOV    AH,4CH
               INT    21H
CODE ENDS
END MAIN
