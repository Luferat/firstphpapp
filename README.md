
# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 9 - Seção de artigos

Conforme vimos na [introdução](https://github.com/Luferat/firstphpapp) deste projeto, nosso objetivo é criar um aplicativo full-stack minimalista usando PHP e MySQL no back-end. Trata-se de um projeto simples, mas com muito espaço para evoluir, até mesmo, tornando-se um grande portal de conteúdo.

De qualquer forma, a principal seção do aplicativo será seu conteúdo, ou seja, a publicação de artigos, e é justamente essa parte que vamos começar a construir nesta atividade.

Já temos, no banco de dados, a tabela com os artigos (article) e alguns artigos "fake" publicados. Vamos então obter esses artigos e listá-los na seção de artigos do aplicativo, com algumas observações:

- Somente os artigos com o campo `status = ativo` serão visíveis, assim, se você quiser ocultar um artigo por algum motivo, remoção, por exemplo, basta alterar o valor do campo `status` da tabela `article` para, por exemplo, `inativo`, para este registro e ele não será listado;


- Os artigos serão ordenados pela data, com os mais recentes aparecendo primeiro; 

- Os artigos com a data no futuro não serão listados, assim, se você quiser agendar um artigo para o futuro, basta colocar a data correta em que ele será publicado, e ele só será listado à partir daí. *Sim, podemos fazer agendamento de artigos...*

## Mão na massa

Começamos editando a variável `$title` em "index.php":

    $title = 'Artigos'; // <title> da página.

Ainda em "index.php", lembre-se que, todo o código PHP que escrevemos fica dentro da seção abaixo:

    ///// Os códigos PHP para gerar o conteúdo começam aqui. /////
    •••
    ///// Os códigos PHP para gerar o conteúdo terminam aqui. /////

Assim, evite alterar alguma coisa fora deste bloco.

Altere então "index.php" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_09/index.php). O código está bem comentado, mas seguem alguns detalhes:

- Começamos pela consulta ao banco de dados, com a query abaixo. Estude-a com atenção e observe que atendemos a todos os requisitos da listagem de artigos que vimos lá em cima:

	  SELECT art_id, art_image, art_title, art_intro 
	      FROM articles
	      WHERE art_status = 'ativo'
              AND art_date <= NOW()
	      ORDER BY art_date DESC;

- O resultado da consulta é armazenado em `$res` pela linha `$res = $conn->query($sql)`;

- Com `while($art = $res->fetch_assoc())`, iteramos os registros obtidos para  assim, gerar a listagem.

Precisamos de um CSS para esta listagem, edite então "global.css" e adicione o conteúdo, conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_09/global.css).

> *Como o CSS usado para listar os artigos será necessário em outras seções do aplicativo, preferimos incluí-lo em "glocal.css" em vez de criar um CSS somente para "articles".*

Fizemos também, um pequeno ajuste neste mesmo arquivo "global.css" para corrigir um *bug* na listagem, onde, basicamente comentamos o trecho `height: 100%;` na estilização de `main`:

	main {
	  display: flex;
	  flex-direction: column;
	  /* height: 100%; */
	}

Agora, precisamos que cada um dos itens listados seja "clicável" para lermos o artigo completo. Para simplificar o código HTML, usaremos JavaScript para isso. Edite "global.js" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_09/global.js).

Criamos uma função simples que redireciona a URL para o endereço descrito no atributo `data-link` de qualquer elemento do HTML. Como essa função será útil em outras páginas, estamos incluindo ela em "global.js" em vez de criar um arquivo JavaScript só para "articles".

Teste e verifique que, ao clicar em um artigo, somos redirecionados para "view". Essa página/seção ainda não existe, então ocorre um *erro 404*, mas, nas próximas atividades, corrigiremos isso. 

Na próxima atividade, vamos listar as categorias na sidebar e filtrar os artigos listados por essas categorias. 

