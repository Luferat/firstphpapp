# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 15 - Processando o formulário

Vamos, essa atividade, processar os dados enviados pelo formulário de contatos. Basicamente, vamos validar e sanitizar os dados, enviar para o banco de dados e também enviar por e-mail para o proprietário/administrador do aplicativo.

Precisamos do e-mail do proprietário/administrador do aplicativo para que possamos enviar o contato recebido para ele. Edite "firstphpsite.sql" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_15/firstphpapp.sql), para adicionar na tabela `config` a chave `appOwnerEmail` e seu valor.

	-- Insere configurações do tema
	INSERT INTO config (var, val) VALUES 
		•••
		('appOwner', 'Seu Nome'),
		('appOwnerEmail', 'contato@firstphpsite.tk'),
		('backgroundColor', '#ffffff'),
		•••
	;

Abra o PHPMyAdmin (http://localhost/phpmyadmin) no navegador, à até a guia SQL, cole todo o conteúdo de "firstphpsite.sql" lá e clique em [Executar].

> *Já sabemos que este arquivo "firstphpsite.sql" é destrutivo, então, não tem problemas em colar ele inteiro...*

Edite então "contacts/index.php" para inserir os códigos de processamento do formulário, conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_15/contacts/index.php).

Primeiro, recebemos os dados dos campos e armazenamos em variáveis. Por questões de segurança, vamos sanitizar esses dados em uma função `post_clean()` que vamos criar em "config/config.php" daqui a pouco.

Caso esteja tudo ok, criamos um *feedback* para o usuário, salvamos os dados no banco de dados, enviamos e-mail para o proprietário do aplicativo e exibimos o *feedback* criado.

Ainda para garantir a segurança do aplicativo, usamos o método `->prepare()` da extensão `mysqli` para sanitizar a query que insere os dados.

Para enviar o e-mail, usamos a função `mail()`, nativa do PHP. Ela não funciona no XAMPP, por questões de segurança e anti-spam, então usamos um `@` na frente dela para que as mensagens de erro sejam ignoradas.

Se atualizar a página http://firstphpapp.localhost/contacts, receberemos alguns erros, então, vamos ajustar as outras páginas.

Abra e edite "config/config.php" para adicionar a função `post_clean()` que sanitiza os dados dos campos. Siga [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_15/config/config.php) para isso. A função é bem simples, usa filtros do PHP e dá espaço para outras implementações...

Agora sim, atualize http://firstphpapp.localhost/contacts e teste o formulário exaustivamente em busca de falhas e para fazer ajustes.

Está gostando? Achou algum *bug*? Tem sugestões? Então, contribua [clicando aqui](https://github.com/Luferat/firstphpapp/issues).

Até a próxima atividade...

← [Atividade 14](https://github.com/Luferat/firstphpapp/tree/Atividade_14) │ **Atividade 15** │ [Atividade 16](https://github.com/Luferat/firstphpapp/tree/Atividade_16) →