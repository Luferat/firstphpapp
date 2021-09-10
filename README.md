# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Uma dica valiosa!

Mantenha a tecla "Control" [Ctrl] pressionada ao clicar em qualquer link desta documentação: [Ctrl] → "click"...

## Atividade 1 - Estrutura inicial

Como vimos na [introdução](https://github.com/Luferat/firstphpapp), vamos desenvolver um aplicativo full stack simples usando PHP como back-end. Acesse o diretório do projeto no seu computador, que criamos na [introdução](https://github.com/Luferat/firstphpapp), e crie a estrutura de diretórios necessária. No exemplo abaixo (e em todos os outros), estamos usando o XAMPP para Windows, instalado do diretório padrão (C:\xampp\). Altere para o diretório raiz do seu servidor Web, se necessário:

	[C:]
	  ├─> xampp                  → Instalação do XAMPP
	  │    ├─> htdocs            → Raiz do Apache no XAMPP
	  •    │    ├─> firstphpapp  → Raiz (/) do aplicativo usando "wildcards"
	  •    •    •    ├─> img     → Imagens do aplicativo
	            •    ├─> config  → Template, includes, configurações, funções...

Crie um novo arquivo, na raiz do aplicativo, chamado "template.php" e abra-o no editor de códigos. Ele terá a estrutura básica do html, conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_01/template.php). Com o arquivo criado, acesse-o pelo navegador, pelo endereço http://firstphpapp.localhost/template.php.

Observe que estamos usando alguns componentes externos para facilitar nosso trabalho:
 - [Font Awesome](https://fontawesome.com/) → Biblioteca de ícones;
 - [jQuery](https://jquery.com/) → Framework JavaScript para acesso ao DOM.

Também já "link(amos)" as folhas de estilos principais (/global.css) e o JavaScript principal (/global.js). Estude o código com calma para encontrar essas referências.

> *Não criaremos o arquivo "index" por enquanto, para facilitar a navegação entre os códigos do aplicativo pelo navegador. "template.php" será um "esqueleto" inicial para o aplicativo, é apenas um modelo para todas as outras páginas, inclusive a index.*

Crie também o arquivo "global.css", abra-o no editor e use [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_01/global.css) para começar.

> *Não custa nada lembrar de salvar o arquivo após cada edição ou então, ative o "Auto save" do editor, que é mais produtivo.*

Agora, crie "global.js", abra-o no editor e use [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_01/global.js) de ponto de partida.

No diretório "/img/", temos algumas imagens, obtidas do site [Freepik.com](https://www.freepik.com/), com licença "*Royalty Free*" que você pode obter à partir [daqui](https://github.com/Luferat/firstphpapp/tree/Atividade_01/img).

Já em "config/", criamos e editamos, por enquanto, os arquivos abaixo:

 - [config.ini](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_01/config/config.ini) → Arquivo de configuração da conexão com o MySQL;
 - [config.php](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_01/config/config.php) → Fará toda a pré-configuração das páginas do aplicativo. 

Talvez esses arquivos não façam sentido agora, mas eles tornarão nosso aplicativo Web muito mais dinâmico, mais fácil de criar e de replicar no futuro.

Agora que temos a estrutura básica do aplicativo, salve tudo, de preferência enviando também para um repositório novo do seu [GitHub.com](https://github.com/) e vamos para a próxima atividade.

Ah! Lembre-se de contribuir de alguma forma, [clicando aqui](https://github.com/Luferat/firstphpapp/issues). É de graça e não dói...

← [Introdução](https://github.com/Luferat/firstphpapp) │ **Atividade 1** │ [Atividade 2](https://github.com/Luferat/firstphpapp/tree/Atividade_02) →