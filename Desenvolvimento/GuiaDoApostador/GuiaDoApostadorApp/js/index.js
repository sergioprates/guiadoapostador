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
        default:

    }
}

function retornaTituloLoteria(Tipo) {
    switch (Tipo) {
        case 'MegaSena':
            return "Mega Sena";
            break;
        default:

    }
}

