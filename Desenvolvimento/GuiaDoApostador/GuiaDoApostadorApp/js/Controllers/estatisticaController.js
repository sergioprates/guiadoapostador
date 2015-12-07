guiaDoApostador.controller('estatisticaController', ['$scope', '$http', 'mostraPopUpErro', 'mostraAguarde', 'ocultaAguarde', function ($scope, $http, mostraPopUpErro, mostraAguarde, ocultaAguarde) {
    
    $scope.selecionarLoteria = function (item) {
        window.localStorage.setItem('concursoSelecionado', JSON.stringify(item))
    };

    $scope.$on('$ionicView.enter', function () {
        if (EstaConectado() == true) {
            mostraAguarde();
            try {
                var concursoAtual = JSON.parse(window.localStorage.getItem('concursoSelecionado'));
                $scope.loteria = retornaTituloLoteria(concursoAtual.TipoConcurso);
                
                $http.get(pegaURLAPI() + 'Estatistica/' + 'PalpiteProximoSorteio/' + concursoAtual.TipoConcurso.replace('Loteria',''))
                    .success(function (data, status, headers, config) {

                        $scope.palpite = _.map(data, function (palpite) {
                                                       
                            palpite = palpite;
                            
                            return palpite;
                        });
                    
                        window.localStorage.setItem('palpite', JSON.stringify($scope.palpite));

                    }).error(function (data, status, headers, config) {
                        if (window.localStorage.getItem('estatistica') != undefined && window.localStorage.getItem('estatistica') != null) {
                            $scope.concursos = JSON.parse(window.localStorage.getItem('estatistica'));
                            ocultaAguarde();
                        }
                        else {
                            ocultaAguarde();
                            mostraPopUpErro('Ocorreu um erro ao buscar o nosso palpite no servidor. Erro: ' + JSON.stringify(data));
                        }
                    });
                
                $http.get(pegaURLAPI() + 'Estatistica/' + 'NumerosQueMenosSairam/' + concursoAtual.TipoConcurso.replace('Loteria',''))
                    .success(function (data, status, headers, config) {

                        $scope.menos = _.map(data, function (menos) {
                                                       
                            menos.Key = menos.Key;
                            menos.Value = menos.Value;
                            
                            return menos;
                        });
                    
                        window.localStorage.setItem('menos', JSON.stringify($scope.menos));

                    }).error(function (data, status, headers, config) {
                        if (window.localStorage.getItem('estatistica') != undefined && window.localStorage.getItem('estatistica') != null) {
                            $scope.concursos = JSON.parse(window.localStorage.getItem('estatistica'));
                            ocultaAguarde();
                        }
                        else {
                            ocultaAguarde();
                            mostraPopUpErro('Ocorreu um erro ao buscar os números que menos saíram no servidor. Erro: ' + JSON.stringify(data));
                        }
                    });
                
                $http.get(pegaURLAPI() + 'Estatistica/' + 'NumerosQueMaisSairam/' + concursoAtual.TipoConcurso.replace('Loteria',''))
                    .success(function (data, status, headers, config) {

                        $scope.mais = _.map(data, function (mais) {
                                                       
                            mais.Key = mais.Key;
                            mais.Value = mais.Value;
                            
                            return mais;
                        });
                    
                        window.localStorage.setItem('mais', JSON.stringify($scope.mais));                        

                    }).error(function (data, status, headers, config) {
                        if (window.localStorage.getItem('estatistica') != undefined && window.localStorage.getItem('estatistica') != null) {
                            $scope.concursos = JSON.parse(window.localStorage.getItem('estatistica'));
                            ocultaAguarde();
                        }
                        else {
                            ocultaAguarde();
                            mostraPopUpErro('Ocorreu um erro ao buscar os números que mais saíram no servidor. Erro: ' + JSON.stringify(data));
                        }
                    });
                
                ocultaAguarde();
            }
            catch (e) {
                ocultaAguarde();
                console.log(e.message + ' / ' + e.stack);
            }
        }
        else {
            mostraPopUpErro('Não foi possível pegar os dados dos últimos concursos. Verifique sua conexão.');            
        }
    });



    try {
        navigator.splashscreen.hide();
    }
    catch (e) {

    }
     
    $scope.toggleGroup = function(group) {
        if ($scope.isGroupShown(group)) {
          $scope.shownGroup = null;
        } else {
          $scope.shownGroup = group;
        }
    };
     
    $scope.isGroupShown = function(group) {
        return $scope.shownGroup === group;
    };
}]);


function EstaConectado() {
    try {
        var networkState = navigator.connection.type;

        var states = {};
        states[Connection.UNKNOWN] = 'Unknown connection';
        states[Connection.ETHERNET] = 'Ethernet connection';
        states[Connection.WIFI] = 'WiFi connection';
        states[Connection.CELL_2G] = 'Cell 2G connection';
        states[Connection.CELL_3G] = 'Cell 3G connection';
        states[Connection.CELL_4G] = 'Cell 4G connection';
        states[Connection.NONE] = 'No network connection';

        return !(states[networkState] === 'No network connection');
    }
    catch (e) {
        return true;
    }
}

function retornaTipoLoteriaMobilePorWeb(tipoWEB) {


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

function retornaTipoLoteriaWebPorMobile(tipoMobile) {


    switch (tipoMobile) {
        case 'DuplaSena':
            return 1;
            break;
        case 'LoteriaFederal':
            return 2;
            break;
        case "Loteca":
            return 3;
            break;
        case 'Lotofacil':
            return 4;
            break;
        case "Lotogol":
            return 5;
            break;
        case 'Lotomania':
            return 6;
            break;
        case 'MegaSena':
            return 7;
            break;
        case 'Quina':
            return 8;
            break;
        case 'Timemania':
            return 9;
            break;
        default:
            break;
    }

};