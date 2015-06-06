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
.service('mostraPopUpErro', function ($ionicPopup) {
        return function (texto) {
            var alertPopup = $ionicPopup.alert({
                title: 'Ops... Ocorreu um erro',
                template: texto
            });
            alertPopup.then(function (res) {
            });
        }
})
.service('openDb', function ($cordovaSQLite, mostraPopUpErro) {
    return function () {
        var db;
        try
        {
            if (window.cordova) {
                db = $cordovaSQLite.openDB({ name: "guiadoapostador.db", bgType: 1 }); //device

            } else {
                db = window.openDatabase("guiadoapostador.db", '1', 'guiadoapostador', 1024 * 1024 * 100); // browser
            }

            $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS apostas (idAposta integer primary key, idConcurso integer, TipoConcurso TEXT, Verificado integer,  datCadastro datetime default current_timestamp, datSorteio datetime)");
            $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS dezenas (idAposta integer, dezena integer)");
        }
        catch (e) {
            mostraPopUpErro('Não foi possível conectar à base de dados, openDb. Erro: ' + JSON.stringify(e));
        }
        return db;
    }
})
.service('mostraMensagemTemporaria', function ($cordovaToast, mostraPopUpErro) {
    return function (mensagem, duracao, posicao) {
        try
        {
            $cordovaToast.show(mensagem, duracao, posicao).then(function (success) {
                // success
            }, function (error) {
                // error
            });
        }
        catch(e)
        {
            mostraPopUpErro(mensagem);
        }
    }
})

