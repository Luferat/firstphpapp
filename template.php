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
require_once(__DIR__ . '/config/config.php');

// Define o(s) ano(s) na mensagem de copyright
if (intval(date('Y')) > intval($C['appYear']))

    // Se o ano atual é maior que o ano de criação do aplicativo, exibe os dois anos
    $appYear = $C['siteYear'] . ' ' . date('Y');
else

    // Senão, exibe o ano de criação do aplicativo
    $appYear = $C['appYear'];

///// Os códigos PHP para gerar o conteúdo começam aqui. /////

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

///// Os códigos PHP para gerar o conteúdo terminam aqui. /////

?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="/global.css">
    <style>
        /* Define o background da página */
        body {
            background-color: <?= $C['backgroundColor'] ?>;
            background-image: url('<?= $C['backgroundImage'] ?>');
        }
    </style>
    <link rel="icon" href="<?= $C['favicon'] ?>">
    <title><?= $C['siteTitle'] ?></title>
</head>

<body>

    <a id="top"></a>

    <div class="wrap">

        <header>
            <a href="/"><img src="<?= $C['appLogo'] ?>" alt="<?= $C['appTitle'] ?>"></a>
            <h1><?= $C['appTitle'] ?><small><?= $C['appSlogan'] ?></small></h1>
        </header>

        <nav>
            <a href="/"><i class="fas fa-pen-nib fa-fw"></i><span>Artigos</span></a>
            <a href="/contacts"><i class="fas fa-comments fa-fw"></i><span>Contatos</span></a>
            <a href="/about"><i class="fas fa-info-circle fa-fw"></i><span>Sobre</span></a>
        </nav>

        <main>
            <article><?= $article ?></article>
            <aside><?= $aside ?></aside>
        </main>

        <footer>
            <a href="/" title="Página inicial"><i class="fas fa-home fa-fw"></i></a>
            <div>&copy; Copyright <?= $appYear ?> <?= $C['appOwner'] ?>.</div>
            <a href="#top" title="Topo da página"><i class="fas fa-arrow-alt-circle-up fa-fw"></i></a>
        </footer>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/global.js"></script>

</body>

</html>