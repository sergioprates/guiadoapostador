document.addEventListener("deviceready", onDeviceReady, false);


//variavel da base de dados
var _db = null;
var guiaDoApostador = angular.module('guiadoapostador', ['ionic', 'ngCordova'])
    .run(function ($ionicPlatform, $cordovaSQLite) {
        $ionicPlatform.ready(function () {
            if (window.StatusBar) {
                StatusBar.hide();
            }

        });
    });

function onDeviceReady() {

}

function openDb(cordovaSQLite) {
    var db;
    if (window.cordova) {
        db = cordovaSQLite.openDB("guiadoapostador.db"); //device

    } else {
        db = window.openDatabase("guiadoapostador.db", '1', 'my', 1024 * 1024 * 100); // browser
    }

    cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS apostaMegasena (idAposta integer primary key, idConcurso integer)");
    cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS dezenasApostaMegasena (idAposta integer, dezena integer)");
    return db;
}

function cadastraAposta(aposta, cordovaSQLite) {

    switch (aposta.Loteria.Tipo) {
        case 7:
            cadastraApostaMegaSena(aposta, cordovaSQLite);
            break;
        default:
    }
}

function cadastraApostaMegaSena(aposta, cordovaSQLite) {

    var db = openDb(cordovaSQLite);
    var query = "INSERT INTO apostaMegasena (idConcurso) VALUES (?)";

    cordovaSQLite.execute(db, query, [aposta.Loteria.ID]).then(function (res) {
        console.log("INSERT ID -> " + res.insertId);

        aposta.ID = res.insertId;

        var db = openDb(cordovaSQLite);
        var query = "INSERT INTO dezenasApostaMegasena (idAposta, dezena) VALUES (?,?)";

        for (var i = 0; i < aposta.Dezenas.length; i++) {
            cordovaSQLite.execute(db, query, [aposta.ID, aposta.Dezenas[i]]).then(function (res) {
                console.log("INSERT ID -> " + res.insertId);

            }, function (err) {
                alert('Erro na hora de inserir a dezena da aposta na mega sena: ' + JSON.stringify(err));
                console.error(err);
            });
        }

    }, function (err) {
        alert('Erro na hora de inserir a aposta: ' + JSON.stringify(err));
        console.error(err);
    });
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

function mostraAguarde(ionicLoading) {
    return function () {
        ionicLoading.show({
            template: "<img src='img/aguarde.gif' /> <b>Loading...</b>"
        });
    };
}

function ocultaAguarde(ionicLoading) {
    return function () { ionicLoading.hide(); };
}

function mostraPopUpSucesso(location, ionicPopUp, titulo, texto, pagina) {
    return function () {
        var alertPopup = ionicPopUp.alert({
            title: titulo,
            template: texto
        });
        alertPopup.then(function (res) {
            location.path("/2");
        });
    };
}

function retornaTipoLoteriaID(Tipo) {
    switch (Tipo) {
        case 'MegaSena':
            return 7;
            break;
        default:

    }
}

