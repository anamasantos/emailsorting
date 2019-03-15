%{
//define de bibliotecas e variaveis utilizadas
#include <stdio.h>
#include <string.h>

//define as variaveis :
//eva - guarda email validos
//eu - guarda email validos com dominio unicamp.br
//efu - guarda email validos com dominio fee.unicamp.br
int eva=0;int eu=0;int efu=0;

%}

emailfee [a-zA-Z0-9]+[@]([a-zA-z]+)*[.]?fee[.]unicamp[.]br
emailUnicamp [a-zA-Z0-9]+[@]([a-zA-z]+)*[.]?unicamp[.]br
emailValido [a-zA-Z0-9]+[@][A-Za-z]+([.][a-zA-Z]+)*

%%

{emailfee} {eva++;eu++;efu++; }

{emailUnicamp} {eva++;eu++; }

{emailValido} {eva++; }

[[:space:]]+ ;
[[:^space:]]+ ;

%%

int main() {
  yylex();
  printf("%d %d %d\n",eva,eu,efu);//define a forma de impressão da saida;
  return 0;
}
