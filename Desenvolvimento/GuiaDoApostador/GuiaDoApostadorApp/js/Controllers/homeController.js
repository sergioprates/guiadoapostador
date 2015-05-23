var _db;
guiaDoApostador.controller('homeController', ['$scope', '$cordovaSQLite', function ($scope, $cordovaSQLite) {

    $scope.executaDB = function () {
        var query = "INSERT INTO test_table (data, data_num) VALUES (?,?)";

        _db = JSON.parse(window.localStorage.getItem('db'));

       
    };

    $scope.items = [
    {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/megasena.png',
        premio: 'R$ 25 milhões',
        proximoSorteio: 'dois dias'
    }];
}]);


