document.addEventListener("deviceready", onDeviceReady, false);


//variavel da base de dados
var _db = null;
var guiaDoApostador = angular.module('guiadoapostador', ['ionic', 'ngCordova'])
    .run(function ($ionicPlatform, $cordovaSQLite) {
        $ionicPlatform.ready(function () {
            if (window.cordova && window.cordova.plugins.Keyboard) {
                cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
            }
            if (window.StatusBar) {
                StatusBar.hide();
            }

        });
    });

function onDeviceReady() {

}

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

