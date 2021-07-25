# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 7 - Integrando o banco de dados

Vamos integrar o aplicativo e o banco de dados, começando pela conexão de "config/config.php" com o MySQL. Os dados de conexão ficam armazenados em "[config/config.ini](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_07/config/config.ini)".  Este arquivo contém 2 blocos ou seções distintas:

 - A primeira seção contém os dados de conexão com o MySQL do XAMPP. Observe que, o nome da seção, entre colchetes, é justamente o *SERVER_NAME* do aplicativo no XAMPP:

		[firstphpapp.localhost]
		server = 'localhost'
		database = 'firstphpapp'
		user = 'root'
		password = ''

> *Esses valores são padrão do XAMPP. Caso você tenha mudado alguma coisa no MySQL do XAMPP, ajuste aqui também.*

- Já a segunda seção contém as configurações no provedor de hospedagem. Como ainda não hospedamos o aplicativo, esses dados estão em branco. Observe que aqui, "www.firstphpapp.com" deve ser substituído pelo SERVER_NAME do aplicativo, já hospedado:

      [www.firstphpapp.com]
      server = ''
      database = ''
      user = ''
      password = ''

O trecho abaixo, dentro de "theme/config.php" é o responsável por ler os dados do arquivo "theme/config.ini", usando para isso a função "`parse_ini_file()`" do PHP:

	•••
	$i = parse_ini_file($_SERVER['DOCUMENT_ROOT'].'/theme/config.ini', true);
	foreach ($i as $k => $v) :
	    if ($_SERVER['SERVER_NAME'] == $k):
	        @$conn = new mysqli($v['server'], $v['user'], $v['password'], $v['database']);
	        if ($conn->connect_error) die("Falha de conexão com o banco e dados: " . $conn->connect_error);
	    endif;
	endforeach;
	•••

O código compara o SERVER_NAME atual com os que estão no arquivo "theme/config.ini" e conecta ao MySQL com as credenciais corretas. A conexão foi feita usando a classe "mysqli" do PHP, com um toque de orientação à objetos.

> *Alguém "mais ~~doente~~ experiente" diria para usarmos PDO porque é "fashion",  "hardcore", complicado e midiático, mas há uma falha de paradigmas aí! Só usamos PDO se pretendermos, algum dia, trocar o tipo de banco de dados desse aplicativo, o que não é o caso. Hã!? Se projetamos nosso aplicativo para usar **MySQL** e pretendemos mudar de SGBD um dia, **temos uma falha gravíssima nesse projeto**, não concorda!*

- [Para saber mais sobre conexões PHP / MySQL](https://www.w3schools.com/php/php_mysql_connect.asp).

Uma vez que o MySQL esteja conectado, vamos fazer alguns "setups" iniciais para sintonizá-lo com nosso PHP. Basicamente, *setamos* todas as transações *PHP ←→ MySQL* para UTF-8 e as datas (meses e dias da semana) para português do Brasil:

	•••
	$conn->query("SET NAMES 'utf8'");
	$conn->query('SET character_set_connection=utf8');
	$conn->query('SET character_set_client=utf8');
	$conn->query('SET character_set_results=utf8');
	$conn->query('SET GLOBAL lc_time_names = pt_BR');
	$conn->query('SET lc_time_names = pt_BR');
	•••

Pois, lembra-se da array `$C` que faz a configuração do aplicativo? Vamos trocar a atribuição de valores estáticos dela pelos dados da tabela "config" do banco de dados. O trecho abaixo resolve isso:

	•••
	$sql = "SELECT * FROM config";
	$res = $conn->query($sql);
	while ($data = $res->fetch_assoc()) :
	    •••
	endwhile;
	•••

Abra o arquivo "config/config.php" no editor e troque os códigos pelos [deste modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_07/config/config.php).

Teste a página "template.php" no navegador, acessando http://firstphpapp.localhost/template.php. Não devem ocorrer mensagens de erro, nem da *view* da página nem no console do navegador.

### Exercícios

1. Experimente alterar os valores dos registros da tabela "config", usando o PHPMyAdmin, e veja os resultados na página "template.php".
2. Descomente (remova "//") a linha abaixo de "config/config.php" e veja no código fonte da página "template.php" como fica a array `$C`. Lembre-se de comentá-la ou removê-la após os estudos...

       // print_r($C); exit;

E, aqui, praticamente encerramos a construção do tema do aplicativo Web. Nas próximas atividades, vamos "gerar" as páginas e seus respectivos conteúdos...

Críticas, sugestões e informes de bugs são bem vindos. [Clique aqui](https://github.com/Luferat/firstphpapp/issues) para colaborar!

← [Atividade 6](https://github.com/Luferat/firstphpapp/tree/Atividade_06) │ **Atividade 7** │ [Atividade 8](https://github.com/Luferat/firstphpapp/tree/Atividade_08) →