guiaDoApostador.controller('homeController', ['$scope', '$http', 'mostraPopUpErro', 'mostraAguarde', 'ocultaAguarde', 'apostasFactory', function ($scope, $http, mostraPopUpErro, mostraAguarde, ocultaAguarde, apostasFactory) {
    
    $scope.selecionarLoteria = function (item) {
        window.localStorage.setItem('concursoSelecionado', JSON.stringify(item))
    };

    $scope.$on('$ionicView.enter', function () {
        if (EstaConectado() == true) {
            mostraAguarde();
            try {
                $http.get(pegaURLAPI() + 'concurso')
                    .success(function (data, status, headers, config) {

                        $scope.concursos = _.map(data, function (concurso) {
                            concurso.ProximoConcurso.ValorEstimado = accounting.formatMoney(concurso.ProximoConcurso.ValorEstimado).replace('$', 'R$');
                            concurso.TipoConcurso = retornaTipoLoteriaMobilePorWeb(concurso.TipoConcurso);
                            concurso.image = retornaCaminhoDaImagemPorTipoLoteria(concurso.TipoConcurso);
                            concurso.Nome = retornaTituloLoteria(concurso.TipoConcurso);

                            if (concurso.ProximoConcurso.Data != null) {
                                concurso.ProximoConcurso.Data = concurso.ProximoConcurso.Data.replace('T00:00:00', '');
                                var dataSplit = concurso.ProximoConcurso.Data.split('-');
                                concurso.ProximoConcurso.Data = dataSplit[2] + '/' + dataSplit[1] + '/' + dataSplit[0];

                                if (concurso.ProximoConcurso.Data.indexOf('undefined/') > 0) {
                                    concurso.ProximoConcurso.Data = concurso.ProximoConcurso.Data.replace('undefined/', '').replace('undefined/', '');
                                }
                            }
                            return concurso;
                        });
                        window.localStorage.setItem('concursosRecentes', JSON.stringify($scope.concursos));
                        ocultaAguarde();

                    }).error(function (data, status, headers, config) {
                        if (window.localStorage.getItem('concursosRecentes') != undefined && window.localStorage.getItem('concursosRecentes') != null) {
                            $scope.concursos = JSON.parse(window.localStorage.getItem('concursosRecentes'));
                            ocultaAguarde();
                        }
                        else {
                            ocultaAguarde();
                            mostraPopUpErro('Ocorreu um erro ao buscar os concursos no servidor. Erro: ' + JSON.stringify(data));
                        }
                    });
            }
            catch (e) {
                ocultaAguarde();
                console.log(e.message + ' / ' + e.stack);
            }
        }
        else {
            if (window.localStorage.getItem('concursosRecentes') != undefined) {
                $scope.concursos = JSON.parse(window.localStorage.getItem('concursosRecentes'));
            }
            else {
                mostraPopUpErro('Não foi possível pegar os dados dos últimos concursos. Verifique sua conexão.');
            }
        }

        
    });



    try {
        navigator.splashscreen.hide();
    }
    catch (e) {

    }
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