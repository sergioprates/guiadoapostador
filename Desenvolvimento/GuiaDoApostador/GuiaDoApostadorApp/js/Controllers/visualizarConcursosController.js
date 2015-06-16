guiaDoApostador.controller('visualizarConcursosController', ['$scope', '$http', 'mostraPopUpErro', 'mostraAguarde', 'ocultaAguarde', function ($scope, $http, mostraPopUpErro, mostraAguarde, ocultaAguarde) {


    $scope.carregaConcurso = function (concursoAtual) {
        if (isNaN(parseInt(concursoAtual.TipoConcurso)) == false) {
            concursoAtual.TipoConcurso = $scope.retornaTipoLoteriaMobilePorWeb(concursoAtual.TipoConcurso);
        }

        if ($scope.loteriaParametrosComuns(concursoAtual.TipoConcurso) == true) {
            $scope.loteriaComum = 1;
            concursoAtual = $scope.carregaParametrosComuns(concursoAtual);
        }
        else {
            switch (concursoAtual.TipoConcurso) {
                case 'Timemania':
                    $scope.loteriaTimeMania = 1;
                    concursoAtual = $scope.carregaParametrosComuns(concursoAtual);
                    break;
                case 'DuplaSena':
                    $scope.loteriaDuplaSena = 1;
                    concursoAtual = $scope.carregaParametrosComuns(concursoAtual);
                    concursoAtual.DezenasPrimeiroSorteio = _.filter(concursoAtual.Dezenas, function (dezena) {
                        return dezena.Sorteio == 1;
                    });
                    concursoAtual.DezenaSegundoSorteio = _.filter(concursoAtual.Dezenas, function (dezena) {
                        return dezena.Sorteio == 2;
                    });
                    break;
                case 'LoteriaFederal':
                    $scope.loteriaFederal = 1;
                    concursoAtual = $scope.carregaParametrosComuns(concursoAtual);
                    concursoAtual.Premios = _.sortBy(concursoAtual.Premios, function (e) { return e.Premio; });
                    concursoAtual.Premios = _.map(concursoAtual.Premios, function (premio) {
                        premio.Bilhete = accounting.formatNumber(premio.Bilhete, 0, ".");
                        premio.ValorPago = accounting.formatMoney(premio.ValorPago).replace('$', 'R$');
                        return premio;
                    });
                    break;
                default:
            }
        }

        return concursoAtual;
    };

    $scope.$on('$ionicView.beforeEnter', function () {
        var concursoAtual = JSON.parse(window.localStorage.getItem('concursoSelecionado'));
        $scope.concurso = $scope.carregaConcurso(concursoAtual);
    });





    $scope.carregaParametrosComuns = function (concursoAtual) {
        var data = concursoAtual.Data.replace('T00:00:00', '');
        var dataSplit = data.split('-');
        data = dataSplit[2] + '/' + dataSplit[1] + '/' + dataSplit[0];
        concursoAtual.Data = data;
        $scope.TituloConcurso = 'Concurso ' + concursoAtual.ID + ' - ' + data;


        $scope.loteria = retornaTituloLoteria(concursoAtual.TipoConcurso);

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

    $scope.consultarAPI = function () {
        if ($scope.consultar == 1) {
            mostraAguarde();
            $http.get(pegaURLAPI() + 'concurso/' + $scope.concurso.TipoConcurso.replace('Loteria','') + '/' + $scope.idConcurso)
                 .success(function (data, status, headers, config) {
                     $scope.concurso = $scope.carregaConcurso(data);
                     ocultaAguarde();
                     $scope.consultar = 0;
                 }).error(function (data, status, headers, config) {
                     $scope.consultar = 0;
                     ocultaAguarde();
                     mostraPopUpErro('Ocorreu um erro ao buscar o concurso no servidor. Erro: ' + JSON.stringify(data));
                 });
        }
        else {
            $scope.consultar = 1;
        }

    };

    $scope.loteriaParametrosComuns = function (tipoConcurso) {
        switch (tipoConcurso) {
            case 'MegaSena':
                return true;
                break;
            case 'Timemania':
                return false;
                break;
            case 'Quina':
                return true;
                break;
            case 'Lotomania':
                return true;
                break;
            case 'DuplaSena':
                return false;
                break;
            case 'LoteriaFederal':
                return false;
                break;
            case 'Loteca':
                return false;
                break;
            case 'Lotogol':
                return false;
                break;
            case 'Lotofacil':
                return true;
            default:
                break;
        }
    };

    $scope.retornaTipoLoteriaMobilePorWeb = function (tipoWEB) {


        switch (tipoWEB) {
            case 1:
                return 'DuplaSena';
                break;
            case 2:
                return 'LoteriaFederal';
                break;
            case 3:
                return "Loteca";
                break;
            case 4:
                return 'Lotofacil'
                break;
            case 5:
                return "Lotogol";
                break;
            case 6:
                return 'Lotomania';
                break;
            case 7:
                return 'MegaSena';
                break;
            case 8:
                return 'Quina';
                break;
            case 9:
                return 'Timemania';
                break;
            default:
                break;
        }

    };
}]);