<?php

/**
 * template.php
 * Página modelo para criação do tema do aplicativo.
 * Esta página servirá de modelo para todas as outras quando o tema estiver pronto.
 */

// Define constante com o diretório raiz (/) do aplicativo
// Também podemos usar a constante mágica __DIR__
define('PATH', $_SERVER['DOCUMENT_ROOT']);

// Importa arquivo de configuração da página
require_once(PATH . '/config/config.php');

?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="/global.css">
    <link rel="icon" href="/img/logo01.png">
    <title>First PHP App</title>
</head>

<body>

    <a id="top"></a>

    <div class="wrap">

        <header>
            <a href="/"><img src="/img/logo02.png" alt="Meu Primeiro App"></a>
            <h1>Meu Primeiro App<small>Primeiros passos no PHP</small></h1>
        </header>

        <nav>
            <a href="/"><i class="fas fa-pen-nib fa-fw"></i><span>Artigos</span></a>
            <a href="/contacts"><i class="fas fa-comments fa-fw"></i><span>Contatos</span></a>
            <a href="/about"><i class="fas fa-info-circle fa-fw"></i><span>Sobre</span></a>
        </nav>

        <main>
            <article></article>
            <aside></aside>
        </main>

        <footer>
            <a href="/" title="Página inicial"><i class="fas fa-home fa-fw"></i></a>
            <div>&copy; Copyright 2021 Seu Nome</div>
            <a href="#top" title="Topo da página"><i class="fas fa-arrow-alt-circle-up fa-fw"></i></a>
        </footer>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/global.js"></script>

</body>

</html>