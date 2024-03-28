;比较两个字符串string1和string2所含的字符是否相同。若相同则显示‘true’,否则显示‘false’。
DATA SEGMENT
      STRING1        DB  'i am a student'
      LENGTH_STRING1 EQU $-STRING1                ;这样就可以得到字符串长度 也可以用EQU 这时候就代表是个符号常量
      STRING2        DB  'i am a student'
      LENGTH_STRING2 EQU $-STRING2
      ;汇编中的LENGTH:返回利用dup定义的数组中的元素个数，即重复操作符dup前的count值 上面这两个会返回1!!!
      TRUES          DB  'true',0DH,0AH,24H
      FALSES         DB  'false',0DH,0AH,24H
DATA ENDS

STACK SEGMENT
STACK ENDS

CODE SEGMENT
            ASSUME DS:DATA,SS:STACK,CS:CODE
      MAIN: 
            MOV    AX,DATA
            MOV    DS,AX

            LEA    SI,STRING1
            LEA    DI,STRING2
            MOV    AL,LENGTH_STRING1
            CMP    AL,LENGTH_STRING2
            JNZ    FALSE
            MOV    CL, LENGTH_STRING1
      LOP:  
            MOV    AL,[SI]
            MOV    BL,[DI]
            CMP    AL,BL
            JNZ    FALSE
            INC    SI
            INC    DI
            LOOP   LOP

      TRUE: 
            LEA    DX,TRUES
            MOV    AH,9
            INT    21H
            JMP    EXIT

      FALSE:
            LEA    DX,FALSES
            MOV    AH,9
            INT    21H

      EXIT: 
            MOV    AH,4CH
            INT    21H

CODE ENDS
    END MAIN