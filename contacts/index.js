/** index.js
 * JavaScript usado pelo formulário de contatos
 */

// Executa o JavaScript quando o documento estiver pronto
$(document).ready(runContacts);

function runContacts() {

    // Monitora modificações nos valores dos campos
    $(document).on('keyup', '#contact input', sanitize);
    $(document).on('keyup', '#contact textarea', sanitize);
}

// Sanitiza preenchimento dos campos
function sanitize() {

    // Obtém o valor do campo
    var string = $(this).val();

    // Busca e remove espaços duplicados
    string = string.replace(/\s{2,}/g, ' ');

    // Atualiza valor do campo
    $(this).val(string);
}