# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 12 - Autor do artigo

Já podemos ver o artigo completo na seção "view". Vamos concluir essa página ocupando a barra lateral `<aside>` com os dados do autor do artigo. 

Na tabela "author" do banco de dados já temos algumas informações sobre o autor que vamos exibir como a imagem, o nome e o link dele.

Abra "view/index.php" no editor e, formate o HTML/CSS, conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_12/view/index.php) onde, formatamos os dados do autor na variável `$aside`, obtidos do SQL do artigo, usando PHP/HTML.

Na sequência, com o SQL abaixo, obtemos uma lista com até 4 artigos aleatórios, deste mesmo autor. Usamos RAND() e LIMIT para isso:

	SELECT `art_id`, `art_image`, `art_title` FROM `articles` 
	WHERE art_author = '{$art['art_author']}'
		AND art_date <= NOW()
		AND art_status = 'ativo'
	ORDER BY RAND()
	LIMIT 4

Se encontramos artigos, exibimos logo abaixo dos dados do autor, na barra lateral.

Para completar a atividade, incluímos as classes necessárias em "view/indes.css", conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_12/view/index.css).

Teste exaustivamente os artigos para conferir se está tudo ok.

Dúvidas, sugestões, contribuições e reporte de bugs devem ser postados [aqui](https://github.com/Luferat/firstphpapp/issues).

Na próxima atividade, vamos começar a criar a seção de contatos.

← [Atividade 11](https://github.com/Luferat/firstphpapp/tree/Atividade_11) │ **Atividade 12** │ [Atividade 13](https://github.com/Luferat/firstphpapp/tree/Atividade_13) →