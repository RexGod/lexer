%option main
%option nodefault

LineTerminator \n
Token {Identifier}|{Keyword}|{Separator}|{Operator}
Identifier {IdentifierStartWith}{IdentifierRest}* 
IdentifierStartWith [A-Za-z]*
IdentifierRest {IdentifierStartWith}|[0-9]|_
WhiteSpace [\t ]|{LineTerminator} 
Keyword "abstract"|"else"|"import"|"super"|"as"|"enum"|"in"|"switch"|"case"|"if"|"sync"|"new"|"extention"|"async"|"throw"|"true"|"false"|"class"|"try"|"extends"|"final"|"catch"|"void"|"var"|"const"|"while"|"for"|"rethrow"|"continue"|"Function"|"null"|"return"|"get"|"set"|"do"|"static"|"implements"|"dynamic"|"await"|"with"
Separator [;.!?{},:()[\]]|::
Operator [=+*/<>!%$&-]|"<="|">="|"+="|"-="|"/="|"*="|"=="|"&&"|"||"|"|"
Digit [0-9]*
Anything [^\n]
Floatingpoint ({Digit}*\.{Digit}*)
Comment "//"{Anything}*|"/*"{Anything}"*/"
%%

{WhiteSpace} {  }
{Digit} {
	printf("integer numerical: %s\n" , yytext);
}
{Keyword} {
    printf("keyword: %s\n", yytext);
}
{Identifier} {
	printf("identifier: %s\n" , yytext);
}
{Separator} {
	printf("separator: %s\n" , yytext);
}
{Operator} {
        printf("operator: %s\n", yytext);
}
{Floatingpoint} {
	printf("floatingpoint: %s\n", yytext);
}
{Comment} { }
. {
	printf("undefine lexeme: %s\n\n", yytext);
}

%%

