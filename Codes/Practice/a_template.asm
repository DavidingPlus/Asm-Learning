DATA SEGMENT
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
          ASSUME DS:DATA,SS:STACK,CS:CODE
     MAIN:
          MOV    AX,DATA
          MOV    DS,AX

     EXIT:
          MOV    AH,4CH
          INT    21H
CODE ENDS
END MAIN

;https://max.book118.com/html/2019/1201/6013003050002130.shtm
;https://blog.csdn.net/qq_43477139/article/details/118224532

