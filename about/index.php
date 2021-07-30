<?php

/**
 * sobre.php
 * Página principal da seção "Sobre" do aplicativo.
  */

// Define constante com o diretório raiz (/) do aplicativo
define('PATH', $_SERVER['DOCUMENT_ROOT']);

// Importa arquivo de configuração da página
require_once(PATH . '/config/config.php');

///// Título da página /////
$title = 'Sobre';

//////////////////////////////////////////////////////////////
///// Os códigos PHP para gerar o conteúdo começam aqui. /////
//////////////////////////////////////////////////////////////

// Obtém o Id do conteúdo
$aid = (isset($_SERVER['QUERY_STRING'])) ? intval($_SERVER['QUERY_STRING']) : 0;

// Se passou um Id
if ($aid != 0) :

    // Obtém o conteúdo indicado pelo Id
    $sql = <<<SQL

SELECT * FROM articles 
INNER JOIN authors ON aut_id = `art_author`
WHERE art_id = '{$aid}'
    AND art_status = 'sobre'

SQL;

    // Armazena resultados em $res
    $res = $conn->query($sql);

    // Se não obteve um conteúdo, por exemplo, ele não existe, volta para a lista de sobre
    if ($res->num_rows !== 1) header('Location: /about');

    // Armazena o conteúdo em $art[]
    $art = $res->fetch_assoc();

    // Altera o título da página para o título do artigo
    $title = $art['art_title'];

    // Monta a view de <article>...</article>
    $article = <<<HTML

<h2>{$art['art_title']}</h2>
<div class="author-date">Por {$art['aut_name']}.</div>
{$art['art_text']}

HTML;

    // Formata aside com dados do autor do conteúdo
    $aside = <<<HTML

<h3>Autor</h3>
<img class="author-image" src="{$art['aut_image']}" alt="{$art['aut_name']}">
<h4>{$art['aut_name']}</h4>
{$art['aut_description']}
<div class="author-link">
    <a href="{$art['aut_link']}" target="_blank">Link do autor</a>
</div>

HTML;

else :

    // Obtém a lista de artigos em "Sobre"
    $sql = <<<SQL

SELECT art_id, art_image, art_title, art_intro 
FROM `articles`
WHERE `art_status` = 'sobre'
ORDER BY art_date DESC

SQL;

    // Executa query e armazena resultados em $res (results)
    $res = $conn->query($sql);

    // Itera cada registro obtido para a array $art[] e formata a saída HTML
    while ($art = $res->fetch_assoc()) :

        $article .= <<<HTML

    <div class="list artlink" data-link="/about/?{$art['art_id']}">
        <div class="list-img" style="background-image: url('{$art['art_image']}')" title="{$art['art_title']}"></div>
        <div class="list-content">
            <h3 class="list-title">{$art['art_title']}</h3>
            {$art['art_intro']}
        </div>
    </div>
    
HTML;

    endwhile;

endif;

// Formata aside com lista de conteúdos
$aside .= '<h3>+Sobre</h3><div class="cat-list">';

// Obtém lista de conteúdos da seção
$sql = <<<SQL

SELECT art_id, art_title
FROM `articles`
WHERE `art_status` = 'sobre'
ORDER BY art_date DESC

SQL;

// Executa query e armazena resultados em $res (results)
$res = $conn->query($sql);

// Itera cada registro obtido para a array $art[] e formata a saída HTML
while ($art = $res->fetch_assoc()) :

    $aside .= <<<HTML

<div>
<a href="/about/?{$art['art_id']}">{$art['art_title']}</a>
</div>

HTML;

endwhile;

$aside .= '<div class="dotted-up center"><a href="/about">Sobre</a></div></div>';

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