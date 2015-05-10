guiaDoApostador.controller('homeController', ['$scope', function ($scope) {
    //$('[page=true]').load('paginas/minhasApostas.html', function () { });

    $scope.items = [
    {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/megasena.png',
        premio: 'R$ 25 milhões', 
        proximoSorteio: 'dois dias'}];
} ]);


