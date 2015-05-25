guiaDoApostador.controller('selecionarLoteriaParaApostarController', ['$scope', '$ionicLoading', function ($scope, $ionicLoading) {

    $scope.setaTipoLoteria = function(tipo){
        window.localStorage.setItem("tipoLoteriaClicada",tipo);
    };

    $scope.items = [
    {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/loteriaslogo/megasena.png',
        premio: 'R$ 25 milhões',
        proximoSorteio: 'dois dias',
        tipo: 'MegaSena'
    },
    {
        id: 2, concurso: '1244',
        loteria: 'Quina',
        image: 'img/loteriaslogo/quina.png',
        premio: 'R$ 25 milhões',
        proximoSorteio: 'cinco dias',
        tipo: 'Quina'
    }];
}]);