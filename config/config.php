<?php

/**
 * config.php
 * Arquivo de configuração global das páginas do aplicativo.
 */

// PHP com UTF-8
header('Content-Type: text/html; charset=utf-8');

// Define fusohorário do aplicativo
date_default_timezone_set('America/Sao_Paulo');

// Declara variáveis do tema
$article = $aside = '';

// Declara variáveis das páginas
$title = $css = $js = $meta_tags = $page_css = $page_js = '';

// Faz conexão com MySQL/MariaDB
// Os dados da conexão estão em "config/config.ini"
$i = parse_ini_file($_SERVER['DOCUMENT_ROOT'] . '/config/config.ini', true);
foreach ($i as $k => $v) :
    if ($_SERVER['SERVER_NAME'] == $k) :

        // Conexão com MySQL/MariaDB usando "mysqli" (orientada a objetos)
        @$conn = new mysqli($v['server'], $v['user'], $v['password'], $v['database']);

        // Trata possíveis exceções
        if ($conn->connect_error) die("Falha de conexão com o banco e dados: " . $conn->connect_error);
    endif;
endforeach;

// Seta transações com MySQL/MariaDB para UTF-8
$conn->query("SET NAMES 'utf8'");
$conn->query('SET character_set_connection=utf8');
$conn->query('SET character_set_client=utf8');
$conn->query('SET character_set_results=utf8');

// Seta dias da semana e meses do MySQL/MariaDB para "português do Brasil"
$conn->query('SET GLOBAL lc_time_names = pt_BR');
$conn->query('SET lc_time_names = pt_BR');

// Lê configurações do tema da tabela "config" do banco de dados
$res = $conn->query("SELECT * FROM config");

// Gera array de configuração do tema ($C)
while ($data = $res->fetch_assoc()) :

    if (substr($data['var'], 0, 7) == 'social_') :

        // Obtém lista de links das redes sociais
        $var = str_ireplace('social_', '', $data['var']);
        $C['social'][$var] = $data['val'];
    elseif (substr($data['var'], 0, 5) == 'meta_') :

        // Obtém lista de meta tags (Atributo "name")
        $var = str_ireplace('meta_', '', $data['var']);
        $C['meta'][$var] = $data['val'];
    else :

        // Todas as outras variáveis
        $C[$data['var']] = $data['val'];
    endif;

endwhile;

// Lista as categorias de artigos
// Se $count for true (default), exibe a quantidade de artigos na categoria
function aside_Categories($count = true)
{

    // Importa conexão com banco de dados
    global $conn;

    // Obtém todas as categorias ordenando pelo nome e armazena resultados em $res
    $res = $conn->query("SELECT * FROM `categories` ORDER BY cat_name");

    // Inicializa a view e o total de artigos por categoria
    $categories = '<div class="cat-list">';
    $total = '';

    // Itera as categorias e armazena cada uma em $cat
    while ($cat = $res->fetch_assoc()) :

        // Se setou exibição do contador
        if ($count) :

            // Conta quantos artigos temos na categoria, usando a tabela art_cat de ligação
            $sql2 = "SELECT COUNT(art_cat_id) FROM art_cat WHERE category = '{$cat['cat_id']}'";
            $res2 = $conn->query($sql2);

            // Formata a view do contador
            $total = '<sup>' . $res2->fetch_array()[0] . '</sup>';
        endif;

        // Formata a view da listagem com link para a categoria
        $categories .= <<<HTML

<div>
    <a href="/?c={$cat['cat_id']}">{$cat['cat_name']}</a> {$total}
</div>

HTML;

    endwhile;

    // Reinicia view do contador
    $total = '';

    // Se setou exibição do contador    
    if ($count) :

        // Conta quantos artigos temos cadastrados e ativos
        $sql = "SELECT COUNT(art_id) FROM articles WHERE art_status = 'ativo'";
        $res = $conn->query($sql);

        // Formata view do contador
        $total = '<sup>' . $res->fetch_array()[0] . '</sup>';

    endif;

    // Formata link para listar todos os artigos
    $categories .= '<div class="dotted-up"><a href="/">Todos os artigos</a> ' . $total . '</div>' . "\n";

    // Retorno da função
    return $categories;
}

// Sanitiza campos de formulários usando method="POST"
// Outros filtros podem ser implementados nesta função
function post_clean($post_field, $type = 'string')
{

    // Escolhe o tipo de filtro
    switch ($type):
        case 'string':

            // Sanitiza strings
            $post_value = filter_input(INPUT_POST, $post_field, FILTER_SANITIZE_STRING);
            break;
        case 'email':

            // Satiziza endereços de e-mail
            $post_value = filter_input(INPUT_POST, $post_field, FILTER_SANITIZE_EMAIL);
            break;
    endswitch;

    // Remove excesso de espaços
    $post_value = trim($post_value);

    // Remove aspas perigosas
    $post_value = stripslashes($post_value);

    // Retorna valor do campo sanitizado
    return $post_value;
}
