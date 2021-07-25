<?php

/**
 * config.php
 * Arquivo de configuração global das páginas do aplicativo.
 */

// PHP com UTF-8
header('Content-Type: text/html; charset=utf-8');

// Define variáveis do tema
$article = $aside = '';

// Declara variáveis das páginas
$title = $css = $js = $meta_tags = $page_css = $page_js = '';

// Array com as configurações do tema
$C = array(
    'favicon' => '/img/logo01.png', // Ícone dos favoritos
    'appLogo' => '/img/logo02.png', // Logotipo
    'appTitle' => 'Meu Primeiro App', // Título do aplicativo
    'appSlogan' => 'Primeiros passos no PHP', // Slogan do aplicativo
    'appYear' => '2021', // Ano inicial do copyright
    'appOwner' => 'Seu Nome', // Proprietário do copyright
    'backgroundColor' => 'rgb(113, 34, 43)', // Cor de fundo do aplicativo
    'backgroundImage' => '/img/background02.jpg', // Imagem de fundo do aplicativo
    'meta' => array( // Meta tags do aplicativo
        'author' => 'Seu nome',
        'copyright' => 'Seu nome',
        'description' => 'Aplicativo modelo para desenvolvimento de aplicativos Web full-stack com PHP e MySQL.',
        'keywords' => 'HTML, CSS, JavaScript, PHP, MySQL, aplicativo, Web, fullstack, back-end, front-end, dinâmico, flexbox',
    ) 
);