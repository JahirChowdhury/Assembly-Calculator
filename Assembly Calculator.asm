.STACK 100H

.DATA

A DB 0DH,0AH, 'PRESS 1 FOR ADDITION $' 
A1 DB 0DH,0AH,'2 FOR SUBSTRUCTION $' 
A2 DB 0DH,0AH,'3 FOR MULTIPLICATION $'
A3 DB 0DH,0AH,'4 FOR DIVISION $' 
A4 DB 0DH,0AH,'5 FOR MOD $'
A5 DB 0DH,0AH,'6 FOR SQUARE : $'
B DB 0DH,0AH, 'ENTER FIRST NUMBER  $'
C DB 0DH,0AH, 'ENTER SECOND NUMBER $'
D DB 0DH,0AH, 'WANT TO CALCULATE AGAIN? $'
F DB 0DH,0AH, 'WRONG INPUT!START FROM BEGINING $'
G DB 0DH,0AH, 'WRONG INPUT! $'
H DB 0DH,0AH, 'THE RESULT IS: $' 
I DB 0DH,0AH, 'NOT IN RANGE $'

X DW ?
Y DW ?
Z DW ?

.CODE

MOV AX,@DATA
MOV DS,AX

MOV BX,0
MOV CX,0
MOV DX,0
MOV AX,0

AGAIN:  

    LEA DX,B
    MOV AH,9
    INT 21H

INDEC PROC
    
    PUSH BX
    PUSH CX
    PUSH DX
    
@BEGIN:

XOR BX,BX      ;HOLDS TOTAL
XOR CX,CX       ;SIGN
                
MOV AH,1        ;CHAR IN AL
INT 21H

CMP AL,'-'       ;-
JE @MINUS        ;YES SIGN
CMP AL,'+'       ;PRINT

JE @PLUS

JMP @REPEAT2     ;START PROCESSING

@MINUS:
MOV CX,1         ;NEGATIVE=TRUE

@PLUS:

INT 21H          ;READ A CHAR

@REPEAT2: 

CMP AL,48
JL ERROR

CMP AL,57
JG ERROR

AND AX,00FH       ;CONVERT TO DIGIT
PUSH AX           ;SAVE ON STACK

MOV AX,10          ;GET 10
MUL BX              ;AX=TOTAL * 10
POP BX              ;GET DIGIT BACK
ADD BX,AX           ;TOTAL = TOTAL X 10 +DIGIT

MOV AH,1
INT 21H

CMP AL,0DH        ;CARRIAGE RETURN
JNE @REPEAT2      ;NO KEEP GOING

CMP BX,32767
JA ERROR3

CMP BX,65535
JA ERROR3
    
MOV AX,BX  ;STORE IN AX 

OR CX,CX          ;NEG NUM
JE NEXT

NEG AX            ;YES, NEGATE

JMP NEXT

                    ;AND RETURN

INDEC ENDP

AGAIN1: 

    LEA DX,C
    MOV AH,9
    INT 21H

INDEC1 PROC
    
    PUSH BX
    PUSH CX
    PUSH DX
    

@BEGIN1:


XOR BX,BX      ;HOLDS TOTAL
XOR CX,CX       ;SIGN
                
MOV AH,1        ;CHAR IN AL
INT 21H

CMP AL,'-'       ;-
JE @MINUS1        ;YES SIGN
CMP AL,'+'       ;PRINT

JE @PLUS1  

CMP AL,48
JL ERROR

CMP AL,57
JG ERROR
       ;YES, GET ANOTHER CHAR
JMP @REPEAT21     ;START PROCESSING

@MINUS1:
MOV CX,1         ;NEGATIVE=TRUE

@PLUS1:

INT 21H          ;READ A CHAR

@REPEAT21: 

CMP AL,48
JL ERROR

CMP AL,57
JG ERROR


AND AX,00FH       ;CONVERT TO DIGIT
PUSH AX           ;SAVE ON STACK

MOV AX,10          ;GET 10
MUL BX              ;AX=TOTAL * 10
POP BX              ;GET DIGIT BACK
ADD BX,AX           ;TOTAL = TOTAL X 10 +DIGIT

MOV AH,1
INT 21H

CMP AL,0DH        ;CARRIAGE RETURN
JNE @REPEAT21      ;NO KEEP GOING

CMP BX,32767
JA ERROR3

CMP BX,65535
JA ERROR3

MOV AX,BX         ;STORE IN AX

OR CX,CX          ;NEG NUM
JE ADD2

NEG AX            ;YES, NEGATE

JMP ADD2

INDEC1 ENDP

