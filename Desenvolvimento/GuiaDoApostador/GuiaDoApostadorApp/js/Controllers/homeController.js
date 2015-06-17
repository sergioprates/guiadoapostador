﻿guiaDoApostador.controller('homeController', ['$scope', '$http', 'mostraPopUpErro', 'mostraAguarde', 'ocultaAguarde', function ($scope, $http, mostraPopUpErro, mostraAguarde, ocultaAguarde) {


    $scope.consultarServidor = function () {
        var data = {
            Apostas: [{
                ApostaID: 1,
                ConcursoID: 1713,
                TipoConcurso: 7
            }],
            RegistrationID: window.localStorage.getItem('pushID')
        };
        $http.post(
                pegaURLAPI() + 'concurso',
                JSON.stringify(data),
                {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }
            ).success(function (data) {
                alert('Sucesso');
            }).error(function () {
                alert('erro');
            });
    };


    $scope.selecionarLoteria = function (item) {
        window.localStorage.setItem('concursoSelecionado', JSON.stringify(item))
    };

    $scope.$on('$ionicView.enter', function () {
        if (EstaConectado() == true) {
            mostraAguarde();
            $http.get(pegaURLAPI() + 'concurso')
                .success(function (data, status, headers, config) {
                    
                    $scope.concursos = _.map(data, function (concurso) {
                        concurso.ProximoConcurso.ValorEstimado = accounting.formatMoney(concurso.ProximoConcurso.ValorEstimado).replace('$','R$');
                        concurso.TipoConcurso = $scope.retornaTipoLoteriaMobilePorWeb(concurso.TipoConcurso);
                        concurso.image = retornaCaminhoDaImagemPorTipoLoteria(concurso.TipoConcurso);
                        concurso.Nome = retornaTituloLoteria(concurso.TipoConcurso);

                        if (concurso.ProximoConcurso.Data != null) {
                            concurso.ProximoConcurso.Data = concurso.ProximoConcurso.Data.replace('T00:00:00', '');
                            var dataSplit = concurso.ProximoConcurso.Data.split('-');
                            concurso.ProximoConcurso.Data = dataSplit[2] + '/' + dataSplit[1] + '/' + dataSplit[0];
                        }
                        return concurso;
                    });
                    window.localStorage.setItem('concursosRecentes', JSON.stringify($scope.concursos));
                    ocultaAguarde();

                }).error(function (data, status, headers, config) {
                    if (window.localStorage.getItem('concursosRecentes') != undefined && window.localStorage.getItem('concursosRecentes') != null) {

                        $scope.concursos = _.map(JSON.parse(window.localStorage.getItem('concursosRecentes')), function (concurso) {
                            concurso.ProximoConcurso.ValorEstimado = accounting.formatMoney(concurso.ProximoConcurso.ValorEstimado).replace('$', 'R$');
                            concurso.TipoConcurso = $scope.retornaTipoLoteriaMobilePorWeb(concurso.TipoConcurso);
                            concurso.image = retornaCaminhoDaImagemPorTipoLoteria(concurso.TipoConcurso);
                            concurso.Nome = retornaTituloLoteria(concurso.TipoConcurso);

                            if (concurso.ProximoConcurso.Data != null) {
                                concurso.ProximoConcurso.Data = concurso.ProximoConcurso.Data.replace('T00:00:00', '');
                                var dataSplit = concurso.ProximoConcurso.Data.split('-');
                                concurso.ProximoConcurso.Data = dataSplit[2] + '/' + dataSplit[1] + '/' + dataSplit[0];
                            }
                            return concurso;
                        });
                    }
                    else {
                        ocultaAguarde();
                        mostraPopUpErro('Ocorreu um erro ao buscar os concursos no servidor. Erro: ' + JSON.stringify(data));
                    }});
        }
        else {
            if (window.localStorage.getItem('concursosRecentes') != undefined) {
                $scope.concursos = JSON.parse(window.localStorage.getItem('concursosRecentes'));
            }
            else {
                mostraPopUpErro('Não foi possível pegar os dados dos últimos concursos. Verifique sua conexão.');
            }
        }

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
    });



    try {
        navigator.splashscreen.hide();
    }
    catch (e) {

    }
}]);


function EstaConectado() {
    try{
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