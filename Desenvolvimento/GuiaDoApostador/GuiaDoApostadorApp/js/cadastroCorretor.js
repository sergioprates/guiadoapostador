$(document).on("pagebeforeshow", "#cadastroCorretor", function () {
    montaValidacaoCadastroCorretor();
    carregaMascaraCadastroCorretor();
});

function confirmaCorretor() {
    if ($("#frmCadastroCorretor").valid()) {
        mostraPopupConfirmacao('Confirma os dados?', cadastrarCorretor);
    }
}

function cadastrarCorretor(btn) {
    if (btn == 1) {
        mostraPopUpAguarde();
        var obj = new Object();
        //objeto que ser� passado no WS
        obj.corretor = mapearCadastroCorretor();

        WebService(pegaURLWS() + 'cadastrarCorretor', obj, cadastrarCorretor_callback, onError);
    }
}

function cadastrarCorretor_callback(res) {
    ocultaPopupAguarde();
    var corretor = res.d;
    window.localStorage.setItem('corretor', JSON.stringify(corretor));
    redirect('#home', 'slide');
}

function mapearCadastroCorretor() {
    var corretor = new Object();
    corretor.Ativo = true;
    corretor.Nome = $('#txtNomeCorretorCadastro').val();
    corretor.Login = $('#txtLoginCorretorCadastro').val();
    corretor.Senha = $('#txtSenhaCorretorCadastro').val();
    corretor.CPF = $('#txtCpfCorretorCadastro').val().replace('.', '').replace('.', '').replace('-', '');

    return corretor;
}

function montaValidacaoCadastroCorretor() {
    $("#frmCadastroCorretor").validate({
        onclick: false,
        onkeydown: false,
        onkeypress: false,
        onkeyup: false,
        onblur: false,
        rules: {
            txtNomeCorretorCadastro: {
                required: true
            },
            txtCpfCorretorCadastro: {
                required: true,
                cpf: true
            },
            txtLoginCorretorCadastro: {
                required: true
            },
            txtSenhaCorretorCadastro: {
                required: true
            }
        },
        messages: {
            txtNomeCorretorCadastro: {
                required: "Preencha o nome."
            },
            txtCpfCorretorCadastro: {
                required: "Preencha o Cpf."
            },
            txtLoginCorretorCadastro: {
                required: "Preencha o login."
            },
            txtSenhaCorretorCadastro: {
                required: "Preencha a senha."
            }
        },
        showErrors: mostraPopupValidacao
    });
}

function carregaMascaraCadastroCorretor() {
    $("#txtCpfCorretorCadastro").mask("999.999.999-99");

}