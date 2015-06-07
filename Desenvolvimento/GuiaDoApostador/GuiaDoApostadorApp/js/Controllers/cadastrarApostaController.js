guiaDoApostador.controller('cadastrarApostaController', ['$scope', 'returnToState', 'mostraAguarde', 'ocultaAguarde', 'mostraPopUpSucesso', 'apostasFactory', 'dezenasFactory', 'mostraMensagemTemporaria', function ($scope, returnToState, mostraAguarde, ocultaAguarde, mostraPopUpSucesso, apostasFactory, dezenasFactory, mostraMensagemTemporaria) {

    //OnLoad
    $scope.$on('$ionicView.beforeEnter', function () {
        $scope.aposta = new Object();
        $scope.aposta.Loteria = new Object();

        $scope.linhas = retornaLinhasPorConcurso(window.localStorage.getItem('tipoLoteriaClicada'));
        $scope.loteria = {
            Nome: retornaTituloLoteria(window.localStorage.getItem('tipoLoteriaClicada')),
            image: retornaCaminhoDaImagemPorTipoLoteria(window.localStorage.getItem('tipoLoteriaClicada')),
            tipo: window.localStorage.getItem('tipoLoteriaClicada')
        };

        ocultaAguarde();
    });
    //Fim OnLoad

    //Métodos de apostas
    $scope.apostar = function () {
        try {
            mostraAguarde();
            switch (window.localStorage.getItem('tipoLoteriaClicada')) {
                case 'MegaSena':
                    $scope.apostarMegaSena();
                    break;
                case 'Timemania':
                    return "Timemania";
                    break;
                case 'Quina':
                    return "Quina";
                    break;
                case 'Lotomania':
                    return "Lotomania";
                    break;
                case 'DuplaSena':
                    return "Dupla Sena";
                    break;
                case 'LoteriaFederal':
                    return "Loteria Federal";
                    break;
                case 'Loteca':
                    return "Loteca";
                    break;
                case 'Lotogol':
                    return "Lotogol";
                    break;
                case 'Lotofacil':
                    return "Lotofácil";
                    break;
            }

            $scope.aposta.TipoLoteria = window.localStorage.getItem('tipoLoteriaClicada');

            if ($scope.aposta.Dezenas.length >= retornaQuantidadeMinimaDezenasPorAposta($scope.aposta.TipoLoteria)) {
                apostasFactory.add($scope.aposta, function (result) {
                    $scope.aposta.ID = result.insertId;
                    for (var i = 0; i < $scope.aposta.Dezenas.length; i++) {
                        dezenasFactory.add($scope.aposta, $scope.aposta.Dezenas[i], function () { });
                    }
                    ocultaAguarde();
                    mostraPopUpSucesso('Aposta realizada!', 'Sua aposta foi realizada com sucesso!', 'minhasApostas');
                });
            }
            else {
                ocultaAguarde();
                mostraMensagemTemporaria('O número mínimo de dezenas para esta loteria é de ' + retornaQuantidadeMinimaDezenasPorAposta($scope.aposta.TipoLoteria) + ' números.', '', '');
            }
        }
        catch (e) {
            alert('Erro ao apostar: ' + JSON.stringfy(e));
        }
    };

    $scope.apostarMegaSena = function () {
        try {


            var linhasCheckBoxes = _.pluck($scope.linhas, 'CheckBoxes');
            window.localStorage.setItem('dezenas', null);

            _.filter(linhasCheckBoxes, function (checkboxes) {
                try {
                    //alert('Entrou no filter dezenas');

                    var checkbox = _.filter(checkboxes, function (checkbox) { return checkbox.Checked == true });
                    var dezenas = JSON.parse(window.localStorage.getItem('dezenas'));

                    if (dezenas == undefined || dezenas == 'null') {
                        dezenas = new Array();
                    }
                    else {
                        dezenas = JSON.parse(window.localStorage.getItem('dezenas'));
                    }

                    for (var i = 0; i < checkbox.length; i++) {
                        dezenas.push(parseInt(checkbox[i].Value));
                    }

                    window.localStorage.setItem('dezenas', JSON.stringify(dezenas));
                }
                catch (e) {
                    alert('Erro no metodo filter de apostar megasena. ' + JSON.stringify(e));
                }
            });

            $scope.aposta.Dezenas = JSON.parse(window.localStorage.getItem('dezenas'));
        }
        catch (e) {
            alert('Erro ao apostarMegaSena: ' + JSON.stringfy(e));
        }
    };


    $scope.validaQuantidadeDezenas = function (check) {
        try {
            //alert('Validando linhas');
            try {
                var linhasCheckBoxes = _.pluck($scope.linhas, 'CheckBoxes');
            }
            catch (e) {
                alert('Algum problema com o underscore: ' + JSON.stringify(e) + JSON.stringify($scope.linhas));
            }
            //alert('Setando localstorage como null dezenas');
            window.localStorage.setItem('dezenas', null);
            //alert('Filtrando dezenas');
            _.filter(linhasCheckBoxes, function (checkboxes) {

                try {
                    //alert('Entrou no filter dezenas');
                    var checkbox = _.filter(checkboxes, function (checkbox) { return checkbox.Checked == true });
                    //alert('pegando dezenas do localstorage');
                    var dezenas = JSON.parse(window.localStorage.getItem('dezenas'));

                    if (dezenas == undefined || dezenas == 'null') {
                        dezenas = new Array();
                    }

                    //alert('Adicionar dezenas ao array.');

                    for (var i = 0; i < checkbox.length; i++) {
                        dezenas.push(parseInt(checkbox[i].Value));
                    }

                    //alert('Adicionar dezenas ao localstorage.');
                    window.localStorage.setItem('dezenas', JSON.stringify(dezenas));
                }
                catch (e) {
                    alert('erro no metodo filter: ' + JSON.stringify(e));
                }
            });

            $scope.aposta.Dezenas = JSON.parse(window.localStorage.getItem('dezenas'));

            if ($scope.aposta.Dezenas.length > retornaQuantidadeMaximaDezenasPorAposta(window.localStorage.getItem('tipoLoteriaClicada'))) {
                check.checkbox.Checked = false;
                try {
                    alert('Mostrando mensagem temporaia');
                    mostraMensagemTemporaria('Nos concursos da ' + window.localStorage.getItem('tipoLoteriaClicada') + ' você só pode selecionar ' + retornaQuantidadeMaximaDezenasPorAposta(window.localStorage.getItem('tipoLoteriaClicada')) + ' dezenas por aposta.', 'short', 'bottom');
                }
                catch (e) {
                    alert('Erro ao mostrar mensagem: ' + JSON.stringfy(e));
                }
            }
        }
        catch (e) {
            alert('Erro ao validar: ' + JSON.stringfy(e));
        }
    };

}]);

