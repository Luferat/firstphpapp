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

// Conteúdo principal da página (EXEMPLO)
$article = <<<HTML

<h2>Título da Página</h2>
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa accusamus fugit voluptatum, quidem ab assumenda autem ex ut eum voluptates nostrum numquam veniam sapiente distinctio rerum libero maiores consequatur porro.</p>
<p><img class="flush" src="https://picsum.photos/400/300" alt="Imagem aleatória"></p>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Pariatur illo doloribus dolorum numquam laudantium, sed, illum similique nemo suscipit aliquid et expedita maiores culpa eum ab dolores consectetur, dicta nisi.</p>
<h4>Lista de links:</h4>
<ul>
    <li><a href="http://catabits.com.br" target="_blank">Site do Fessô</a></li>
    <li><a href="https://github.com/luferat" target="_blank">GitHub do Fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore minima obcaecati tempora assumenda sit, cumque facilis ipsam recusandae quam atque error eum. Obcaecati, voluptatem repellendus nemo culpa ipsum expedita eius.</p>

HTML;

$aside = <<<HTML

<h3>Sidebar</h3>
<ul>
    <li>Opção 1</li>
    <li>Opção 2</li>
    <li>Opção 3</li>
    <li>Opção 4</li>
    <li>Opção 5</li>
</ul>
<h3>Sidebar</h3>
<p>Inventore minima obcaecati tempora assumenda sit, cumque facilis ipsam recusandae.</p>

HTML;

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