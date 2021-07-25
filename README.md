# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 2 - Tema
Nesta segunda atividade do projeto do aplicativo Web, vamos iniciar a construção do tema das páginas. Como de praxe, todas a páginas terão a mesma aparência, de forma a firmar a marca do aplicativo Web. Assim, todas usarão as mesmas cores, logotipo, posicionamento, ... *Ou seja, usarão o mesmo tema.*

Como qualquer aplicativo Web moderno, algumas características deste tema devem ser observadas:

### Front-end Responsivo

Um aplicativo Web é considerado responsivo quando pode ser visualizado, sem distorções, em dispositivos com larguras de telas diferentes, adaptando seu conteúdo para cada resolução. Para isso, trabalhamos com "breakpoints" ou resoluções de checagem. 

> *Para criar um aplicativo Web totalmente responsivo você deve ter um bom domínio dos conceitos de "CSS media query", "CSS Flexbox", "CSS Grid" e "CSS Functions", além de usar o JavaScript para controlar alguns recursos de responsividade como menus dropdown e medições dinâmicas. Outros conceitos importantes a serem trabalhados para a responsividade de um aplicativo Web são "[Mobile-First](https://www.google.com/search?q=Mobile-First)" e "[Web semântica](https://www.google.com/search?q=Web+sem%C3%A2ntica)".*

