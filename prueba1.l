%{
	#include<stdio.h>
	#define SQLRESERVADA	1;
	#define ID		2;	
%}
select (S|s)(E|e)(L|l)(E|e)(C|c)(T|t)
from (F|f)(R|r)(O|o)(M|m)
where (W|w)(H|h)(E|e)(R|r)(E|r)
letra [a-zA-Z]
digito [0-1]
id	{letra}({letra}|{digito})*
%%
{select}	return SQLRESERVADA;
{from}		return SQLRESERVADA;
{where}		return SQLRESERVADA;
{id}		return ID;
\n	;
.	;
%%
int yywrap()
{
return 1;
}
int main(){
	int token;
	printf("Ingrese una sentencia: \n");
	token = yylex();
	while(token){
		printf("Tipo de Token: %d \tLexema: %s  \n", token, yytext);
		token = yylex();
	}

	
	return 0;
}
