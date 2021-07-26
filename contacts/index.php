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
$title = 'Faça Contato';

//////////////////////////////////////////////////////////////
///// Os códigos PHP para gerar o conteúdo começam aqui. /////
//////////////////////////////////////////////////////////////

// Cabeçalho da sidebar
$aside = <<<HTML

<h3>+Contatos</h3>
<p>Você também pode entrar em contato conosco pelas redes sociais.</p>
<div class="social-list">

HTML;

// Ordena array pela chave
ksort($C['social']);

// Itera redes sociais em $C
foreach ($C['social'] as $key => $value) :

    // Formata nome da rede social
    $ucf_social = ucfirst($key);

    // Lista rede social
    $aside .= <<<HTML

<a href="{$value}" target="_blank">
    <i class="fab fa-{$key} fa-fw"></i> {$ucf_social}
</a>

HTML;

endforeach;

// Fecha bloco com lista de redes sociais
$aside .= '</div>';

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