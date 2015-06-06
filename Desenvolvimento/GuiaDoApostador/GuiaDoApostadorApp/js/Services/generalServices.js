guiaDoApostador.service('mostraAguarde', function ($ionicLoading) {
    return function () {
        $ionicLoading.show({
            template: "<img src='img/aguarde.gif' /> <b>Carregando...</b>"
        });
    }
})
.service('ocultaAguarde', function ($ionicLoading) {
    return function () { $ionicLoading.hide(); }
})
.service('mostraPopUpSucesso', function ($ionicPopup, returnToState) {
    return function (tituloModal, texto, pagina) {
        var alertPopup = $ionicPopup.alert({
            title: tituloModal,
            template: texto
        });
        alertPopup.then(function (res) {
            returnToState(pagina);
        });
    }
})
.service('mostraPopUpErro', function ($ionicPopup, ocultaAguarde) {
    return function (texto) {
        var alertPopup = $ionicPopup.alert({
            title: 'Ops... Ocorreu um erro',
            template: texto
        });
        ocultaAguarde();
        alertPopup.then(function (res) {
        });
    }
})
.service('mostraMensagemTemporaria', function ($cordovaToast, mostraPopUpErro) {
    return function (mensagem, duracao, posicao) {
        try {
            $cordovaToast.show(mensagem, duracao, posicao).then(function (success) {
                // success
            }, function (error) {
                // error
            });
        }
        catch (e) {
            mostraPopUpErro(mensagem);
        }
    }
})

