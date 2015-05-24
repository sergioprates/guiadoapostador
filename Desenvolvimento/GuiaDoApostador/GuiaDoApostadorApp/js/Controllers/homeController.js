var _db;
guiaDoApostador.controller('homeController', ['$scope', '$cordovaSQLite', function ($scope, $cordovaSQLite) {


    $scope.items = [
    {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/loteriaslogo/megasena.png',
        premio: 'R$ 25 milhões',
        proximoSorteio: 'dois dias'
    }];
}]);


