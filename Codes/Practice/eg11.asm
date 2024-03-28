;求1-100的奇数和
DATA SEGMENT
     SUM  DW 0
DATA ENDS

CODE SEGMENT
          ASSUME DS:DATA,CS:CODE
     MAIN:
          MOV    AX,DATA
          MOV    DS,AX

          MOV    BX,1
          MOV    DX,0
          MOV    CX,100
     LOP: 
     ;判断是否为奇数
     ;test命令 将两个数按二进制每一位进行与操作
          TEST   BX,1                ;将DX和1按照二进制按位与 0表示偶数 1表示为奇数
          JZ     DONE
          ADD    DX,BX
     DONE:
          INC    BX
          LOOP   LOP

     EXIT:
          MOV    SUM ,DX
          MOV    AH,4CH
          INT    21H

CODE ENDS
    END MAIN