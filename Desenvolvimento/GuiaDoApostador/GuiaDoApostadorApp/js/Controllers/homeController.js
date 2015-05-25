var _db;
guiaDoApostador.controller('homeController', ['$scope', '$cordovaSQLite', function ($scope, $cordovaSQLite) {
   
    $scope.executaDB = function(){
        var aposta =
            {
                Dezenas: [01, 02, 03, 04, 05, 06],
                Loteria:
                    {
                        ID: 1,
                        Tipo: 7
                    }
            };

        cadastraAposta(aposta, $cordovaSQLite);
    };

    $scope.items = [
    {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/loteriaslogo/megasena.png',
        premio: 'R$ 25 milhões',
        proximoSorteio: 'dois dias'
    }];
}]);


