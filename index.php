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

// Define o(s) ano(s) na mensagem de copyright
// Se o ano atual é maior que o ano de criação do aplicativo, exibe os dois anos
// Senão, exibe o ano de criação do aplicativo
if (intval(date('Y')) > intval($C['appYear']))
    $app_year = $C['appYear'] . ' ' . date('Y');
else
    $app_year = $C['appYear'];

///// Título da página /////
// Se vazio, teremos <title>Nome do aplicativo .:. Slogan do aplicativo</title>
// Se definido, teremos <title>Nome do aplicativo .:. $title</title>
$title = 'Artigos';

//////////////////////////////////////////////////////////////
///// Os códigos PHP para gerar o conteúdo começam aqui. /////
//////////////////////////////////////////////////////////////

// Título da página no HTML (<h2>...</h2>)
$article = <<<HTML

<h2>Artigos</h2>
<div class="art-list">

HTML;

// Obtém lista de artigos do banco de dados (query)
$sql = <<<SQL

SELECT art_id, art_image, art_title, art_intro 
    FROM articles
    WHERE art_status = 'ativo'
        AND art_date <= NOW()
    ORDER BY art_date DESC;

SQL;

// Executa query e armazena resultados em $res (results)
$res = $conn->query($sql);

// $res->num_rows conta quantos registros (artigos) foram obtidos 
if ($res->num_rows == 0) :

    // Se não encontrou artigos, exibe feedback no HTML
    $article .= <<<HTML

<p class="center">Não encontramos artigos nesta seção!</p>

HTML;

else :

    // Se encontrou, itera cada registro obtido para a array $art[] e formata a saída HTML
    while ($art = $res->fetch_assoc()) :

        $article .= <<<HTML

    <div class="list artlink" data-link="/view/?{$art['art_id']}">
        <div class="list-img" style="background-image: url('{$art['art_image']}')" title="{$art['art_title']}"></div>
        <div class="list-content">
            <h3 class="list-title">{$art['art_title']}</h3>
            {$art['art_intro']}
        </div>
    </div>
    
HTML;

    endwhile;

    $article .= "</div>\n";

endif;

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