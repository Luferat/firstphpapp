# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 5 - Montando o tema

Nesta atividade, vamos finalmente montar o tema, integrar as configurações dinâmicas a este e preparar para a criação das páginas e conteúdos do aplicativo.

O que vamos fazer agora, deve ser feito com bastante atenção. Vamos dividir "template.php" em 3 partes:

- `config/header.php` → Será a parte inicial de todas as páginas, contendo principalmente as tags `<head>`, `<header>` e `<nav>`. Todo o pré-processamento do tema também será feito neste arquivo que será incluído em todas as páginas;

- `config/footer.php` → Será a parte final, de fechamento do tema e conterá principalmente o `<footer>` e a carga do JavaScript.

- `template.php` → Será nossa página modelo. Todas as novas páginas do site são uma cópia deste arquivo, com as variáveis de configuração modificadas.

### Mão na massa

Antes de seguir, abra "template.php" no navegador, acessando o endereço http://firstphpapp.localhost/template.php e confirme que tudo funciona corretamente.

Siga os passos abaixo com atenção, porque, como disse antes, essa é uma etapa crítica:

- Abra "template.php" no editor e **localize** a diretiva `<!DOCTYPE html>` e a abertura da tag `<main>`;
  
- **Recorte** todo o código, desde `<!DOCTYPE html>`, inclusive, até `<main>`, incluindo essa tag;
 
- Crie e edite "config/header.php" no editor e **cole** o conteúdo recortado neste arquivo;
 
- Volte até "template.php" e **localize** o fechamento da tag `<main>`, ou seja, `</main>`;
 
- **Recorte** essa tag e todo o código até o final do arquivo;
 
- Crie e edite "config/footer.php" no editor e **cole** o conteúdo no final deste arquivo;
 
- No final do processo, "template.php" terá somente o trecho de HTML abaixo, logo após o código PHP que já existe:

      <?php
      •••
      ?>
      <article><?= $article ?></article>
      <aside><?= $aside ?></aside>

- Justamente no trecho acima, do arquivo "template.php", faça o *require* de "theme/theme_header.php". Deve ficar assim:

      <?php
      •••
      // Importa abertura do tema
      require_once(PATH .  '/theme/theme_header.php');
      ?>
      <article><?= $article ?></article>
      <aside><?= $aside ?></aside>

- Faça o mesmo com "config/footer.php", só que no final de "template.php". Até aqui, "template.php" deve ficar assim:

      <?php
      •••
      // Importa abertura do tema
      require_once(PATH . '/config/header.php');
      ?>
      <article><?= $article ?></article>
      <aside><?= $aside ?></aside>
      <?php
      // Importa fechamento do tema
      require_once(PATH . '/config/footer.php');
      ?>

Teste "template.php" acessando http://firstphpapp.localhost/template.php pelo navegador. Se deu certo, nada deve ter mudado na página.

### Mais dinamismo para as páginas

Vamos aproveitar que o tema está ficando pronto e inserir mais algumas configurações dinâmicas. Abra "template.php" no editor e use [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_05/template.php) para editá-lo. Sobre as alterações, inserimos a variável `$title`, que armazena o título da página, permitindo que cada página tenha sua própria tag `<title>` gerada dinamicamente.

Essa e algumas outras variáveis devem ser declaradas em "config/config.php", conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_05/config/config.php). Uma vez que criamos uma nova página, cópia de "template.php", ajustaremos o valor desta variável `$title` que será processada pelos arquivos do tema. 

Sobre `$css` e `$js`, são arquivos de CSS e JavaScript adicionais que, opcionalmente, podem ser usados. Se você incluir um arquivo "index.css" e/ou "index.js" no mesmo diretório da página atual, eles serão detectados e incluídos automaticamente pela página. Ou seja, o código ainda vai procurar por "index.css" e "index.js" na seção. Se achar, inclui cada um, se não, nada acontece.

Neste mesmo arquivo "config/config.php", vamos adicionar mais alguns valores na array de configuração `$C`, para definir algumas tags `<meta>` que, juntamente com `<title>` dinâmico, tornarão nosso aplicativo Web mais [SEO Friendly](https://www.google.com/search?q=SEO%20Friendly).

- `$C['meta']['author']` → Nome do autor do site;
- `$C['meta']['copyright']` → Proprietário do copyright;
- `$C['meta']['description']` → Descrição para os mecanismos de busca;
- `$C['meta']['keywords']` → Palavras chave para os mecanismos de busca.

Editamos "config/header.php" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_05/config/header.php), para processar as variáveis e gerar as tags HTML dinamicamente.

Editamos também "config/footer.php", conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_05/config/footer.php), para inserir a variável do JavaScript adicional.

### Exercícios

- Experimente definir um valor diferente para `$title` em "template.php" e veja os resultados no código fonte, na tag `<title>...</title>`.

- Adicione um arquivo "index.css" na raiz do aplicativo e verifique que, no [código fonte](view-source:http://firstphpapp.localhost/template.php) de "template.php", dentro do bloco `<head>...</head>`, surge uma nova tag `<link rel="stylesheet" href="index.css">`.

- Agora, adicione um novo arquivo "index.js" na raiz do aplicativo e verifique que, no [código fonte](view-source:http://firstphpapp.localhost/template.php) de "template.php", antes de `</body>`, surge uma nova tag `<script src="index.js"></script>`.

Muita coisa, não é? Então, está no hora de colaborar, [clicando aqui](https://github.com/Luferat/firstphpapp/issues). Não dói nadinha! Juro!

Na próxima atividade vamos modelar o banco de dados e tornar nosso aplicativo dependente dele.

← [Atividade 4](https://github.com/Luferat/firstphpapp/tree/Atividade_04) │ **Atividade 5** │ [Atividade 6](https://github.com/Luferat/firstphpapp/tree/Atividade_06) →