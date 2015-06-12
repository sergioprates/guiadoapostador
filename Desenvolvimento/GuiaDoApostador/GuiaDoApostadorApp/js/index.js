var guiaDoApostador = angular.module('guiadoapostador', ['ionic', 'ngCordova'])
    .run(function ($ionicPlatform, $cordovaPush) {

        $ionicPlatform.ready(function () {

            registraPush();

            // WARNING: dangerous to unregister (results in loss of tokenID)
            //    $cordovaPush.unregister(options).then(function (result) {
            //        // Success!
            //    }, function (err) {
            //        // Error
            //    })

            //}, false);

        });
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
            return "img/loteriaslogo/lotoFacil.png";
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

function registraPush() {
    try{
        var pushNotification = window.plugins.pushNotification;
        if (pushNotification != undefined) {
            pushNotification.register(function (result) { }, function (result) { }, { "senderID": "497093213372", "ecb": "onNotificationGCM" });
        }
    }
    catch (e) {
        alert('Erro ao registrar: ' + JSON.stringify(e) + JSON.stringify(window.plugins));
    }
}


function onNotificationGCM(e) {
    switch (e.event) {
        case 'registered':
            {
                if (e.regid.length > 0) {
                    alert(e.regid);
                    document.getElementById('item').value = e.regid;
                }
                break;
            }
        case 'message':
            {
                if (e.foreground) {
                    if (e.payload.alerta != undefined) {
                        navigator.notification.alert(
                            e.payload.alerta.Corpo,
                            function () { },
                            'Mensagem de Incentivo',
                            'Ok'
                        );
                    }
                    else if (e.payload.lembrete != undefined) {
                        navigator.notification.alert(
                            e.message,
                            function () { },
                            'Lembrete',
                            'Ok'
                        );
                    }
                }
                else {
                    if (e.payload.alerta != undefined) {
                        mostraPopupAguarde();
                        var mensagensIncentivo = new Array();
                        mensagensIncentivo.push(e.payload.alerta);

                        window.localStorage.setItem('mensagensIncentivo', JSON.stringify(mensagensIncentivo));

                        carregaMensagemIncentivo(e.payload.alerta.ID);
                        ocultaPopupAguarde();
                    }
                    else if (e.payload.lembrete != undefined) {
                        navigator.notification.alert(
                            e.message,
                            function () { },
                            'Lembrete',
                            'Ok'
                        );
                    }
                }
                break;
            }
        case 'error':
            {
                //alert('GCM error = '+e.msg);
                break;
            }
        default:
            {
                //alert('An unknown GCM event has occurred');
                break;
            }
    }
}