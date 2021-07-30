

# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 16 - Seção sobre...

Uma sugestão para a seção "Sobre" do aplicativo Web? Desenvolva-a sozinho(a), sem a ajuda desta atividade. Será um exercício e tanto e você pode desenvolvê-la do jeito que quiser. Sugiro que esta seção tenha pelo menos 4 páginas:

- **Sobre o site** → Onde os visitantes obtêm mais informações sobre o aplicativo, como seus objetivos e até informações mais técnicas como plataformas...

- **Quem faz** → Onde os visitantes obtêm mais informações sobre o proprietário, desenvolvedor, mantenedor, etc. 

- **Sobre a privacidade** → Atendendo aos requisitos da legislação vigente, apresentamos o contrato de privacidade do aplicativo aqui.

- **Sobre os Cookies** → Essa página complementa a anterior, explicando o que são os cookies que o usuário deve aceitar para navegar no aplicativo.

A sugestão é que você desenvolva algo dinâmico, usando o banco de dados do aplicativo, seja aproveitando a estrutura existente ou criando uma nova. Não existe fórmula, na verdade, temos várias formas de fazer essa seção...

### Nosso modelo

Claro que não vamos deixar ninguém na mão, então, vamos ver uma, apenas uma forma de fazer essa atividade de revisão. Neste exemplo, vamos usar a estrutura de artigos já existente, assim, não precisamos criar uma nova tabela no banco de dados.

Para começar, abra "firstphpapp.sql" no editor para alterar a estrutura da tabela "articles", inserindo o código abaixo logo no final do arquivo:

	-- Altera estrutura da tabela "articles" para receber a seção "Sobre"
	ALTER TABLE `articles` CHANGE
	`art_status` `art_status` ENUM('inativo', 'ativo', 'sobre') NOT NULL DEFAULT 'ativo';

O que fizemos foi adicionar o opção "sobre" na lista do campo "art_status" (ENUM) que já contém "ativo" e "inativo".

Ainda neste arquivo, vamos inserir o SQL necessário para criar os conteúdos da seção "Sobre" na tabela "articles". Só temos que ter o cuidado de adicionar o valor "sobre" no campo "art_status" na inserção. Use [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_16/firstphpapp.sql) para facilitar.

Rode este script no PHPMyAdmin para recriar o banco de dados com as novas especificações.

 Com o banco de dados atualizado, abra e edite "about/index.php" usando [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_16/about/index.php).  Essa página vai listar os "artigos" disponíveis na seção "Sobre" e também exibir cada um, individualmente, ou seja, ela é uma revisão de "index.php" e "view/index.php", com uma pitadinha de "config/config.php".

- Começamos alterando o valor de `$title` (`$title = 'Sobre';`);

-  Em seguida, tentamos obter o Id de um artigo e armazenar em `$aid`. Se conseguimos, vamos obter este artigo especifico no banco de dados, com a query:

		SELECT * FROM articles
		INNER JOIN authors ON aut_id = `art_author`
		WHERE art_id = '{$aid}'
		AND art_status = 'sobre' 

- Formatamos e exibimos o conteúdo completo no HTML;
- Mas, se o artigo solicitado não existe ou, simplesmente não solicitou um artigo, usando a query abaixo, obtemos todos os artigos cadastrados em "Sobre" (`art_status = 'sobre'`):

      SELECT art_id, art_image, art_title, art_intro
      FROM `articles`
      WHERE `art_status` = 'sobre'
      ORDER BY art_date DESC

Formatamos a listagem e enviamos para o HTML, na variável `$article`.

Na sequência, formatamos a `<aside>...</aside>` com uma lista de artigos em "Sobre" e, quando estamos exibindo um artigo único, mostramos os dados do autor também.

Precisamos melhorar a "view", editando o SQL. Para facilitar, vamos reutilizar o SQL da página "view" (view/index.css):

- Abra "view/index.css", copie todo o seu conteúdo e cole no final de "global.css";

- Apague "view/index.css" e pronto. O modelo finalizado de "global.css" [está aqui](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_16/global.css).

Teste exaustivamente todo o site em busca de ajustes e bugs menores, uma bela vistoria nos códigos fonte, incluindo os comentários, também é boa prática, porque, sempre deixamos passar alguma coisa.

E... Nossas atividades terminam por aqui, mas, não o desenvolvimento do aplicativo. Ainda temos muito a implementar, coisas legais para fazer, novas páginas e seções... Mas isso já foge do escopo deste projeto, então, agora, pegue esses códigos, revise com calma, personalize e publique seu próprio site, com seu próprio conteúdo.

E não deixe de nos passar o endereço, juntamente com suas contribuições. Basta [clicar aqui](https://github.com/Luferat/firstphpapp/issues) e abrir uma issue!

### Sugestões de upgrade
 - Fazer a paginação na listagem dos artigos.
 - Criar uma mensagem de aceite de cookies usando, justamente, cookies do PHP.
 - Criação de uma área ou mesmo de um aplicativo administrativo (dashboard) para inserção e edição do conteúdo, sem a necessidade de interagir diretamente com o banco de dados.
 - Mais automatização do tema, explorando mais as possibilidades da tabela "config" e da array `$C`.
 - Criar um sistema de comentários para os artigos, com autenticação de usuários e moderação.
 - Adicionar uma validação de humanidade (Recaptcha) no formulário de contatos.
 - Adicionar uma seção de buscas no conteúdo do aplicativo.
 - ...

Se você quer ver algumas dessa implementações, acesse meu blog http://www.catabits.com.br.

← [Atividade 15](https://github.com/Luferat/firstphpapp/tree/Atividade_15) │ **Atividade 16** 