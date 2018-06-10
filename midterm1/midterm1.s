	AREA main, CODE, READONLY
	ENTRY
	EXPORT __main
__main
    LDR R0, =o_sen
    LDR R2, =n_sen
    MOV R3, #0      ;   whitespace flag
    LDRB R1, [R0]     
    STRB R1, [R2] 

loop    
        
    CMP R1, #'#'
    BEQ out
    LDRB R1, [R0, #1] ! 
    CMP R1, #' '
    BEQ ws
    BNE nws
    BAL loop
    
ws  
    CMP R3, #0
    STRBEQ R1, [R2, #1] !
    MOVEQ R3, #1
    BAL loop
nws
    STRB R1, [R2, #1] !
    MOV R3, #0
    BAL loop   
    
out
    BAL out
    
    
o_sen DCB "abc   edf    ghi   jklmn         xyz#  "
     ALIGN
    AREA data, DATA ,READWRITE

n_sen SPACE 4096

    END