AGAIN2: 

    LEA DX,C
    MOV AH,9
    INT 21H

INDEC2 PROC
    
    PUSH BX
    PUSH CX
    PUSH DX
    
    
@BEGIN2:


XOR BX,BX      ;HOLDS TOTAL

XOR CX,CX       ;SIGN
                

MOV AH,1        ;CHAR IN AL
INT 21H


CMP AL,'-'       ;-
JE @MINUS2        ;YES SIGN
CMP AL,'+'       ;PRINT

JE @PLUS2

         ;YES, GET ANOTHER CHAR
JMP @REPEAT22     ;START PROCESSING

@MINUS2:
MOV CX,1         ;NEGATIVE=TRUE

@PLUS2:

INT 21H          ;READ A CHAR

@REPEAT22: 

CMP AL,48
JL ERROR

CMP AL,57
JG ERROR


AND AX,00FH       ;CONVERT TO DIGIT
PUSH AX           ;SAVE ON STACK

MOV AX,10          ;GET 10
MUL BX              ;AX=TOTAL * 10
POP BX              ;GET DIGIT BACK
ADD BX,AX           ;TOTAL = TOTAL X 10 +DIGIT


MOV AH,1
INT 21H

CMP AL,0DH        ;CARRIAGE RETURN
JNE @REPEAT22      ;NO KEEP GOING

CMP BX,32767
JA ERROR3

CMP BX,65535
JA ERROR3

MOV AX,BX         ;STORE IN AX

OR CX,CX          ;NEG NUM

JE SUB2

NEG AX            ;YES, NEGATE



POP DX            ;RESTORE REGISTERS
POP CX
POP BX
RET                    ;AND RETURN



INDEC2 ENDP 

AGAIN3:  

    LEA DX,C
    MOV AH,9
    INT 21H

INDEC3 PROC
    
    PUSH BX
    PUSH CX
    PUSH DX
    
    
@BEGIN3:


XOR BX,BX      ;HOLDS TOTAL

XOR CX,CX       ;SIGN
                

MOV AH,1        ;CHAR IN AL
INT 21H


CMP AL,'-'       ;-
JE @MINUS3       ;YES SIGN
CMP AL,'+'       ;PRINT

JE @PLUS3

         ;YES, GET ANOTHER CHAR
JMP @REPEAT23     ;START PROCESSING

@MINUS3:
MOV CX,1         ;NEGATIVE=TRUE

@PLUS3:

INT 21H          ;READ A CHAR

@REPEAT23: 

CMP AL,48
JL ERROR

CMP AL,57
JG ERROR


AND AX,00FH       ;CONVERT TO DIGIT
PUSH AX           ;SAVE ON STACK

MOV AX,10          ;GET 10
MUL BX              ;AX=TOTAL * 10
POP BX              ;GET DIGIT BACK
ADD BX,AX           ;TOTAL = TOTAL X 10 +DIGIT


MOV AH,1
INT 21H

CMP AL,0DH        ;CARRIAGE RETURN
JNE @REPEAT23     ;NO KEEP GOING

CMP BX,32767
JA ERROR3

CMP BX,65535
JA ERROR3

MOV AX,BX         ;STORE IN AX

OR CX,CX          ;NEG NUM

JE MUL2

NEG AX            ;YES, NEGATE



POP DX            ;RESTORE REGISTERS
POP CX
POP BX
RET                    ;AND RETURN



INDEC3 ENDP

AGAIN4: 

    LEA DX,C
    MOV AH,9
    INT 21H


INDEC4 PROC
    
    PUSH BX
    PUSH CX
    PUSH DX
    
    
@BEGIN4:


XOR BX,BX      ;HOLDS TOTAL

XOR CX,CX       ;SIGN
                

MOV AH,1        ;CHAR IN AL
INT 21H


CMP AL,'-'       ;-
JE @MINUS4       ;YES SIGN
CMP AL,'+'       ;PRINT

JE @PLUS4

         ;YES, GET ANOTHER CHAR
JMP @REPEAT24     ;START PROCESSING

@MINUS4:
MOV CX,1         ;NEGATIVE=TRUE

@PLUS4:

INT 21H          ;READ A CHAR

@REPEAT24: 

CMP AL,48
JL ERROR

CMP AL,57
JG ERROR


AND AX,00FH       ;CONVERT TO DIGIT
PUSH AX           ;SAVE ON STACK

MOV AX,10          ;GET 10
MUL BX              ;AX=TOTAL * 10
POP BX              ;GET DIGIT BACK
ADD BX,AX           ;TOTAL = TOTAL X 10 +DIGIT


