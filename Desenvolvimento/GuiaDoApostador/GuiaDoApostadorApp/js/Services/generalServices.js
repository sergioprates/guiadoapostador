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
.service('openDb', function ($cordovaSQLite) {
    return function () {
        var db;
        if (window.cordova) {
            db = $cordovaSQLite.openDB({ name: "guiadoapostador.db", bgType: 1 }); //device

        } else {
            db = window.openDatabase("guiadoapostador.db", '1', 'guiadoapostador', 1024 * 1024 * 100); // browser
        }

        $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS apostas (idAposta integer primary key, idConcurso integer, TipoConcurso TEXT, Verificado integer,  datCadastro datetime default current_timestamp, datSorteio datetime)");
        $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS dezenas (idAposta integer, dezena integer)");
        $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS bilhete (idAposta integer, numeroBilhete integer)");
        $cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS timeDoCoracao (idAposta integer, time TEXT)");
        return db;
    }
})
.service('mostraMensagemTemporaria', function ($cordovaToast, mostraPopUpErro) {
    return function (mensagem, duracao, posicao) {
        try {
            $cordovaToast.showShortBottom(mensagem).then(function (success) {
                //alert('Exibiu');
            }, function (error) {
                alert('erro na mensagem temporaria: ' + JSON.stringify(error));
            });
        }
        catch (e) {
            try {
                alert(JSON.stringify(window.plugins.toast));
                window.plugins.toast.showShortBottom(mensagem);
            }
            catch (e) {
                mostraPopUpErro(mensagem);
            }
        }
    }
})

.service('onLoadApp', function (PushProcessingService, mostraPopUpErro) {
    return function () {
        try {
            PushProcessingService.initialize();
        }
        catch (e) {
            alert('Erro ao inicializar push: ' + JSON.stringify(e));
        }

        try {
            // Android customization

            var options = {
                title: 'Guia do Apostador',
                text: 'O aplicativo Guia do Apostador está executando.',
                silent: false
            };
            window.plugin.backgroundMode.setDefaults(options);
            // Enable background mode
            window.plugin.backgroundMode.enable();

            // Called when background mode has been activated
            window.plugin.backgroundMode.onactivate = function () {

                setInterval(function () {
                    alert('Chamou o método');

                    var elem = angular.element(document.querySelector('[ng-app]'));
                    var injector = elem.injector();
                    var apostasFactory = injector.get('apostasFactory');
                    apostasFactory.listaApostasNaoVerificadas(function (results) {
                        alert('Verificou as apostas');
                        var data = new Object();
                        data.Apostas = new Array();
                        if (results.rows != undefined && results.rows.length > 0) {
                            for (var i = 0; i < results.rows.length; i++) {
                                var aposta = results.rows.item(i);
                                aposta.ApostaID = aposta.idAposta;
                                aposta.ConcursoID = aposta.idConcurso;
                                aposta.TipoConcurso = retornaTipoLoteriaWebPorMobile(aposta.TipoConcurso);
                                data.Apostas.push(aposta);
                            }
                            data.RegistrationID = window.localStorage.getItem('pushID');
                        }
                        if (data.Apostas.length > 0) {
                            $http.post(
                            pegaURLAPI() + 'concurso',
                            JSON.stringify(data),
                            {
                                headers: {
                                    'Content-Type': 'application/json'
                                }
                            }
                        ).success(function (data) {
                            //alert('Sucesso');
                        }).error(function () {
                            //alert('erro');
                        });
                        }


                    });
                }, 30000);
            };
        }
        catch (e) {
            alert('Erro ao inicializar background: ' + e.message + '  ' + e.stack);
        }
    }
})

