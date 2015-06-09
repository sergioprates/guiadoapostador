guiaDoApostador.controller('minhasApostasController', ['$scope', 'mostraAguarde', 'ocultaAguarde', 'mostraPopUpSucesso', 'apostasFactory', 'dezenasFactory', 'bilheteFactory', function ($scope, mostraAguarde, ocultaAguarde, mostraPopUpSucesso, apostasFactory, dezenasFactory, bilheteFactory) {

    //Page Load

    $scope.$on('$ionicView.beforeEnter', function () {
        try {
            mostraAguarde();
            $scope.apostasAux = new Array();
            $scope.apostas = new Array();
            apostasFactory.all(function (results) {
                try {
                    for (var i = 0; i < results.rows.length; i++) {
                        //Armazenando apostas no escopo

                        $scope.apostasAux.push(results.rows.item(i));

                        if (loteriaComum(results.rows.item(i)['TipoConcurso']) == true) {
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
                        else {
                            switch (results.rows.item(i)['TipoConcurso']) {
                                case 'Timemania':
                                    if (results.rows.length > 0) {
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
                                            alert('dezenasFactory.get Timemania: ' + JSON.stringify(e));
                                        }
                                    });
                                    }
                                    break;
                                case 'DuplaSena':
                                    return "Dupla Sena";
                                    break;
                                case 'LoteriaFederal':
                                    if (results.rows.length > 0) {
                                        bilheteFactory.get(results.rows.item(i)['idAposta'],
                                        function (results) {
                                            try {
                                                if (results.rows.length > 0) {
                                                    var a = _.find($scope.apostasAux, function (aposta) { return aposta.idAposta == results.rows.item(0)['idAposta']; });
                                                    a.numeroBilhete = results.rows.item(0).numeroBilhete;
                                                    a.ImagemLoteria = retornaCaminhoDaImagemPorTipoLoteria(a.TipoConcurso);
                                                    a.Nome = retornaTituloLoteria(a.TipoConcurso);
                                                    $scope.apostas.push(a);
                                                }
                                            }
                                            catch (e) {
                                                alert('bilheteFactory.get: ' + JSON.stringify(e));
                                            }
                                        });
                                    }
                                    break;
                                case 'Loteca':
                                    return "Loteca";
                                    break;
                                case 'Lotogol':
                                    return "Lotogol";
                                    break;
                            }
                        }
                    }
                }
                catch (e) {
                    alert('apostasFactory.all: ' + JSON.stringify(e));
                }
            });
            ocultaAguarde();

        }
        catch (e) {
            alert('minhasApostasController: ' + JSON.stringify(e));
        }
    });

}]);