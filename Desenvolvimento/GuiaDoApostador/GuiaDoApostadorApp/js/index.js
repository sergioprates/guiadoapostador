var guiaDoApostador = angular.module('guiadoapostador', ['ionic', 'ngCordova'])
    .run(function ($ionicPlatform, $cordovaPush, PushProcessingService) {
        $ionicPlatform.ready(function () {

            setTimeout(function () {
                try {
                    PushProcessingService.initialize();
                }
                catch (e) {
                    alert('Erro ao inicializar push: ' + JSON.stringify(e));
                }

                try {
                    // Android customization

                    var options = {
                        text: 'O aplicativo Guia do Apostador está executando.',
                        silent: false
                    };
                    window.plugin.backgroundMode.setDefaults(options);
                    // Enable background mode
                    window.plugin.backgroundMode.enable();

                    // Called when background mode has been activated
                    window.plugin.backgroundMode.onactivate = function () {

                        setInterval(function () {
                            apostasFactory.listaApostasNaoVerificadas(function (results) {
                                var data = new Object();
                                data.Apostas = new Array();
                                if (results.rows != undefined && results.rows.length > 0) {
                                    for (var i = 0; i < results.rows.length; i++) {
                                        var aposta = results.rows.item(i);
                                        aposta.ApostaID = aposta.idAposta;
                                        aposta.ConcursoID = aposta.idConcurso;
                                        aposta.TipoConcurso = $scope.retornaTipoLoteriaWebPorMobile(aposta.TipoConcurso);
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
                        }, 60000);

                        
                    };
                }
                catch (e) {
                    //alert('Erro ao inicializar background: ' + e.message + '  ' + e.stack);
                }
            }, 6000);
        })
    });



function replaceAll(find, replace, str) {
    return str.replace(new RegExp(find, 'g'), replace);
}

function padLeft(str, chr, n) {
    var texto = new String(str);
    for (var i = 0; i < n; i++) {
        if (texto.length < n) {
            texto = chr + texto;
        }
        else {
            break;
        }
    }

    return texto.toString();
}

function retornaTipoLoteriaID(Tipo) {
    switch (Tipo) {
        case 'MegaSena':
            return 7;
            break;
        default:

    }
}

function retornaCaminhoDaImagemPorTipoLoteria(Tipo) {
    switch (Tipo) {
        case 'MegaSena':
            return "img/loteriaslogo/megasena.png";
            break;
        case 'Timemania':
            return "img/loteriaslogo/timemania.png";
            break;
        case 'Quina':
            return "img/loteriaslogo/quina.png";
            break;
        case 'Lotomania':
            return "img/loteriaslogo/lotomania.png";
            break;
        case 'DuplaSena':
            return "img/loteriaslogo/duplasena.png";
            break;
        case 'LoteriaFederal':
            return "img/loteriaslogo/federal.png";
            break;
        case 'Loteca':
            return "img/loteriaslogo/loteca.png";
            break;
        case 'Lotogol':
            return "img/loteriaslogo/lotogol.png";
            break;
        case 'Lotofacil':
            return "img/loteriaslogo/lotofacil.png";
            break;
        default:

    }
}

function retornaTituloLoteria(Tipo) {
    switch (Tipo) {
        case 'MegaSena':
            return "Mega Sena";
            break;
        case 'Timemania':
            return "Timemania";
            break;
        case 'Quina':
            return "Quina";
            break;
        case 'Lotomania':
            return "Lotomania";
            break;
        case 'DuplaSena':
            return "Dupla Sena";
            break;
        case 'LoteriaFederal':
            return "Loteria Federal";
            break;
        case 'Loteca':
            return "Loteca";
            break;
        case 'Lotogol':
            return "Lotogol";
            break;
        case 'Lotofacil':
            return "Lotofácil";
            break;
        default:

    }
}

function loteriaComum(tipo) {
    switch (tipo) {
        case 'MegaSena':
            return true;
            break;
        case 'Timemania':
            return false;
            break;
        case 'Quina':
            return true;
            break;
        case 'Lotomania':
            return true;
            break;
        case 'DuplaSena':
            return true;
            break;
        case 'LoteriaFederal':
            return false;
            break;
        case 'Loteca':
            return false;
            break;
        case 'Lotogol':
            return false;
            break;
        case 'Lotofacil':
            return true;
        default:
            break;
    }
}

function pegaURLAPI() {
    return 'http://claudiosajr-001-site1.smarterasp.net/API/';
    //return 'http://localhost:3215/API/';
}



// ALL GCM notifications come through here.
function onNotificationGCM(e) {
    //    alert('EVENT -> RECEIVED:' + e.event + '');
    switch (e.event) {
        case 'registered':
            if (e.regid.length > 0) {
                //alert('REGISTERED with GCM Server -> REGID:' + e.regid);

                //call back to web service in Angular.
                //This works for me because in my code I have a factory called
                //      PushProcessingService with method registerID
                var elem = angular.element(document.querySelector('[ng-app]'));
                var injector = elem.injector();
                var myService = injector.get('PushProcessingService');
                myService.registerID(e.regid);
            }
            break;
        case 'message':
            // if this flag is set, this notification happened while we were in the foreground.
            // you might want to play a sound to get the user's attention, throw up a dialog, etc.
            if (e.foreground) {
                //we're using the app when a message is received.
                alert('--INLINE NOTIFICATION--' + '');

                // if the notification contains a soundname, play it.
                //var my_media = new Media(&quot;/android_asset/www/&quot;+e.soundname);
                //my_media.play();
                alert(e.payload.message);
            }
            else {
                // otherwise we were launched because the user touched a notification in the notification tray.
                if (e.coldstart)
                    alert('--COLDSTART NOTIFICATION--' + '');
                else
                    alert('--BACKGROUND NOTIFICATION--' + '');

                // direct user here:
                // window.location = &quot;#/tab/featured&quot;;
            }



            alert('MESSAGE -> MSG: ' + e.payload.message + '');
            alert('MESSAGE: ' + JSON.stringify(e.payload));
            break;

        case 'error':
            alert('ERROR -> MSG:' + e.msg + '');
            break;

        default:
            alert('EVENT -> Unknown, an event was received and we do not know what it is');
            break;
    }
}