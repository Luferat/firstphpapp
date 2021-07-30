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
$title = 'Artigos';

//////////////////////////////////////////////////////////////
///// Os códigos PHP para gerar o conteúdo começam aqui. /////
//////////////////////////////////////////////////////////////

// Obtém o id da categoria
$catid = (isset($_GET['c'])) ? intval($_GET['c']) : 0;

// Obtém categoria conforme o id
$res = $conn->query("SELECT * FROM categories WHERE cat_id = '{$catid}';");

if ($catid > 0 and $res->num_rows == 1) :

    // Se a categoria existe, obtém dados dela em $cat
    $cat = $res->fetch_assoc();

    // Prepara o trecho de SQL para obtér artigos nesta categoria
    $inner_join = "INNER JOIN art_cat ON article = art_id";
    $where_category = "AND category = '{$catid}'";
else :

    // Se categoria não existe ou está listando todos os artigos
    $catid = 0;
    $inner_join = "";
    $where_category = "";
endif;

// Formatando título da página no HTML (<h2>...</h2>)
if ($catid == 0) :
    $article = "<h2>Artigos Recentes</h2><small class=\"block text-right\">Artigos mais recentes aparecem primeiro.</small><div class=\"art-list\">";
    $title = 'Artigos Recentes';
else :
    $article = "<h2>Artigos Recentes em \"{$cat['cat_name']}\"</h2><small class=\"block text-right\">Artigos mais recentes aparecem primeiro.</small><div class=\"art-list\">";
    $title = "Artigos Recentes em \"{$cat['cat_name']}\"";
endif;

// Obtém lista de artigos do banco de dados (query)
$sql = <<<SQL

SELECT art_id, art_image, art_title, art_intro 
FROM `articles`
{$inner_join}
WHERE `art_date` <= NOW() 
	AND `art_status` = 'ativo' 
    {$where_category}
ORDER BY art_date DESC

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

// Listando categorias
$aside = '<h3>Categorias</h3>' . aside_Categories(true);

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