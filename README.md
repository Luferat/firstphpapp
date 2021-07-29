# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 14 - Formulário de contatos

Vamos construir o formulário de contatos do aplicativo. É sempre importante citar que formulários são a forma mais simples de permitir a interação entre usuário/visitante e o servidor do aplicativo Web. Isso faz com que formulários que não sejam bem tratados sirvam de porta de entrada para crackers que podem danificar o aplicativo, acessar dados internos, etc.

Abra "contacts/index.php" no editor e, conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_14/contacts/index.php), crie um formlário de contatos simples, usando HTML5. Sobre o código, vale ressaltar:

- Observe que colocamos o código HTML5 do formulário em uma variável à parte ($contact_form) para facilitar o processamento.

- Usamos a validação de front-end do próprio HTML5 para facilitar as coisas, usando os atributos `required` e `minlength`, por exemplo. Para que isso funcione, temos que observar também os atributos `type=""` dos campos, por exemplo, para validar o e-mail, usamos `type="email"` para este campo.

- Já criamos o `if` que detecta se o formulário foi enviado para processamento. Esse bloco ainda não existe, criaremos em breve, mas ele simplesmente detecta a presença do campo `contact_send`, sendo enviado. Este campo é oculto no formulário (`type="hidden"`) e serve apenas para essa detecção.

      if (isset($_POST['contact_send'])) :
          ••• Processaremos o formulário enviado aqui
      else:
          ••• Exibe o formulário a ser preenchido aqui.
      endif; 

- Por questões de organização, inserimos todo o código do formulário antes do código que gera o conteúdo da `<aside>`.

Como estamos usando a validação do HTML5, podemos usar CSS para melhorar o visual do formulário e já dar algum feedback para quem o está preenchendo.

Abra "contacts/index.css" no editor e, siga [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_14/contacts/index.css) para criar as classes para exibir o formulário. Observe que, com CSS podemos, por exemplo, bloquear o botão de envio, até que o formulário seja válido. Além disso, marcamos em vermelho os campos inválidos e, em verde, os válidos. Isso é bom porque economiza JavaScript para fazer toda a validação no front-end.

Por falar em JavaScript, vamos criar um bem simples, que apenas sanitiza o campo que está sendo preenchido evitando, por exemplo, que o usuário preencha um campo só com espaços. Crei e edite "contacts/index.js" seguindo [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_14/contacts/index.js). Mais uma vez, usamos jQuery para tornar as coisas mais simples e uma [Regex](https://www.google.com/search?q=regex) para avaliar e sanitizar o preenchimento do campo.

Por enquanto é só. Nas próximas atividades vamos enviar os dados do formulário para o banco de dados e por e-mail.

Envie suas dúvidas, críticas e sugestões [clicando aqui](https://github.com/Luferat/firstphpapp/issues).

← [Atividade 13](https://github.com/Luferat/firstphpapp/tree/Atividade_13) │ **Atividade 14** │ [Atividade 15](https://github.com/Luferat/firstphpapp/tree/Atividade_15) →