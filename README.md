
# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

Vamos, neste projeto, vamos criar um aplicativo Web (site de Internet) full stack, ou seja, front-end e back-end, usando as linguagens de computador citadas acima. Será um aplicativo pequeno, minimalista, mas totalmente funcional e com espaço para muitas implementações novas.

>  *Se você é **profissional da área** ou um **estudante avançado**, este projeto **não serve para você**, porque aborda os conceitos mais simples do desenvolvimento Web usando PHP, com foco na criação de um produto mais simples possível.*

Usaremos, na maior parte do tempo, o PHP procedural, com uma ou outra "pitada" de orientação à objetos.

>  *Estamos preparando outro projeto que será, em sua maior parte, com PHP orientado a objetos. Este projeto começará a ser disponibilizado em breve, assim que este aqui tiver a versão 1.0 concluída.*

	              ┌──────────┐     ←→╔══════════╗ 
	              │index.php │     ←→║ database ║
	              │(articles)│     ←→║   MySQL  ║
	              └────┬─────┘     ←→╚══════════╝
	     ┌─────────────┼────────────┐      
	┌────┴─────┐  ┌────┴─────┐  ┌───┴───┐  ←→╔═══════╗
	│   view   │  │ contacts │  │ about │  ←→║ Theme ║
	└──────────┘  └──────────┘  └───────┘  ←→╚═══════╝

## Por que PHP

Atualmente na versão 8, o PHP é uma linguagem moderna, atualizada, de código aberto, gratuita e com todos os conceitos e recursos necessários ao desenvolvimento de um aplicativo Web poderoso. É extremamente leve, consumindo poucos recursos de máquina e muito fácil de aprender, porque tem uma sintaxe simples, sem frescuras. Além disso, é extremamente fácil hospedar aplicativos em PHP na Internet, inclusive em provedores de hospedagem gratuita, coisa que pode ser literalmente impossível com outras linguagens de back-end.

>  *Já tentou alguma vez hospedar um aplicativo Web em Python ou mesmo Java? Gratuito ainda por cima? Vai... Tenta...*

