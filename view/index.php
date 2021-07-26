<?php

/**
 * template.php
 * Página modelo para criação do tema do aplicativo.
 * Esta página servirá de modelo para todas as outras quando o tema estiver pronto.
 */

// Define constante com o diretório raiz (/) do aplicativo
// Também podemos usar a constante mágica __DIR__, se disponível no servidor
define('PATH', $_SERVER['DOCUMENT_ROOT']);

// Importa arquivo de configuração da página
require_once(PATH . '/config/config.php');

///// Título da página /////
// Se vazio, teremos <title>Nome do aplicativo .:. Slogan do aplicativo</title>
// Se definido, teremos <title>Nome do aplicativo .:. $title</title>
$title = 'Página Modelo';

//////////////////////////////////////////////////////////////
///// Os códigos PHP para gerar o conteúdo começam aqui. /////
//////////////////////////////////////////////////////////////

// Obtém e filtra o Id do artigo solicitado
$aid = (isset($_SERVER['QUERY_STRING'])) ? intval($_SERVER['QUERY_STRING']) : 0;

// Se não informou um Id, volta para a lista de artigos
if ($aid == 0) header('Location: /');

// Obtém o artigo completo (tabela "articles") e também os dados do autor (tabela "authors")
$sql = <<<SQL

SELECT *, DATE_FORMAT(art_date, '%d de %M de %Y, %H:%i') AS art_datebr FROM `articles` 
INNER JOIN authors ON aut_id = `art_author`
WHERE `art_id` = '{$aid}' 
	AND `art_date` <= NOW() 
    AND `art_status` = 'ativo'

SQL;

// Armazena resultados em $res
$res = $conn->query($sql);

// Se não obteve um artigo, por exemplo, ele não existe, volta para a lista de artigos
if ($res->num_rows !== 1) header('Location: /');

// Armazena no artigo em $art[]
$art = $res->fetch_assoc();

// Formata o título da página com o título do artigo
$title = $art['art_title'];

// Monta a view de <article>...</article>
$article = <<<HTML

<h2>{$art['art_title']}</h2>

<div class="author-date">Por {$art['aut_name']} em {$art['art_datebr']}.</div>

{$art['art_text']}

HTML;

// Obtém a lista de categorias das quais este artigo participa (tabelas art_cat e categories)
$sql = <<<SQL

SELECT cat_id, cat_name FROM art_cat
INNER JOIN categories ON cat_id = category
WHERE article = '{$aid}'
ORDER BY cat_name

SQL;

// Armazena resultados em $res
$res = $conn->query($sql);

// Inicializa a lista de categorias deste artigo
$article .= '<div class="categories"><strong>Categorias: </strong>';

// Itera cada categoria, formatando a view em $article
while ($cat = $res->fetch_assoc())
    $article .= '<a href="/articles.php?c=' . $cat['cat_id'] . '">' . $cat['cat_name'] . '</a>, ';

// Fecha o bloco com a lista de categorias    
$article = substr($article, 0, -2) . '.</div>';

///////////////////////////////////////////////////////////////
///// Os códigos PHP para gerar o conteúdo terminam aqui. /////
///////////////////////////////////////////////////////////////

// Importa abertura do tema
require_once(PATH .  '/config/header.php');

?>

<article><?= $article ?></article>
<aside><?= $aside ?></aside>

<?php

// Importa fechamento do tema
require_once(PATH . '/config/footer.php');

?>