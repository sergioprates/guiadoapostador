guiaDoApostador.controller('sorteioRealizadoController', ['$scope', function ($scope) {

    $scope.$on('$ionicView.enter', function () {
        $scope.concurso = JSON.parse(window.localStorage.getItem('concursoRealizado'));

        $scope.concurso.TipoConcurso = retornaTipoLoteriaMobilePorWeb();

        if (loteriaComum($scope.concurso.TipoConcurso) == true) {
            $scope.loteriaComum = 1;
        }
        else {
            switch ($scope.concurso.TipoConcurso) {
                case 'Timemania':
                    $scope.loteriaTimeMania = 1;
                    $scope.concurso = $scope.carregaParametrosComuns($scope.concurso);
                    break;
                case 'DuplaSena':
                    $scope.loteriaDuplaSena = 1;
                    $scope.concurso = $scope.carregaParametrosComuns($scope.concurso);
                    $scope.concurso.DezenasPrimeiroSorteio = _.filter($scope.concurso.Dezenas, function (dezena) {
                        return dezena.Sorteio == 1;
                    });
                    $scope.concurso.DezenaSegundoSorteio = _.filter($scope.concurso.Dezenas, function (dezena) {
                        return dezena.Sorteio == 2;
                    });
                    break;
                case 'LoteriaFederal':
                    $scope.loteriaFederal = 1;
                    $scope.concurso = $scope.carregaParametrosComuns($scope.concurso);
                    $scope.concurso.Premios = _.sortBy($scope.concurso.Premios, function (e) { return e.Premio; });
                    $scope.concurso.Premios = _.map($scope.concurso.Premios, function (premio) {
                        premio.Bilhete = accounting.formatNumber(premio.Bilhete, 0, ".");
                        premio.ValorPago = accounting.formatMoney(premio.ValorPago).replace('$', 'R$');
                        return premio;
                    });
                    break;

            }
        }
    });



    $scope.carregaParametrosComuns = function (concursoAtual) {
        var data = concursoAtual.Data.replace('T00:00:00', '');
        var dataSplit = data.split('-');
        data = dataSplit[2] + '/' + dataSplit[1] + '/' + dataSplit[0];
        concursoAtual.Data = data;
        $scope.TituloConcurso = 'Concurso ' + concursoAtual.ID + ' - ' + data;

        if (concursoAtual.ProximoConcurso != undefined) {
            if (concursoAtual.ProximoConcurso.Data != null) {
                concursoAtual.ProximoConcurso.Data = concursoAtual.ProximoConcurso.Data.replace('T00:00:00', '');
            }
        }
        concursoAtual.ArrecadacaoTotal = accounting.formatMoney(concursoAtual.ArrecadacaoTotal).replace('$', 'R$');
        concursoAtual.ProximoConcurso.ValorEstimado = accounting.formatMoney(concursoAtual.ProximoConcurso.ValorEstimado).replace('$', 'R$');
        concursoAtual.Premios = _.sortBy(concursoAtual.Premios, function (premio) { return premio.Acertos; }).reverse();
        concursoAtual.Premios = _.map(concursoAtual.Premios, function (premio) {
            premio.ValorPago = accounting.formatMoney(premio.ValorPago).replace('$', 'R$');

            return premio;
        });

        return concursoAtual;
    };
}]);