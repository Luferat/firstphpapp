# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 11 - Artigo completo

Até aqui, conseguimos listar todos os artigos publicados ou filtrá-los pela categoria escolhida. Vale aqui uma ressalva: o banco de dados que usamos como [modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_11/firstphpapp.sql) já tem diversos artigos "fake" cadastrados e um artigo único pode estar presente em mais de uma categoria. Isso é possível porque quem inclui um artigo em uma ou mais categorias é a tabela de ligação "art_cat".

Nosso objetivo agora é exibir um artigo único, completo, ou seja, uma vez que o visitante do aplicativo Web clicar em um dos artigos da listagem de artigos, será levado para a página daquele artigo que pode ser lido na íntegra.

Começamos, criando um novo diretório "view" onde colocamos uma cópia de "template.php" e renomeamos para "index.php". Abra então "view/index.php" no editor e use [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_11/view/index.php) como referência.

Comece alterando "`$title = 'Página Modelo';`" para "`$title = 'Artigo';`".

Vá até a seção onde colocamos os códigos da view. Vamos inserir todo o código seguinte nesta seção:

    //////////////////////////////////////////////////////////////
    ///// Os códigos PHP para gerar o conteúdo começam aqui. /////
    //////////////////////////////////////////////////////////////
    •••
    ///////////////////////////////////////////////////////////////
    ///// Os códigos PHP para gerar o conteúdo terminam aqui. /////
    ///////////////////////////////////////////////////////////////

Primeiro, precisamos obter e filtrar o ID do artigo que está sendo acessado, com o código abaixo:

	$aid = (isset($_SERVER['QUERY_STRING'])) ? intval($_SERVER['QUERY_STRING']) : 0;
	if ($aid == 0) header('Location: /articles.php');

O SQL abaixo obtém todo o conteúdo do artigo e ainda os dados do autor deste:

	SELECT *, DATE_FORMAT(art_date, '%d de %M de %Y, %H:%i') AS art_datebr FROM `articles` 
	INNER JOIN authors ON aut_id = `art_author`
	WHERE `art_id` = '{$aid}' 
		AND `art_date` <= NOW() 
		AND `art_status` = 'ativo'

Observe que já recebemos a data de publicação devidamente formatada pela função [DATE_FORMAT()](https://www.w3schools.com/mysql/func_mysql_date_format.asp) do MySQL.

Colocamos algumas armadilhas para evitar que o usuário acesse esta seção com um artigo inexistente. Sempre que ele tentar isso, será redirecionado para a lista de artigos.

Formatamos a visão do artigo completo com o trecho de PHP/HTML abaixo:

	<h2>{$art['art_title']}</h2>
	<div class="author-date">Por {$art['aut_name']} em {$art['art_datebr']}.</div>
	{$art['art_text']}

Finalmente, obtemos a lista de categorias deste artigo com o SQL abaixo:

	SELECT cat_id, cat_name FROM art_cat
	INNER JOIN categories ON cat_id = category
	WHERE article = '{$aid}'
	ORDER BY cat_name

E montamos a view na variável $article, que será exibida dentro da tag `<article>...</article>`.

Precisamos melhorar a visibilidade, então vamos criar um arquivo CSS para esta página. Crie e edite "view/index.css" para que seja detectado e incluído automaticamente no código de "view/index.php", usando o [modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_11/view/index.css).

Na próxima, vamos popular a sidebar com os dados do autor do artigo.

Críticas, sugestões e informes de bugs são bem vindos. [Clique aqui](https://github.com/Luferat/firstphpapp/issues) para colaborar!

← [Atividade 10](https://github.com/Luferat/firstphpapp/tree/Atividade_10) │ **Atividade 11** │ [Atividade 12](https://github.com/Luferat/firstphpapp/tree/Atividade_12) →