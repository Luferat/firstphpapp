
# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 6 - O banco de dados

Nesta atividade, vamos modelar o banco de dados que vai suportar o aplicativo Web. Como sabemos, usaremos MySQL e conceitos bem básicos de tabelas, nada muito sofisticado. A modelagem pode ser vista [aqui](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_06/img/firstphpapp_database.png).

![Modelagem do banco de dados](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_06/img/firstphpapp_database.png)


Temos 6 tabelas, até o momento:

- `config`  → Armazena as configurações do tema, que serão salvas no *array* `$C`;
- `contacts` → Armazena os contatos do formulário de contatos do aplicativo, que criaremos futuramente;
- `authors` → Armazena alguns dados sobre os autores do conteúdo (artigos) do aplicativo;
- `categories` → Armazena as categorias de conteúdo do aplicativo;
- `articles` → Onde fica o conteúdo do aplicativo, os artigos;
- `art_cat` → Faz o relacionamento entre *artigos* e *categorias*.

[Neste arquivo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_06/firstphpapp.sql), fazemos a criação do banco de dados, das tabelas, dos relacionamentos e já inserimos alguns dados "fake" para facilitar os testes do aplicativo em desenvolvimento. 

>*Observe que, toda vez que o SQL acima é executado, o banco de dados é destruído e recriado. Isso é bom em **tempo de desenvolvimento**, mas é desastroso em **tempo de produção**, ou seja, quando o aplicativo já está publicado e acessível na Internet, portanto, este arquivo SQL **DEVE SER EXCLUÍDO** depois que o aplicativo for publicado em definitivo.*

Para configurar o banco de dados no XAMPP rapidamente, usando o modelo:

- Abra o arquivo "[firstphpapp.sql](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_06/firstphpapp.sql)" no editor de códigos;
- Selecione todo o seu conteúdo e copie: `[Ctrl]+[A]` → `[Ctrl]+[C]`;
- Acesse o aplicativo de gestão *PHPMyAdmin*, no navegador, pelo endereço http://localhost/phpmyadmin/;
- Na coluna direita, clique na guia [SQL](http://localhost/phpmyadmin/index.php?route=/server/sql);
- Cole `[Ctrl]+[V]` o conteúdo do arquivo na caixa de texto da guia SQL;
- Clique no botão `[Executar]` logo abaixo da caixa de texto para executar o código e gerar os dados.

Observe com atenção se ocorrem erros. Caso ocorra, refaça a atividade com calma e atenção.

> *Se preferir, use a guia "importar" do PHPMyAdmin para importar o arquivo "firstphpapp.sql". O processo é alguns segundos mais lento, mas retorna os mesmos resultados.*

Colabore com este projeto [clicando aqui](https://github.com/Luferat/firstphpapp/issues).

Com o banco de dados já disponível, nas próximas atividades, vamos integrá-lo ao aplicativo definitivamente.

← [Atividade 5](https://github.com/Luferat/firstphpapp/tree/Atividade_05) │ **Atividade 6** │ [Atividade 7](https://github.com/Luferat/firstphpapp/tree/Atividade_07) →