MOV AH,1
INT 21H

CMP AL,0DH        ;CARRIAGE RETURN
JNE @REPEAT24     ;NO KEEP GOING

CMP BX,32767
JA ERROR3

CMP BX,65535
JA ERROR3

MOV AX,BX         ;STORE IN AX

OR CX,CX          ;NEG NUM

JE DIV2

NEG AX            ;YES, NEGATE



POP DX            ;RESTORE REGISTERS
POP CX
POP BX
RET                    ;AND RETURN



INDEC4 ENDP 

AGAIN5: 

    LEA DX,C
    MOV AH,9
    INT 21H


INDEC5 PROC
    
    PUSH BX
    PUSH CX
    PUSH DX
    
    
@BEGIN5:


XOR BX,BX      ;HOLDS TOTAL

XOR CX,CX       ;SIGN
                

MOV AH,1        ;CHAR IN AL
INT 21H


CMP AL,'-'       ;-
JE @MINUS5       ;YES SIGN
CMP AL,'+'       ;PRINT

JE @PLUS5

         ;YES, GET ANOTHER CHAR
JMP @REPEAT25     ;START PROCESSING

@MINUS5:
MOV CX,1         ;NEGATIVE=TRUE

@PLUS5:

INT 21H          ;READ A CHAR

@REPEAT25: 

CMP AL,48
JL ERROR

CMP AL,57
JG ERROR


AND AX,00FH       ;CONVERT TO DIGIT
PUSH AX           ;SAVE ON STACK

MOV AX,10          ;GET 10
MUL BX              ;AX=TOTAL * 10
POP BX              ;GET DIGIT BACK
ADD BX,AX           ;TOTAL = TOTAL X 10 +DIGIT


MOV AH,1
INT 21H

CMP AL,0DH        ;CARRIAGE RETURN
JNE @REPEAT25     ;NO KEEP GOING

 cmp bx,32767
    ja error3
    
    cmp bx,65535
    ja error3

MOV AX,BX         ;STORE IN AX

OR CX,CX          ;NEG NUM

JE MOD2

NEG AX            ;YES, NEGATE



POP DX            ;RESTORE REGISTERS
POP CX
POP BX
RET                    ;AND RETURN



INDEC5 ENDP 

ERROR:

LEA DX,F 
MOV AH,9
INT 21H
    
JMP AGAIN 
    
ERROR2:

LEA DX,G
MOV AH,9
INT 21H
    
JMP ASK1

ERROR3:

LEA DX,I
MOV AH,9
INT 21H   

JMP AGAIN
    
NEXT:

MOV X,AX 

JMP ASK

ASK:

    LEA DX,A
    MOV AH,9
    INT 21H 
    LEA DX,A1
    INT 21H 
    LEA DX,A2
    INT 21H
    LEA DX,A3
    INT 21H
    LEA DX,A4
    INT 21H
    LEA DX,A5
    INT 21H
    
    MOV AH,1
    INT 21H 
    MOV BL,AL 
    
    CMP BL,'1'
    JE AGAIN1
    
    CMP BL,'2'
    JE AGAIN2 
    
    CMP BL,'3'
    JE AGAIN3
    
    CMP BL,'4'
    JE AGAIN4 
    
    CMP BL,'5'
    JE AGAIN5
    
    CMP BL,'6'
    JE SQR
    
    LEA DX,F
    MOV AH,9
    INT 21H
    
   
ASK1: 

    LEA DX,D
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    MOV BL,AL 
    
    CMP BL,'Y'
    JE AGAIN 
    
    CMP BL,'Y'
    JE AGAIN 
    
    CMP BL,'N'
    JE END_ 
    
    CMP BL,'N'
    JE END_ 
    
    JMP ERROR


ADD2: 

MOV Y,AX 

LEA DX,H
MOV AH,9
INT 21H

XOR AX,AX

MOV AX,Y
ADD X,AX

MOV AX,X

CMP AX,32767
JA ERROR3

CMP AX,65535
JA ERROR3

PUSH AX

JMP OUTPUT

SUB2: 



MOV Y,AX 


LEA DX,H
MOV AH,9
INT 21H


XOR AX,AX

MOV AX,Y
SUB X,AX


MOV AX,X   

CMP AX,32767
JA ERROR3

CMP AX,65535
JA ERROR3

PUSH AX

JMP OUTPUT

MUL2: 



MOV Y,AX 

LEA DX,H
MOV AH,9
INT 21H

XOR AX,AX

MOV AX,Y

MUL X

CMP AX,32767
JA ERROR3

