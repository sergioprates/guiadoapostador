guiaDoApostador.controller('minhasApostasController', ['$scope', 'mostraAguarde', 'ocultaAguarde', 'mostraPopUpSucesso', 'apostasFactory', 'dezenasFactory', function ($scope, mostraAguarde, ocultaAguarde, mostraPopUpSucesso, apostasFactory, dezenasFactory) {

    //Page Load

    $scope.$on('$ionicView.beforeEnter', function () {
        try {
            mostraAguarde();
            $scope.apostasAux = new Array();
            $scope.apostas = new Array();
            apostasFactory.all(function (results) {
                try {
                    alert('Resultados de consulta apostas: ' + JSON.stringify(results.rows));
                    for (var i = 0; i < results.rows.length; i++) {
                        //Armazenando apostas no escopo
                        alert('Pegando item: ' + i);
                        $scope.apostasAux.push(results.rows.item(i));

                        alert('Consultando dezenas: ' + i);
                        alert('Consultando dezenas, idaposta: ' + results.rows.item(i)['idAposta']);
                        //buscando as dezenas de cada aposta
                        dezenasFactory.get(results.rows.item(i)['idAposta'],
                            function (results) {
                                try {
                                    //armazenando as dezenas em cada aposta.
                                    if (results.rows.length > 0) {
                                        var a = _.find($scope.apostasAux, function (aposta) { return aposta.idAposta == results.rows.item(0)['idAposta']; });
                                        a.Dezenas = new Array();
                                        for (var i = 0; i < results.rows.length; i++) {
                                            a.Dezenas.push(results.rows.item(i).dezena);
                                        }
                                        a.ImagemLoteria = retornaCaminhoDaImagemPorTipoLoteria(a.TipoConcurso);
                                        a.Nome = retornaTituloLoteria(a.TipoConcurso);
                                        $scope.apostas.push(a);
                                    }
                                }
                                catch (e) {
                                    alert('dezenasFactory.get: ' + JSON.stringify(e));
                                }
                            });
                    }
                    try
                    {
                        alert('Ordenando');
                        _.sortBy($scope.apostas, 'idConcurso');
                    }
                    catch (e) {
                        alert('Erro ao ordenar: ' + JSON.stringify(e));
                    }
                    ocultaAguarde();
                }
                catch (e) {
                    alert('apostasFactory.all: ' + JSON.stringify(e));
                }
            });


        }
        catch (e) {
            alert('minhasApostasController: ' + JSON.stringify(e));
        }
    });
    
}]);