function retornaQuantidadeMaximaDezenasPorAposta(tipo) {
    switch (tipo) {
        case 'MegaSena':
            return 15;
            break;
        case 'Timemania':
            return 7;
            break;
        case 'Quina':
            return "Quina";
            break;
        case 'Lotomania':
            return "Lotomania";
            break;
        case 'DuplaSena':
            return "Dupla Sena";
            break;
        case 'LoteriaFederal':
            return "Loteria Federal";
            break;
        case 'Loteca':
            return "Loteca";
            break;
        case 'Lotogol':
            return "Lotogol";
            break;
        case 'Lotofacil':
            return "Lotofácil";
        default:
            break;
    }
}

function retornaQuantidadeMinimaDezenasPorAposta(tipo) {
    switch (tipo) {
        case 'MegaSena':
            return 6;
            break;
        case 'Timemania':
            return "Timemania";
            break;
        case 'Quina':
            return 5;
            break;
        case 'Lotomania':
            return "Lotomania";
            break;
        case 'DuplaSena':
            return "Dupla Sena";
            break;
        case 'LoteriaFederal':
            return "Loteria Federal";
            break;
        case 'Loteca':
            return "Loteca";
            break;
        case 'Lotogol':
            return "Lotogol";
            break;
        case 'Lotofacil':
            return "Lotofácil";
        default:
            break;
    }
}

function retornaQuantidadeIdealPorLinha() {
    return (window.innerWidth * 6) / 320;
}

function retornaQuantidadeNumerosNoFormulario(tipoLoteria) {
    switch (tipoLoteria) {
        case 'MegaSena':
            return 61;
            break;
        case 'Timemania':
            return "Timemania";
            break;
        case 'Quina':
            return 81;
            break;
        case 'Lotomania':
            return "Lotomania";
            break;
        case 'DuplaSena':
            return "Dupla Sena";
            break;
        case 'LoteriaFederal':
            return "Loteria Federal";
            break;
        case 'Loteca':
            return "Loteca";
            break;
        case 'Lotogol':
            return "Lotogol";
            break;
        case 'Lotofacil':
            return "Lotofácil";
            break;
        default:
    }
}

function retornaLinhasPorConcurso(tipo) {
    var quantidadeIdealPorLinha = parseInt(retornaQuantidadeIdealPorLinha());
    var quantidadeNumerosFormulario = retornaQuantidadeNumerosNoFormulario(tipo);
    var quantidadeLinhas = parseInt((quantidadeNumerosFormulario / quantidadeIdealPorLinha));

    var quantidaderenderizada = 1;

    var linhas = new Array();

    for (var i = 0; i < quantidadeLinhas; i++) {

        var linha = new Object();
        linha.CheckBoxes = new Array();
        for (var j = 0; j < quantidadeIdealPorLinha; j++) {
            var checkbox = new Object();
            checkbox.Value = padLeft(quantidaderenderizada, '0', 2);
            checkbox.Checked = false;
            linha.CheckBoxes.push(checkbox);
            quantidaderenderizada++;
        }

        linhas.push(linha);
    }

    if (quantidaderenderizada < quantidadeNumerosFormulario) {
        var quantidadeRestante = quantidadeNumerosFormulario - quantidaderenderizada;
        var linha = new Object();
        linha.CheckBoxes = new Array();
        for (var i = 0; i < quantidadeRestante; i++) {
            var checkbox = new Object();
            checkbox.Value = padLeft(quantidaderenderizada.toString(), '0', 2);
            linha.CheckBoxes.push(checkbox);
            quantidaderenderizada++;
        }
        linhas.push(linha);
    }

    return linhas;
}