guiaDoApostador.controller('minhasApostasController', ['$scope','mostraAguarde', 'ocultaAguarde', 'mostraPopUpSucesso', 'apostasFactory', 'dezenasFactory', function ($scope, mostraAguarde, ocultaAguarde, mostraPopUpSucesso, apostasFactory, dezenasFactory) {

    //Page Load
    $scope.$on('$ionicView.beforeEnter', function () {
        mostraAguarde();
        $scope.apostasAux = new Array();
        $scope.apostas = new Array();
        apostasFactory.all(function (results) {

            for (var i = 0; i < results.rows.length; i++) {
                //Armazenando apostas no escopo
                $scope.apostasAux.push(results.rows.item(i));

                //buscando as dezenas de cada aposta
                dezenasFactory.get(results.rows.item(i)['idAposta'],
                    function (results) {
                        //armazenando as dezenas em cada aposta.
                        if (results.rows.length > 0) {
                            var a = _.find($scope.apostasAux, function (aposta) { return aposta.idAposta == results.rows.item(i)['idAposta']; });
                            a.Dezenas = new Array();
                            for (var i = 0; i < results.rows.length; i++) {
                                a.Dezenas.push(results.rows.item(i).dezena);
                            }
                            a.ImagemLoteria = retornaCaminhoDaImagemPorTipoLoteria(a.TipoConcurso);
                            a.Nome = retornaTituloLoteria(a.TipoConcurso);
                            $scope.apostas.push(a);
                        }


                    });
            }

            _.sortBy($scope.apostas, 'idConcurso');
            ocultaAguarde();
        });
    });

    
}]);