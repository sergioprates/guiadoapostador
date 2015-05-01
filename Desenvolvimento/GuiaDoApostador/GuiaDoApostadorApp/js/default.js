$(document).on("pagebeforeshow","#default",function(){
    $('#txtLoginCorretor').val('');
    $('#txtSenhaCorretor').val('');
    montaValidacaoLoginCorretor();
});

function logar() {
    if($("#frmLoginCorretor").valid()){
    mostraPopupConfirmacao('Confirma os dados?', autenticaCorretor);
    }
}

function autenticaCorretor(btn) {
     if(btn == 1){
    mostraPopUpAguarde();
    var obj = new Object();
    obj.corretor = new Object();
    obj.corretor = mapearLoginCorretor();
    WebService(pegaURLWS() + 'autenticarCorretor', obj, autenticaCorretor_callback, onError);
     }
}

function autenticaCorretor_callback(res) {
    ocultaPopupAguarde();
    var corretor = res.d;
    if (corretor != undefined && corretor != null) {
        window.localStorage.setItem('corretor', JSON.stringify(corretor));
         
        redirect('#home', 'slideup');
    }
    else {
        mostraPopupErro('Ocorreu um erro ao processar a solicitação.<br> Tente Novamente!');
    } 
}

function mapearLoginCorretor() {
    var corretor = new Object();
    corretor.Login = $('#txtLoginCorretor').val();
    corretor.Senha = $('#txtSenhaCorretor').val();
    return corretor;
}

function montaValidacaoLoginCorretor() {    
    
    $( "#frmLoginCorretor").validate({
        onclick: false,
        onkeydown: false,
        onkeypress: false,
        onkeyup: false,
        rules: {
            txtLoginCorretor: {                
                required: true
            },
            txtSenhaCorretor: {
                required: true
            }
    },
        messages: {
            txtLoginCorretor: {
                required: 'Preencha o login.'
            },
            txtSenhaCorretor: {
                required: 'Preencha a senha.'
            }
        },
        showErrors: mostraPopupValidacao
    });
}