Ao contrário do que os concorrentes tentam te vender, o PHP ainda é uma linguagem totalmente aplicável, sendo usada na maioria dos CMS (Content Management System) mais usados da Web como [WordPress](https://br.wordpress.org/), [Drupal](https://www.drupal.org), [Joomla](https://www.joomla.org/) muitos outros.

Para completar, quase 100% da documentação oficial está traduzida para o portugês do Brasil, o que pode facilitar bastante quem está começando na T.I.

- Site oficial do PHP → https://www.php.net/
- Documentação Oficial do PHP em português → https://www.php.net/manual/pt_BR/

## Como funciona

O aplicativo será desenvolvido aos poucos, em partes divididas por "Atividades", onde cada atividade já desenvolvida corresponde a um "branch" deste repositório.

Provavelmente, se você pesquisar na lista de "branches", vai ver algumas atividades já enviadas e devidamente documentadas. Já o branch "**main**" contém a versão mais recente do aplicativo, com todas as atividades publicadas, já inseridas, ou seja, contém o produto final, juntamente com este documento que você está lendo.

> *O branch **main** sempre contém os códigos da atividade mais recente, então pode ocorrer de, em algum momento, o aplicativo não funcionar corretamente com este branch.*

## Conhecimentos prévios

Será interessante, antes de iniciar este projeto, que você tenha domínio de desenvolvimento Web front-end usando HTML5, CSS3 e também alguma base de JavaScript. Um bom "lugar" para começar é o site, [W3Schools](https://www.w3schools.com/html/default.asp) que tem uma abordagem simples, minimalista e com testes práticos feitos diretamente no site. Se você prefere os caminhos diretos:

- HTML5 → https://www.w3schools.com/html/
- CSS3 → https://www.w3schools.com/css/
- JavaScript → https://www.w3schools.com/js/

O site também tem ótimos tutoriais para nosso back-end:

- PHP → https://www.w3schools.com/php/
- SQL → https://www.w3schools.com/sql/
- PHP com MySQL → https://www.w3schools.com/php/php_mysql_intro.asp

Obviamente, existem muitas outras fontes de pesquisa, cursos online gratuitos e pagos que podem servir de suporte para este projeto.

## Primeiros passos

Para executar as atividades e testar os resultados usaremos um servidor Web local com suporte a scripts PHP e banco de dados MySQL. Existem alguns aplicativos empacotados que já configuram no computador um ambiente de servidor Web funcional para desenvolver aplicativos Web como [XAMPP](https://www.apachefriends.org/pt_br/index.html), [WAMP Server](https://www.wampserver.com/en/), [EasyPHP](https://www.easyphp.org/), [USBWebServer](https://www.usbwebserver.net/webserver/) e outros. Além das versões para Windows, alguns deles funcionam no Linux e no MacOS também.

Existe ainda a possibilidade, necessitando de maiores conhecimentos, de fazer uma instalação "standalone" do servidor Web, como o Apache ou IIS, do interpretador PHP e do MySQL. Uma boa pesquisa na Internet vai complementar esses conhecimentos que fogem ao nosso escopo.

>  *Apesar do projeto funcionar em qualquer servidor Web com suporte ao PHP e um SGBD MySQL ou MariaDB, usaremos como base dos exemplos, o pacote XAMPP para Windows, cuja versão mais recente está disponível no [site oficial](https://www.apachefriends.org/pt_br/index.html).*

### Preparando o setup de desenvolvimento

Como vimos acima, vamos usar o XAMPP, portanto, nosso servidor Web de desenvolvimento será o Apache. Para facilitar o desenvolvimento sem interferir em outros aplicativos Web que estão em funcionamento no Apache, vamos ativar o recurso de *Wildcards*. Este passo é opcional, mas ajudará a evitar erros de caminho (path) durante o desenvolvimento, além de permitir a "convivência" com outros aplicativos Web hospedados no Apache local.

A própria documentação do XAMPP ensina a configurar o uso de wildcards no Apache, mas publiquei recentemente um artigo sobre o assunto no meu blog.

- [Desenvolvendo vários sites no Apache](http://catabits.com.br/desenvolvendo-varios-sites-no-apache/)

> *É possível ainda usar o recurso de Virtual Hosts do servidor Web, mas essa abordagem é mais trabalhosa e requer alguma intervenção no sistema operacional para cada novo aplicativo Web criado. Contraprodutivo para desenvolvedores...*

Se você ativou os *wildcards* no Apache, crie um diretório "firstphpapp" no diretório raiz do Apache (htdocs) - no XAMPP para Windows, normalmente fica como "`C:\xampp\htdocs\firstphpapp`" - e teste acessando, pelo navegador, o endereço [http://firstphpapp.localhost/](http://firstphpapp.localhost/).

Como vamos usar o MySQL, teste também o acesso a este, juntamente com o aplicativo de gestão *PHPMyAdmin*, acessando, pelo navegador, o endereço [http://localhost/phpmyadmin](http://localhost/phpmyadmin).

Além do servidor Web previamente configurado, vamos precisar de um editor de códigos. Sugiro o [Visual Studio Code](https://code.visualstudio.com/) e não tenho mais o que dizer sobre isso!

Obviamente, um navegador Web será necessário. Use o [Chrome](https://www.google.com/intl/pt-BR/chrome/)! Por que? Mais da metade do mundo usa ele e o restante usa todos os outros, então, desenvolva nele e depois, se necessário, faça ajustes para os outros. Não é questão de gosto do desenvolvedor e sim dos clientes que vão acessar seu aplicativo Web. Sem mimimi... Simples assim...

## Contribuições

Se você quiser participar deste projeto ou mesmo dar outro rumo para ele, não custa nada "forcar" e começar! Se preferir, abra uma [Issue](https://github.com/Luferat/FirstPHPApp/issues) e deixe sua contribuição.

## Vamos começar

Lembre-se que cada atividade está descrita na documentação de um branch deste repositório, assim como os arquivos de exemplo. Então, se seu setup já está ok, já escolheu seu editor de códigos favorito e já abriu o aplicativo Web no navegador, mesmo que ele esteja vazio, acesse o branch "[Atividade_01](https://github.com/Luferat/FirstPHPApp/tree/Atividade_01)" e vamos começar.

**Introdução** │ [Atividade 1](https://github.com/Luferat/FirstPHPApp/tree/Atividade_01) →