CMP AX,65535
JA ERROR3

PUSH AX

JMP OUTPUT 

DIV2: 


;SECOND VALUE STORED IN B

MOV Y,AX 
MOV Z,CX

LEA DX,H
MOV AH,9
INT 21H

XOR AX,AX
XOR DX,DX

MOV DX,Z

MOV AX,X
 
DIV  Y

CMP AX,32767
JA ERROR3

CMP AX,65535
JA ERROR3

PUSH AX


JMP OUTPUT

MOD2: 


;SECOND VALUE STORED IN B

MOV Y,AX
MOV Z,DX 

LEA DX,H
MOV AH,9
INT 21H

XOR AX,AX
XOR DX,DX

MOV AX,X
 
DIV  Y

CMP AX,32767
JA ERROR3

CMP AX,65535
JA ERROR3

CMP DX,32767
JA ERROR3

CMP DX,65535
JA ERROR3

PUSH AX 
PUSH DX


JMP OUTPUT2    

SQR:


LEA DX,H
MOV AH,9
INT 21H


XOR AX,AX

MOV AX,X

MUL X

CMP AX,32767
JA ERROR3

CMP AX,65535
JA ERROR3

PUSH AX

JMP OUTPUT    

OUTPUT:

OUTDEC PROC
    
PUSH AX            ;SAVE REGISTERS
 PUSH BX
PUSH CX
PUSH DX
    
OR AX,AX          ;AX < 0?
    
    JGE @END_IF1      ;NO, >0
    
    PUSH AX            ;SAVE NUMBER
    MOV DL,'-'         ;GET '-'
    MOV AH,2           ;PRINT CHAR FUNCTION 
    INT 21H            ;PRINT '-'
    POP AX             ; GET AX BACK
    NEG AX             ; AX= -AX
    
    @END_IF1:
    XOR CX,CX         ;CX COUNTS DIGITS
    MOV BX,10D        ;BX HAS DIVISOR
    
    @REPEAT1:
    
    XOR DX,DX         ;PREP HIGH WORD
    DIV BX            ;AX = QUOTIENT, DX=REMAINDER
    
    PUSH DX           ;SAVE REMAINDER ON STACK
    INC CX            ;COUNT = COUNT +1
    
    OR AX,AX          ;QUOTIENT = 0?
    JNE @REPEAT1      ;NO, KEEP GOING
    
    MOV AH,2          ;PRINT CHAR FUNCTION
    
    @PRINT_LOOP:
    
    POP DX            ;DIGIT IN DL
    OR DL,30H         ;CONVERT TO CHAR
    INT 21H           ;PRINT DIGIT
    LOOP @PRINT_LOOP  ;LOOP UNTILL DONE
    
    POP DX
    POP CX            ;RESTORE REGISTERS
    POP BX
    POP AX 
    
    JMP ASK1
    
    RET
    OUTDEC ENDP 
OUTPUT2:

OUTDEC2 PROC
    
    
    PUSH AX            ;SAVE REGISTERS
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV AX,DX
    
    OR AX,AX          ;AX < 0?
    
    JGE @END_IF12      ;NO, >0
    
    PUSH AX            ;SAVE NUMBER
    MOV DL,'-'         ;GET '-'
    MOV AH,2           ;PRINT CHAR FUNCTION 
    INT 21H            ;PRINT '-'
    POP AX             ; GET AX BACK
    NEG AX             ; AX= -AX
    
    @END_IF12:
    XOR CX,CX         ;CX COUNTS DIGITS
    MOV BX,10D        ;BX HAS DIVISOR
    
    @REPEAT12:
    
    XOR DX,DX         ;PREP HIGH WORD
    DIV BX            ;AX = QUOTIENT, DX=REMAINDER
    
    PUSH DX           ;SAVE REMAINDER ON STACK
    INC CX            ;COUNT = COUNT +1
    
    OR AX,AX          ;QUOTIENT = 0?
    JNE @REPEAT12      ;NO, KEEP GOING
    
    MOV AH,2          ;PRINT CHAR FUNCTION
    
    @PRINT_LOOP1:
    
    POP DX            ;DIGIT IN DL
    OR DL,30H         ;CONVERT TO CHAR
    INT 21H           ;PRINT DIGIT
    LOOP @PRINT_LOOP1  ;LOOP UNTILL DONE
    
    POP DX
    POP CX            ;RESTORE REGISTERS
    POP BX
    POP AX 
    
    JMP ASK1
    
    RET
    OUTDEC2 ENDP



END_:

    MOV AH,4CH
    INT 21H
