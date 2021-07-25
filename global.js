/** global.js
 * JavaScript global usado pelo template do site.
 */

// Executa o JavaScript quando o documento estiver pronto
$(document).ready(runApp);

// Aplicativo principal
function runApp() {

    // Destaca o item de menu ativo
    activeMenu();
}

// Destaca o item de menu ativo
function activeMenu() {

    // Identifica o pathname atual
    var local = window.location.pathname.split('/');

    // Itera todos os itens do menu principal
    $("nav a").each(function () {

        // Obtém o valor de "href" do item atual
        var itemHref = $(this).attr('href').replace('/', '');

        // Se tem o mesmo valor que o URI
        if (itemHref == local[1])

            // Destaca item de menu
            $(this).addClass('active');
    });
}
