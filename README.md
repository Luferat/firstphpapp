# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 4 - Páginas mais dinâmicas

Nesta atividade, vamos tentar automatizar algumas coisas no tema da página, de forma a tornar a configuração do aplicativo mais independente do código fonte. A ideia é que as configurações mais genéricas e usuais como logotipo, nome do aplicativo e imagem do fundo sejam obtidos a partir de um único local, preferencialmente do banco de dados.

A primeira tarefa é definir essas configurações e salvá-las em uma variável. Futuramente, essa variável será criada pelo banco de dados, mas por hora, vamos armazenar os dados estaticamente, editando o arquivo "config/config.php" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_04/config/config.php). 

O que fizemos foi, por questões de compatibilidade com o HTML5, definir todas as saídas do PHP em UTF-8. Essa deve ser a primeira linha "executável" de nosso aplicativo Web, sempre:

	•••
	// PHP com UTF-8
	header('Content-Type: text/html; charset=UTF-8');
	•••

Agora, criamos a variável `$C` com tudo que queremos automatizar no tema:

    •••
	// Array com as configurações do tema
	$C = array(
		'favicon' => '/img/logo01.png', // Ícone dos favoritos
		'appLogo' => '/img/logo02.png', // Logotipo
		'appTitle' => 'Meu Primeiro App', // Título do aplicativo
		'appSlogan' => 'Primeiros passos no PHP', // Slogan do aplicativo
		'appYear' => '2021', // Ano inicial do copyright
		'appOwner' => 'Seu Nome', // Proprietário do copyright
		'backgroundColor' => 'rgb(113, 34, 43)', // Cor de fundo do aplicativo
		'backgroundImage' => '/img/background02.jpg'
	);
    •••

Vamos "*passear*" pelos códigos HTML do tema e fazer as substituições necessárias:

Edite "template.php", conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_04/template.php), onde configuramos dinamicamente o fundo da página:

	•••
	<style>
	/* Define o background da página */
	body {
	    background-color: <?= $C['backgroundColor'] ?>;
	    background-image: url('<?= $C['backgroundImage'] ?>');
	}
	</style>
	•••
 
Também o favicon (ícone dos favoritos) e a tag `<title>`:

    •••
    <link rel="icon" href="<?= $C['favicon'] ?>">
    <title><?= $C['appTitle'] ?></title>
    •••

Editamos o conteúdo do bloco `<header>...</header>`:

    •••
    <header>
        <a  href="/"><img src="<?= $C['appLogo'] ?>" alt="<?= $C['appTitle'] ?>"></a>
        <h1><?= $C['appTitle'] ?><small><?= $C['appSlogan'] ?></small></h1>
    </header>
    •••

Também o bloco `<footer>...</footer>`, para quem, calculamos o ano de criação do aplicativo para a mensagem de *copyright* no começo do código:

    •••
    // Define o(s) ano(s) na mensagem de copyright
    if (intval(date('Y')) > intval($C['appYear']))
        // Se o ano atual é maior que o ano de criação do aplicativo, exibe os dois anos
        $appYear = $C['appYear'] . ' ' . date('Y');
    else
        // Se não, exibe o ano de criação do aplicativo
        $appYear = $C['appYear'];
    •••

E, logo depois, exibimos a mensagem de *copyright* neste bloco, à partir de `$C`:

    •••
    <div>&copy; Copyright <?= $appYear ?> <?= $C['appOwner'] ?>.</div>
    •••

Um último ajuste, para que tudo dê certo, é remover as configurações de background das folhas de estilo, editando "global.css" conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_04/global.css).

    •••
	body {
	  /* background-color: rgb(113, 34, 43); */
	  background-size: cover;
	  background-repeat: no-repeat;
	  background-attachment: fixed;
	  background-position: center;
	  /* background-image: url("/img/background02.jpg"); */
	}
	•••
    
Observe que agora, se você quiser alterar uma dessas configurações no seu aplicativo Web, basta alterar o valor da chave correta de `$C` em "theme/config.php", lembrando que, em breve, esses valores virão do banco de dados.

### Exercícios ###

- Troque os valores da variável `$C` em "config/config.php" e veja os resultados;
- Troque especificamente o ano do aplicativo (`$C['appYear']`) para dois ou três anos atrás;
- Experimente acrescentar novas configurações, por exemplo, a fonte do aplicativo.

Para as próximas atividades, vamos montar o tema e construir o conteúdo. Vamos precisar do banco de dados, então, não custa nada já se preparar. Algumas documentações sugeridas são:

- https://www.w3schools.com/sql/default.asp;
- https://www.w3schools.com/php/php_mysql_intro.asp;

Estude, [colabore](https://github.com/Luferat/firstphpapp/issues) e até a próxima atividade.
   
← [Atividade 3](https://github.com/Luferat/firstphpapp/tree/Atividade_03) │ **Atividade 4** │ [Atividade 5](https://github.com/Luferat/firstphpapp/tree/Atividade_05) →