Se tiver alguma sugestão, crítica e principalmente, se achou algum bug, não deixe de colaborar [clicando aqui](https://github.com/Luferat/firstphpapp/issues).

Até...

← [Atividade 8](https://github.com/Luferat/firstphpapp/tree/Atividade_08) │ **Atividade 9** │ [Atividade 10](https://github.com/Luferat/firstphpapp/tree/Atividade_10) →
# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 9 - Seção de artigos

Conforme vimos na [introdução](https://github.com/Luferat/firstphpapp) deste projeto, nosso objetivo é criar um aplicativo full-stack minimalista usando PHP e MySQL no back-end. Trata-se de um projeto simples, mas com muito espaço para evoluir, até mesmo, tornando-se um grande portal de conteúdo.

De qualquer forma, a principal seção do aplicativo será seu conteúdo, ou seja, a publicação de artigos, e é justamente essa parte que vamos começar a construir nesta atividade.

Já temos, no banco de dados, a tabela com os artigos (article) e alguns artigos "fake" publicados. Vamos então obter esses artigos e listá-los na seção de artigos do aplicativo, com algumas observações:

- Somente os artigos com o campo `status = ativo` serão visíveis, assim, se você quiser ocultar um artigo por algum motivo, remoção, por exemplo, basta alterar o valor do campo `status` da tabela `article` para, por exemplo, `inativo`, para este registro e ele não será listado;


- Os artigos serão ordenados pela data, com os mais recentes aparecendo primeiro; 

- Os artigos com a data no futuro não serão listados, assim, se você quiser agendar um artigo para o futuro, basta colocar a data correta em que ele será publicado, e ele só será listado à partir daí. *Sim, podemos fazer agendamento de artigos...*

## Mão na massa

Começamos editando a variável `$title` em "index.php":

    $title = 'Artigos'; // <title> da página.

Ainda em "index.php", lembre-se que, todo o código PHP que escrevemos fica dentro da seção abaixo:

    ///// Os códigos PHP para gerar o conteúdo começam aqui. /////
    •••
    ///// Os códigos PHP para gerar o conteúdo terminam aqui. /////

Assim, evite alterar alguma coisa fora deste bloco.

Altere então "index.php" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_09/index.php). O código está bem comentado, mas seguem alguns detalhes:

- Começamos pela consulta ao banco de dados, com a query abaixo. Estude-a com atenção e observe que atendemos a todos os requisitos da listagem de artigos que vimos lá em cima:

	  SELECT art_id, art_image, art_title, art_intro 
	      FROM articles
	      WHERE art_status = 'ativo'
              AND art_date <= NOW()
	      ORDER BY art_date DESC;

- O resultado da consulta é armazenado em `$res` pela linha `$res = $conn->query($sql)`;

- Com `while($art = $res->fetch_assoc())`, iteramos os registros obtidos para  assim, gerar a listagem.

Precisamos de um CSS para esta listagem, edite então "global.css" e adicione o conteúdo, conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_09/global.css).

> *Como o CSS usado para listar os artigos será necessário em outras seções do aplicativo, preferimos incluí-lo em "glocal.css" em vez de criar um CSS somente para "articles".*

Fizemos também, um pequeno ajuste neste mesmo arquivo "global.css" para corrigir um *bug* na listagem, onde, basicamente comentamos o trecho `height: 100%;` na estilização de `main`:

	main {
	  display: flex;
	  flex-direction: column;
	  /* height: 100%; */
	}

Agora, precisamos que cada um dos itens listados seja "clicável" para lermos o artigo completo. Para simplificar o código HTML, usaremos JavaScript para isso. Edite "global.js" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_09/global.js).

Criamos uma função simples que redireciona a URL para o endereço descrito no atributo `data-link` de qualquer elemento do HTML. Como essa função será útil em outras páginas, estamos incluindo ela em "global.js" em vez de criar um arquivo JavaScript só para "articles".

Teste e verifique que, ao clicar em um artigo, somos redirecionados para "view". Essa página/seção ainda não existe, então ocorre um *erro 404*, mas, nas próximas atividades, corrigiremos isso. 

Na próxima atividade, vamos listar as categorias na sidebar e filtrar os artigos listados por essas categorias. 

Se tiver alguma sugestão, crítica e principalmente, se achou algum bug, não deixe de colaborar [clicando aqui](https://github.com/Luferat/firstphpapp/issues).

Até...

← [Atividade 8](https://github.com/Luferat/firstphpapp/tree/Atividade_08) │ **Atividade 9** │ [Atividade 10](https://github.com/Luferat/firstphpapp/tree/Atividade_10) →