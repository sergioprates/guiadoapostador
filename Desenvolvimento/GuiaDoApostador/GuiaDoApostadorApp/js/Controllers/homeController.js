var _db;
guiaDoApostador.controller('homeController', ['$scope', function ($scope) {
   
    $scope.items = [
    {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/loteriaslogo/megasena.png',
        premio: 'R$ 25 milhões',
        proximoSorteio: 'dois dias'
    }];

    try
    {
        navigator.splashscreen.hide();
    }
    catch(e){

    }
}]);


