# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 13 - Seção de contatos

O objetivo principal do site, os artigos, já está minimamente funcional, então, vamos partir para a seção de contatos. Vamos inverter a ordem de trabalho, ou seja, vamos desenvolver o conteúdo da barra lateral (`<aside>`) primeiro. Vamos listar nesta lateral uma lista de redes sociais como opções de contato, além do formulário que incluiremos em breve.

Como queremos automatizar ao máximo nosso aplicativo, vamos incluir as redes sociais no banco de dados, usando a tabela "config". Assim, a lista de redes sociais será gerada automaticamente na array `$C` que já conhecemos.

Abra "firstphpapp.sql" no editor e adicione as chaves corretas na tabela config. Use [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_13/firstphpapp.sql), onde, adicionamos os registros abaixo em "config".

> *Cuidado com a sintaxe do campo `var` da tabela "config" do banco de dados, porque essa formatação influencia diretamente na geração da array multidimensional `$C`.*

	INSERT INTO config (var, val) VALUES 
		•••
		('social_facebook', 'https://facebook.com/seunome'),
		('social_github', 'https://github.com/seunome'),
		('social_instagram', 'https://instagram.com/seunome'),
		('social_linkedin', 'https://linkedin.com/seunome')
	;

Acesse o PHPMyAdmin pelo endereço http://localhost/phpmyadmin, clique na guia SQL à direita, cole o código de "firstphpapp.sql" inteiro lá e clique no botão [Executar] para que as alterações sejam salvas no banco de dados. Sempre tendo atenção a possíveis mensagens de erro.

> *Lembre-se que projetamos "firstphpapp.sql" para apagar e recriar o banco de dados, cada vez que é executado no PHPMyAdmin, mas, só funciona, se colocarmos ele inteiro na guia SQL da ferramenta do XAMPP.*

Agora, abra e edite "config/config.php", conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_13/config/config.php), para ler essa novas chaves para dentro da array `$C`. Conforme os dados de "config" do banco de dados, `$C` terá as seguintes novas chaves:

	$C['social']['facebook']  => 'https://facebook.com/seunome'
	$C['social']['github']    => 'https://github.com/seunome'
	$C['social']['instagram'] => 'https://instagram.com/seunome'
	$C['social']['linkedin']  => 'https://linkedin.com/seunome'

Edite "contacts/index.php" para obter essa lista e mostrar na sidebar, usando [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_13/contacts/index.php), onde cabem algumas observações:

- Ordenamos a array `$C['social']` pela chave;
- Ao ser clicado, o link abre em outra guia do navegador (`target="_blank"`);
- O código já inclui o ícone da rede social usando "Font Awesome".

Para concluir, crie "contacts/index.css" e, seguindo [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_13/contacts/index.css), inclua as classes necessárias para estilizar a sidebar.

Salve e teste o funcionamento da página, fazendo ajustes, se necessário.

### Exercícios
- Experimente adicionar novas redes, remover e editar as existentes.

Sei que você tem um monte de dúvidas! Então, não deixe de colaborar, [clicando aqui](https://github.com/Luferat/firstphpapp/issues). Já disse que não dói? Verdade!

Na próxima atividade vamos começar a formatar o formulário de contatos.

← [Atividade 12](https://github.com/Luferat/firstphpapp/tree/Atividade_12) │ **Atividade 13** │ [Atividade 14](https://github.com/Luferat/firstphpapp/tree/Atividade_14) →