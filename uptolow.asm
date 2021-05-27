TITLE PGM_1: CASE CONVERSTION PROGRAM

.MODEL SMALL
.STACK 100H
.DATA

CR EQU 0DH
LF EQU 0AH

MSG1 DB 'ENTER A UPPER CASE LETTER $'
MSG2 DB 0DH,0AH, 'IN LOWER CASE ITS IS: '
CHAR DB ?,'$'

.CODE

MAIN PROC
    ;INITALIZE DS
    MOV AX, @DATA       ;get data segment
    MOV DS,AX           ;initailize DS
    
    ;print user prompt
    LEA DX,MSG1         ;get first message
    MOV AH,9            ;display sting function
    INT 21H            ;display first message 
   
    ;input a char and cover to upper case
    MOV AH,1            ;read character function
    INT 21H             ;read a small letter into AL
    ADD AL, 20H         ;convert it to lower case
    MOV CHAR, AL        ;and store it
    
    ;display on the next line
    LEA DX,MSG2         ;get second message
    MOV AH,9            ;display message and uppercase
    INT 21H             ;letter in front
    
    ;DOS EXIT
    MOV AH,4CH
    INT 21H             ;dos exit
    
MAIN ENDP
    END MAIN
