document.addEventListener("deviceready", onDeviceReady, false);


var guiaDoApostador = angular.module('ionicApp', ['ionic']);

guiaDoApostador.controller('minhasApostasController', ['$scope', function ($scope) {
    //$('[page=true]').load('paginas/minhasApostas.html', function () { });
}]);

function onDeviceReady() {


}




function inicializaAmbiente() {

}

function replaceAll(find, replace, str) {
    return str.replace(new RegExp(find, 'g'), replace);
}

