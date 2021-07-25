<?php

/**
 * config.php
 * Arquivo de configuração global das páginas do aplicativo.
 */

// PHP com UTF-8
header('Content-Type: text/html; charset=utf-8');

// Define variáveis do tema
$article = $aside = '';

// Array com as configurações do tema
$C = array(
    'favicon' => '/img/logo01.png', // Ícone dos favoritos
    'appLogo' => '/img/logo02.png', // Logotipo
    'appTitle' => 'Meu Primeiro App', // Título do aplicativo
    'appSlogan' => 'Primeiros passos no PHP', // Slogan do aplicativo
    'appYear' => '2021', // Ano inicial do copyright
    'appOwner' => 'Seu Nome', // Proprietário do copyright
    'backgroundColor' => 'rgb(113, 34, 43)', // Cor de fundo do aplicativo
    'backgroundImage' => '/img/background02.jpg'
);