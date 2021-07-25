
# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 10 - Artigos categorizados

Primeiro, vamos listar as categorias na barra lateral `<aside>`. Edite "index.php", seguindo [o modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_10/index.php). Aqui, simplesmente vamos criar o conteúdo para a variável `$aside`:
 
    $aside = '<h3>Artigos por Categoria</h3>' . aside_Categories();

Observe que chamamos uma função `aside_Categories()` que vai fazer o trabalho pesado. Preferimos criar uma função porque podemos usar essa mesma lista de categorias em outras páginas/seções do aplicativo.

Edite "config/config.php" para inserir esta função, conforme [o modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_10/config/config.php) e teste o aplicativo.

Para que fique apresentável, vamos editar "global.css" conforme [o modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_10/global.css).

A lista de categorias aparece, mas está sem função. O correto é, ao clicar em uma categoria, somente os artigos nesta categoria são exibidos.

Vamos melhorar os códigos de "[index.php](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_10/index.php)" e fazer vários ajustes, entre eles:

- Obtemos o `id` da categoria diretamente da URL:

      $catid = (isset($_GET['c'])) ? intval($_GET['c']) : 0;

- Obtemos dados da categoria:

      $res = $conn->query("SELECT * FROM categories WHERE cat_id = '{$catid}';");
- Se temos uma categoria válida, criamos suas variáveis que vão complementar o SQL dos artigos. Se não temos categoria, essas variáveis estão vazias:

      $inner_join = "INNER JOIN art_cat ON article = art_id";
      $where_category = "AND category = '{$catid}'";
- Formatamos o título, dependendo se temos ou não uma categoria;
- Finalmente, reescrevemos o SQL para obter os artigos, adicionando as variáveis:

      SELECT art_id, art_image, art_title, art_intro 
      FROM `articles`
      {$inner_join}
      WHERE `art_date` <= NOW() 
            AND `art_status` = 'ativo' 
		    {$where_category}
      ORDER BY art_date DESC

Teste e faça correções, se necessário.

Nas próximas atividades, vamos exibir um artigo completo. Críticas, sugestões e informes de bugs são bem vindos. [Clique aqui](https://github.com/Luferat/firstphpapp/issues) para colaborar!

Boas codificações...

← [Atividade 9](https://github.com/Luferat/firstphpapp/tree/Atividade_09) │ **Atividade 10** │ [Atividade 11](https://github.com/Luferat/firstphpapp/tree/Atividade_11) →