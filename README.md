
# First PHP App

**Este é um projeto para apoiar estudantes e entusiastas de desenvolvimento Web que estão dando seus primeiros passos na criação de aplicativos Web "full stack" com PHP, MySQL, HTML, CSS e JavaScript.**

*Se você caiu nesta atividade "de paraquedas", [clique aqui](https://github.com/Luferat/firstphpapp) para começar "do jeito certo"!*

## Atividade 8 - Criando as páginas

Com nosso tema pronto e para "matar a ansiedade", finalmente, vamos construir as páginas e a estrutura de navegação do aplicativo Web.

Primeiro, precisamos ter em mente que todas as páginas serão, basicamente, cópias de "template.php", então vamos preparar este arquivo conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_08/template.php). Tá, somente removemos os *lorem ipsum* das variáveis `$article` e `$aside`, deixando-as vazias e prontas para nosso conteúdo.

Além dos artigos publicados, teremos mais 2 seções, então crie os diretórios para elas:

- `contacts` → Seção de contatos;
- `about` → Seção "Sobre".

Então, nossa estrutura de diretórios ficará assim:

    [C:]
      ├─> xampp
      │    ├─> htdocs
      •    │    ├─> firstphpapp
      •    •    │    ├─> about
      •    •    •    ├─> contacts
      •    •    •    ├─> img
                •    ├─> config

Dentro de cada um dos 2 novos diretórios, coloque uma cópia de "template.php", lembrando de renomear cada uma de "template.php" para "index.php".

Finalmente, crie mais uma cópia de "template.php" na raiz do aplicativo, renomeando-a para "index.php". Essa será a página inicial do aplicativo, onde os artigos serão listados!

> *Não apague ou modifique "template.php" à partir daqui, porque ela será modelo para outras páginas que incluirmos em nosso aplicativo...*

Com isso, a navegação do aplicativo já está funcionando. Teste, clicando nos itens do menu principal e no rodapé.

### Um pouco de JavaScript

Vamos melhorar a navegabilidade pelo aplicativo usando JavaScript. Simplesmente, vamos "destacar" no menu principal, a seção em que estamos no momento.

> *Se você tem trauma de JavaScript, o código é bem simples, mas, de qualquer forma, já está na hora de procurar o psicanalista!*

Primeiro precisamos criar uma classe para destacar o item do menu. Edite o trecho abaixo de "global.css", ou use [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_08/global.css), alterando de:

	nav a:hover {
        color: rgb(255, 255, 0);
        text-decoration: none;
    }

para:

	nav a:hover {
        color: rgb(255, 255, 0);
        text-decoration: none;
    }
    .active {
	    color: rgb(255, 166, 0);
    }

Observe que somente criamos uma classe ".active", que será usada pela função JavaScript abaixo. 

Abra então, "global.js" e altere seu conteúdo conforme [este modelo](https://raw.githubusercontent.com/Luferat/firstphpapp/Atividade_08/global.js), onde criamos uma função "`activeMenu()`" usando os poderes da [jQuery](https://www.w3schools.com/jquery/) que, apesar de "velhinha", é muito "gostosa" de trabalhar...

Teste astante a navegação e o efeito do JavaScript acima

Está gostando? Está chato, feio e bobo? Tá bugado? Então, contribua [clicando aqui](https://github.com/Luferat/firstphpapp/issues).

Nas próximas atividades, vamos criar a seção de artigos.

← [Atividade 7](https://github.com/Luferat/firstphpapp/tree/Atividade_07) │ **Atividade 8** │ [Atividade 9](https://github.com/Luferat/firstphpapp/tree/Atividade_09) →