Se você não tem plenos domínios de CSS, uma dica é usar frameworks de front-end responsivos como o [Bootstrap](https://www.google.com/url?q=https%3A%2F%2Fgetbootstrap.com%2F&sa=D&sntz=1&usg=AFQjCNHea-iYIWyP3UopYgPIOBDbuzm7SA), [Materialize](https://www.google.com/url?q=https%3A%2F%2Fmaterializecss.com%2F&sa=D&sntz=1&usg=AFQjCNEIsSWTlFuZMouWFV43BDiKHGZwdQ), [Foundation](https://www.google.com/url?q=https%3A%2F%2Fget.foundation%2F&sa=D&sntz=1&usg=AFQjCNH0sBxfkqZZSrwGGU8RGhwua-y_bQ), [Ionic](https://www.google.com/url?q=https%3A%2F%2Fionicframework.com%2F&sa=D&sntz=1&usg=AFQjCNF7jg0LTm_bWJd0449SqDKeyqtDDQ) e vários outros, na criação de seus aplicativos Web. Como eles já fornecem as classes e "media-queries" prontas e documentadas, tem uma linha de aprendizado um pouco mais vertical, mas isso não se aplicará ao nosso aplicativo: por se tratar de um produto didático, ele será feito "na unha". O máximo que vamos usar é uma biblioteca JavaScript, a [jQuery](https://jquery.com/) e alguns plugins dela.

### Acesso Universal
Um aplicativo Web deve ser minimamente acessível para todas as pessoas que fazem parte de seu "público alvo", o que provavelmente inclui pessoas com deficiências motoras, visuais e auditivas. Focando nisso, alguns conceitos de acessibilidade devem ser corretamente trabalhados e implementados nos aplicativos Web. Seguem algumas dicas:

-   Um aplicativo Web responsivo facilita o uso por pessoas com baixa visão ou com dificuldades motoras, porque elas podem "controlar o zoom" do conteúdo sem que ocorram distorções que dificultem a navegação como uma barra de rolagem horizontal, por exemplo;
 
-   Evite textos corridos com letras muito pequenas, sendo a resolução minima ideal de 16 pixels de largura para a letra "M" (*Por que a letra "M"? Hummm...*);
 
- Botões, campos de formulário, itens de menu e links devem ter uma boa área de toque/seleção;
 
-   Evite o uso de medidas fixas como pt, px, cm. Prefira %, em, rem, vh e outras [unidades CSS](https://www.w3schools.com/cssref/css_units.asp) proporcionais;

> *Em nosso projeto, na maior parte do tempo, mediremos as fontes em "rem".*

- Use as tags semânticas do HTML5 de forma consciente, pois elas facilitam a navegação por "faladores", aplicativos de navegação aural, que ditam o aplicativo Web para pessoas com deficiência visual;
 
- Ainda para auxiliar os "faladores", conheça e trabalhe com o atributo [lang="pt-BR"](https://tableless.com.br/declarando-idiomas-no-html/) e paradigmas de "[CSS Aural](https://www.w3schools.com/cssref/css_ref_aural.asp)";
 
- Evite o uso de "**hover**" no conteúdo, que é quando o usuário precisa manter o dedo ou cursor sobre o elemento para ver outro que estava oculto, por exemplo, um submenu. Prefira o "**toggle**" que é quando o usuário toca no elemento para ver outro e toca novamente para ocultar;
 
- Tenha um cuidado especial com a paleta de cores que, além de representar o produto/serviço/cliente, deve facilitar a visualização dos diversos blocos e do conteúdo. Use contrastes entre fundo e texto, evitando fundos com imagens nesses casos. Uma dica é testar o aplicativo Web em "[escala de cinza"](https://pt.wikipedia.org/wiki/N%C3%ADvel_de_cinza) para verificar se os elementos mantém o contraste.

>*Pesquise mais sobre o assunto...*

## Mão na massa
Neste momento, o setup já está operacional e pronto para trabalhar...

Abra o arquivo "template.php" no editor e faça as alterações conforme este [modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_02/template.php). Resumidamente, criamos um bloco PHP no topo e:

 - Definimos uma constante PATH para acessar o diretório raiz do aplicativo Web;
 - Importamos o arquivo "config.php", responsável pela configuração inicial de cada página.

Teste o funcionamento da página, acessando-a no navegador, pelo endereço http://firstphpapp.localhost/template.php, verificando se ocorrem mensagens de erro. Se ocorrerem, revise a atividade com calma, baseando-se no modelo.

### Questões de reforço:

 1. Como definimos a constante PATH?
 2. O que é "$_SERVER"?
 3. Por que usamos "require_once" para importar o arquivo de configuração na página?
 4. Por que, aparentemente, nada aconteceu com a página, ao ser vista pelo navegador?

## Criando o tema
Ainda em "template.php", para criar o tema, vamos começar pela estrutura, ou seja, pelo HTML. Localize os blocos abaixo, onde adicionamos o conteúdo:

 - `<header>...</header>` → Contém o logotipo, o nome e o slogan do aplicativo Web;
 - `<nav>...</nav>` → Contém os links para as páginas do aplicativo Web. Observe que usamos ícones Font Awesome para melhorar o visual;
 - `<footer>...</footer>` → Contém a mensagem de copyright (licença) e alguns links para a página inicial e para o topo da página atual. Este link para o topo, aponta para a âncora `<a  id="top"></a>` que está logo no começo do `<body>` de "template.php".

Os três blocos têm estruturas bem simples, sem a necessidade de muitas explicações, mas não tenha preguiça de estudá-los...

Atualize a página "template.php" no navegador e observe que as estruturas já se apresentam. Só precisam ser estilizadas, para isso, abra o arquivo "css/global.css" e aplique nele, [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_02/global.css). Sobre este arquivo, vale destacar:

 - Já introduzimos a responsividade nos blocos iniciais do tema;
 - No elemento ".wrap", fixamos as larguras mínima (280px > 320px) e máxima (1024px) do conteúdo, em relação à largura da tela do navegador;
 - Usamos o conceito de "[flex box](https://www.w3schools.com/css/css3_flexbox.asp)" para facilitar o posicionamento dos elementos em resoluções diferentes;
 - Como usamos o paradigma "[mobile-first](https://www.google.com/search?q=Mobile%20First)", a única "[media query](https://www.w3schools.com/css/css3_mediaqueries.asp)" necessária até o momento foi para adequar o menu principal para telas maiores.

Da forma que construímos a página, com o mínimo de HTML e maior investimento no CSS, conseguimos trocar o tema rapidamente. Para ver isso, crie um novo arquivo "global2.css" e aplique nele, [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_02/global2.css). Agora, volte no código de template.php e altere a linha abaixo (linha 23), dentro da tag `<head>`:

    •••
    <link rel="stylesheet" href="/global.css">
    •••

para:

    •••
    <link rel="stylesheet" href="/global2.css">
    •••
Altere a largura da tela do navegador, para verificar a responsividade do tema.

> *Lembre-se de trabalhar com a metodologia "[Mobile First](https://www.google.com/search?q=Mobile%20First)", assim, usando as [ferramentas do desenvolvedor](https://www.google.com/search?q=chrome%20ferramentas%20desenvolvedor) do navegador, contrua o front-end com uma largura pequena (320 pixels pelo menos), representando um celular de baixa resolução. Somente quando o aplicativo se apresentar de forma satisfatória, aumente a largura da tela e faça os ajustes para resoluções maiores. Teste...*

Dúvidas, sugestões, contribuições e reporte de bugs devem ser postados [aqui](https://github.com/Luferat/firstphpapp/issues).

Na próxima atividade, vamos formatar a área de visualização do conteúdo principal da página.

← [Atividade 1](https://github.com/Luferat/firstphpapp/tree/Atividade_01) │ **Atividade 2** │ [Atividade 3](https://github.com/Luferat/firstphpapp/tree/Atividade_03) →