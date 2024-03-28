;如果字节单元BUFF1和BUFF2相等,则调用子程序,显示'#';否则输出'!'
DATA SEGMENT
    BUFF1 DB 12H
    BUFF2 DB 12H
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
            ASSUME DS:DATA,SS:STACK,CS:CODE
    MAIN:   
            MOV    AX,DATA
            MOV    DS,AX

            MOV    AL,BUFF1
            CMP    AL,BUFF2
            JE     DONE1
            CALL   OUTPUT2
            JMP    EXIT

    DONE1:  
            CALL   OUTPUT1

    EXIT:   
            MOV    AH,4CH
            INT    21H

OUTPUT1 PROC
            MOV    DL,'#'
            MOV    AH,2
            INT    21H
            RET
OUTPUT1 ENDP

OUTPUT2 PROC
            MOV    DL,'!'
            MOV    AH,2
            INT    21H
            RET
OUTPUT2 ENDP

CODE ENDS
END MAIN
