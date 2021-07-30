<?php

/**
 * index.php
 * Página principal da seção de contatos.
 */

// Define constante com o diretório raiz (/) do aplicativo
define('PATH', $_SERVER['DOCUMENT_ROOT']);

// Importa arquivo de configuração da página
require_once(PATH . '/config/config.php');

///// Título da página /////
$title = 'Faça Contato';

//////////////////////////////////////////////////////////////
///// Os códigos PHP para gerar o conteúdo começam aqui. /////
//////////////////////////////////////////////////////////////

// Inicializa variáveis do script
$contact_error = '';

// Template do formulário HTML
$contact_form = <<<HTML

<form method="post" id="contact" action="/contacts/index.php">

    <input type="hidden" name="contact_send" value="true">

    <p class="advise">Todos os campos são obrigatórios.</p>

    <p>
        <label for="name">Nome:</label>
        <input type="text" name="name" id="name" required minlength="3" class="valid">
    </p>

    <p>
        <label for="email">E-mail:</label>
        <input type="email" name="email" id="email" required class="valid">
    </p>

    <p>
        <label for="subject">Assunto:</label>
        <input type="text" name="subject" id="subject" required minlength="3" class="valid">
    </p>

    <p>
        <label for="message">Mensagem:</label>
        <textarea name="message" id="message" required minlength="5" class="valid"></textarea>
    </p>

    <p>
        <label></label>
        <button type="submit">Enviar</button>
    </p>

</form>

HTML;

if (isset($_POST['contact_send'])) :

    // Recebe e sanitiza os campos usando a função post_clean() que está em config/config.php
    $name = post_clean('name', 'string');
    $email = post_clean('email', 'email');
    $subject = post_clean('subject', 'string');
    $message = post_clean('message', 'string');

    // Detecta campos vazios (ou, não aprovados na sanitização)
    if ($name == '' or $email == '' or $subject == '' or $message == '') :
        $article = <<<HTML
   
   <h2>Faça contato</h2>
   <p>Preencha os campos abaixo para entrar em contato conosco.</p>
   
   <div class="feedback_error">
       <strong>Olá!</strong>
       <p>Um ou mais campos do formulário estão vazios!</p>
       <p>Não foi possível enviar seu contato.</p>
       <p>Por favor, preencha todos os campos e tente novamente.</p>
   </div>

   {$contact_form}
   
   HTML;

    else :

        // Salva contato no banco de dados usando Prepared Query
        $sql = "INSERT INTO contacts (name, email, subject, message) VALUES (?, ?, ?, ?);";
        $stmt = $conn->prepare($sql);

        // Obtém dados dos campos
        $stmt->bind_param("ssss", $name, $email, $subject, $message);

        // Executa a query
        $stmt->execute();

        ///// Formata e-mail para o admin /////

        // Assunto do e-mail
        $subject = "Contato de {$C['appTitle']}";

        // Formata mensagem do e-mail
        $message = <<<MSG

Olá {$C['appOwner']}!

Você recebeu um contato de {$C['appTitle']}, enviado pelo formulário de contatos:

 • Remetente: {$name} <{$email}>
 • Assunto: {$subject}
--- Mensagem ----------
{$message}

------------------------------
Mensagem gerada automaticamente pelo formulário de contatos.
Não responda esta mensagem.

MSG;

        // Formata cabeçalho do e-mail
        $headers = "From: {$C['appOwnerEmail']}\r\n";

        // Envia e-mail
        // Usamos '@' para evitar erros no XAMPP e no Windows
        @mail($C['appOwnerEmail'], $subject, $message, $headers);

        // Transforma o nome em uma array para obter só o primeiro nome ($names[0])
        $names = explode(' ', $name);

        // Feedback para usuário
        $article = <<<HTML
   
   <div class="feedback_ok">
       <strong>Olá {$names[0]}!</strong>
       <p>Seu contato foi enviado para a equipe do {$C['appTitle']}.</p>
       <em>Obrigado!</em>
       <p class="center">
           <a href="/"><i class="fas fa-fw fa-home"></i> Página inicial</a>
       </p>
   </div>
   
   HTML;

    endif;

else :

    // Exibe formulário de contatos
    $article = <<<HTML

<h2>Faça contato</h2>
<p>Preencha os campos abaixo para entrar em contato com '{$C['appTitle']}'.</p>
{$contact_form}    

HTML;

endif;

// Cabeçalho da sidebar
$aside = <<<HTML

<h3>+Contatos</h3>
<p>Você também pode entrar em contato conosco pelas redes sociais.</p>
<div class="social-list">

HTML;

// Ordena array pela chave
ksort($C['social']);

// Itera redes sociais em $C
foreach ($C['social'] as $key => $value) :

    // Formata nome da rede social
    $ucf_social = ucfirst($key);

    // Lista rede social
    $aside .= <<<HTML

<a href="{$value}" target="_blank">
    <i class="fab fa-{$key} fa-fw"></i> {$ucf_social}
</a>

HTML;

endforeach;

// Fecha bloco com lista de redes sociais
$aside .= '</div>';

///////////////////////////////////////////////////////////////
///// Os códigos PHP para gerar o conteúdo terminam aqui. /////
///////////////////////////////////////////////////////////////

// Importa abertura do tema
require_once(PATH .  '/config/header.php');

?>

<article><?= $article ?></article>
<aside><?= $aside ?></aside>

<?php

// Importa fechamento do tema
require_once(PATH . '/config/footer.php');

?>