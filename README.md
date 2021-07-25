
# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de sites "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 3 - Formato do conteúdo

Nesta terceira atividade do projeto do aplicativo Web, vamos formatar a parte central da página, justamente onde o conteúdo principal será exibido. Vamos usar um layout clássico com duas colunas, uma maior para o conteúdo e uma barra lateral para informações complementares, navegação auxiliar, etc.
|`<article>`|`<aside>`|
|--|--|
|O conteúdo principal da página será apresentado aqui.|Barra lateral.|

Antes, vamos voltar ao tema inicial, já que o alteramos no experimento da atividade anterior. Edite "template.php", alterando a linha abaixo, que está dentro de `<head>`:

    •••
    <link rel="stylesheet" href="/global2.css">
    •••

para:  

    •••
    <link rel="stylesheet" href="/global.css">
    •••

Abra a página no navegador, acessando http://firstphpapp.localhost/template.php.

Agora, edite "template.php" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_03/template.php). Sobre as adições no código:
 - Basicamente, definimos duas variáveis que armazenam os conteúdos das estruturas:
	 -  `$article` → para a tag `<article>` → conteúdo principal da página, e;
	 -  `$aside` → para a tag `<aside>` → coluna lateral com conteúdo complementar.
- Já incluímos algum HTML com "[conteúdo fake](https://www.lipsum.com/)" nas variáveis para simular um conteúdo e facilitar a formatação;
- Nas variáveis, usamos a sintaxe [heredoc do PHP](https://www.php.net/manual/pt_BR/language.types.string.php#language.types.string.syntax.heredoc) para inserir o conteúdo, de forma a não se preocupar com aspas e outros caracteres;
- Para a imagem, usamos uma imagem gerada aleatoriamente, a partir do site [Lorem Picsum](https://picsum.photos/), somente para ilustrar o conteúdo.

Precisamos declarar estas variáveis e faremos isso no arquivo de configuração do tema, "config/config.php", conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_03/config/config.php).

Observe que já temos a instrução que define o *Content-Type* para HTML usando UTF-8:

    •••
    header('Content-Type: text/html; charset=utf-8');
    •••

Todos os códigos de "config/config.php" devem vir após esta instrução, ou seja, ela SEMPRE será a primeira instrução PHP a ser executada em nosso aplicativo.

Teste mais uma vez a página http://firstphpapp.localhost/template.php, antes de seguir em frente.

Precisamos estilizar a apresentação da página, editando "global.css", conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_03/global.css). Sobre as adições no código:

- Para larguras inferiores a 768 pixels, `<article>` fica sobre `<aside>` (sempre *mobile-first*, lembra?). Acima disso, os blocos se apresentam lado-a-lado (usando media query);
- Demos um formato "melhor" para os títulos principais;
- Criamos algumas classes de uso geral. Outras serão adicionadas futuramente, conforme for necessário.

Pois é isso, mas, ainda estou aguardando suas contribuições. [Clique aqui](https://github.com/Luferat/firstphpapp/issues) para abrir uma *issue*...

Visual do aplicativo já definido, na próxima atividade, vamos tornar nossas páginas um pouco mais dinâmicas.
   
← [Atividade 2](https://github.com/Luferat/firstphpapp/tree/Atividade_02) │ **Atividade 3** │ [Atividade 4](https://github.com/Luferat/firstphpapp/tree/Atividade_04) →