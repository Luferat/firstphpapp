<?php

/** header.php
 * Abertura do tema das páginas do aplicativo.
 */

// Processa tags <meta> e armazena em $meta_tags.
foreach ($C['meta'] as $name => $content)
    $meta_tags .= '<meta name="' . $name . '" content="' . $content . '">' . "\n";

// Processa conteúdo da tag <title></title>
// Se não definiu um title, usa o default
if ($title !== '')
    $app_title = "{$C['appTitle']} .:. {$title}";
else
    $app_title = "{$C['appTitle']} .:. {$C['appSlogan']}";

// Pesquisa e processa CSS adicional da página 'index.css'
// Se exite um arquivo "index.css" no mesmo local da página
if (file_exists('./index.css'))
    $page_css = '<link rel="stylesheet" href="index.css">' . "\n";

// Processa JavaScript adicional da página
// Se exite um arquivo "index.js" no mesmo local da página
if (file_exists('index.js'))
    $page_js = '<script src="index.js"></script>' . "\n";

// Define o(s) ano(s) na mensagem de copyright
// Se o ano atual é maior que o ano de criação do aplicativo, exibe os dois anos
// Senão, exibe o ano de criação do aplicativo
if (intval(date('Y')) > intval($C['appYear']))
    $app_year = $C['appYear'] . ' ' . date('Y');
else
    $app_year = $C['appYear'];

?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="/global.css">
    <?= $page_css ?>
    <style>
        /* Define o background da página */
        body {
            background-color: <?= $C['backgroundColor'] ?>;
            background-image: url('<?= $C['backgroundImage'] ?>');
        }
    </style>
    <link rel="icon" href="<?= $C['favicon'] ?>">
    <title><?= $app_title ?></title>
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