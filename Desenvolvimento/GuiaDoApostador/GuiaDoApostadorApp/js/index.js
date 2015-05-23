document.addEventListener("deviceready", onDeviceReady, false);


//variavel da base de dados
var _db = null;
var guiaDoApostador = angular.module('ionicApp', ['ionic', 'ngCordova'])
    .run(function ($ionicPlatform, $cordovaSQLite) {
    $ionicPlatform.ready(function () {
        //if (window.cordova && window.cordova.plugins.Keyboard) {
         //   cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
       // }
        if (window.StatusBar) {
            StatusBar.styleDefault();
        }

        if (window.cordova) {
            alert('Abrindo o banco de dados');
            _db = $cordovaSQLite.openDB("my.db"); //device

        } else {
            _db = window.openDatabase("my.db", '1', 'my', 1024 * 1024 * 100); // browser
        }

        alert('Banco aberto, criando tabela');
        $cordovaSQLite.execute(_db, "CREATE TABLE IF NOT EXISTS people (id integer primary key, firstname text, lastname text)");


        var query = "INSERT INTO people (firstname, lastname) VALUES (?,?)";
        alert('Tabela criada inserindo registro');
        $cordovaSQLite.execute(_db, query, ['sergio', 'teste']).then(function (res) {
            console.log("INSERT ID -> " + res.insertId);
            alert('idInserido: ' + res.insertId);
        }, function (err) {
            alert('Erro na hora de inserir: ' + JSON.stringify(err));
            console.error(err);
        });

        window.localStorage.setItem('db', JSON.stringify(_db));
        navigator.splashscreen.hide();

        //$cordovaSQLite.execute(db, "CREATE TABLE IF NOT EXISTS people (id integer primary key, firstname text, lastname text)");

     });
});

guiaDoApostador.controller('minhasApostasController', ['$scope', function ($scope) {
    //$('[page=true]').load('paginas/minhasApostas.html', function () { });
}]);

function onDeviceReady() {
    alert('OnDeVicveready');
    navigator.splashscreen.show();

}




function inicializaAmbiente() {

}

function replaceAll(find, replace, str) {
    return str.replace(new RegExp(find, 'g'), replace);
}

