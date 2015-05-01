document.addEventListener("deviceready", onDeviceReady, false);
document.addEventListener("offline", checkConnection, false);
document.addEventListener("online", checkConnection, false);    

function onDeviceReady() {

    $('.ui-loader-default').hide();
    carregaTelas();
    adicionaValidacoesCustomizadas();
}

function carregaTelas() {
    $("div[data-role=page]").each(function (index) {
        if (this.id != "default"){
        $("#" + this.id).load("paginas/" + this.id + ".html",
                function () {
                    window.location = "#default";
                    navigator.splashscreen.hide();
                });
         }                
    });
}

function checkConnection(){
}



var WebService =  function(urlWS, param, successCallback, errorCallback) {
    var paramJson = JSON.stringify(param);
    $.ajax({
        type: 'POST',
        url: urlWS,
        data: paramJson,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: successCallback,
        error: errorCallback
    });
};

function redirectComVoltar(pagina, paginaAnterior, idBtnVoltarHeader){
    window.location = pagina;
    $.mobile.changePage( pagina, { transition: "slide"});
    
    $('#btn' + idBtnVoltarHeader + 'Voltar').attr('onclick',"redirect('" + paginaAnterior + "','flip')");
}

function redirect(pagina, direcao){
    window.location = pagina;
    $.mobile.changePage(pagina, { transition: direcao});
}

function onError(xhr, msg, e) {
    ocultaPopupAguarde();
    var err = eval("(" + xhr.responseText + ")");
    mostraPopupErro(err.Message);
}    

function mostraPopupConfirmacao(texto, funcaoCallBack){
    navigator.notification.confirm(
        texto,
        funcaoCallBack,
        'Confirmação',
        ['Sim','Não']
    );
}

function mostraPopupErro(mensagem){
    ocultaPopupAguarde();
    navigator.notification.alert(
        mensagem,
        function(){ },
        'Ops...',
        'Ok'
    );      
}     

function mostraPopUpAguarde(){
    $.blockUI({ 
        message: '<img src="imgs/carregando.gif" width="30px" height="30px"/> Aguarde...', 
        css:  { "border-width":"0px",  "backgroundColor": '#58ACFA', "color": '#fff', "border-radius": '4px', "padding": '10px'}
    });
}

function ocultaPopupAguarde(){
    $.unblockUI();
}  

function mostraPopupValidacao(errorMap, errorList) {
    if (errorList.length > 0){
        var errorMessagem = "Alguns campos não foram preenchidos corretamente:\n\r";
        for (var i = 0; i < errorList.length; i++){
            errorMessagem += errorList[i].message + "\n\r";
        }
    
        navigator.notification.alert(
            errorMessagem,
            function(){ },
            'Atenção',
            'Ok'
        );             
    }        
}

function pegaURLWS() {
    //return "http://localhost:3228/AppImoveis_Website/Webservice.asmx/";
    //return "http://imoveis.somee.com/webservice.asmx/";
    return "http://sergioprates-001-site1.smarterasp.net/Webservice.asmx/";
}


function adicionaValidacoesCustomizadas() {
    $.validator.addMethod("cpf", function (value, element) {
        var strCPF = value.replace('.','').replace('.','').replace('-','');
        var Soma; var Resto; Soma = 0; if (strCPF == "00000000000") return false; for (i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i); Resto = (Soma * 10) % 11; if ((Resto == 10) || (Resto == 11)) Resto = 0; if (Resto != parseInt(strCPF.substring(9, 10)) ) return false; Soma = 0; for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i); Resto = (Soma * 10) % 11; if ((Resto == 10) || (Resto == 11)) Resto = 0; if (Resto != parseInt(strCPF.substring(10, 11) ) ) return false; return true;
    }, "CPF inválido");
}