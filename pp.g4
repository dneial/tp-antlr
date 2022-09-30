grammar pp;

type : 
    'integer' | 
    'boolean' |
    'array of ' type;

declaration : 
    'var' ID ':' type;


uop :
    '-' |
    'not' 
    ;

bop : 
     '*' | '/' | '+' | '-' |
    'and' | 'or' |
    '<' | '>' | ':=' | '!=' | '<=' | '>=' 
    ;

appel : 
    'read' | 'write' | ID
    ; 

constant : 
    ENTIER |
    BOOL 
    ;

expression : 
    constant | ID
    | uop expression | expression bop expression 
    | expression '[' expression ']' 
    | 'new array of' type '[' expression ']' 
    ;

assignation : 
    ID ':=' expression 
    | expression '[' expression '] :=' expression;
    
instruction : 
    assignation 
    | 'if' expression 'then' instruction 'else' instruction
    | 'while' expression 'do' instruction
    | appel '(' expression* ')'
    | 'skip'
    | instruction ';' instruction; 


ENTIER : ('0'..'9')+ ;
BOOL : 'true' | 'false';
ID : [a-z]+ ; 
WS : [ \t\r\n]+ -> skip ; 