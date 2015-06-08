guiaDoApostador.controller('cadastrarApostaController', ['$scope', 'returnToState', 'mostraAguarde', 'ocultaAguarde', 'mostraPopUpSucesso', 'apostasFactory', 'dezenasFactory', 'mostraMensagemTemporaria', 'bilheteFactory', function ($scope, returnToState, mostraAguarde, ocultaAguarde, mostraPopUpSucesso, apostasFactory, dezenasFactory, mostraMensagemTemporaria, bilheteFactory) {

    //OnLoad
    $scope.$on('$ionicView.beforeEnter', function () {
        $scope.loteria = {
            Nome: retornaTituloLoteria(window.localStorage.getItem('tipoLoteriaClicada')),
            image: retornaCaminhoDaImagemPorTipoLoteria(window.localStorage.getItem('tipoLoteriaClicada')),
            tipo: window.localStorage.getItem('tipoLoteriaClicada')
        };
        $scope.aposta = new Object();
        $scope.aposta.Loteria = new Object();
        $scope.linhas = new Array();
        if (loteriaComum($scope.loteria.tipo) == true) {
            $scope.loteriaComum = 1;
            $scope.linhas = retornaLinhasPorConcurso(window.localStorage.getItem('tipoLoteriaClicada'));
        }
        else {
            if ($scope.loteria.tipo == 'LoteriaFederal') {
                $scope.loteriaFederal = 1;
            }
        }
        
        

        ocultaAguarde();
    });
    //Fim OnLoad

    //Métodos de apostas
    $scope.apostar = function () {
        try {     
            if ($scope.aposta.Loteria.ID == undefined || $scope.aposta.Loteria.ID == "") {
                mostraMensagemTemporaria('Informe qual o número do concurso.', '', '');
                return false;
            }

            mostraAguarde();
            switch (window.localStorage.getItem('tipoLoteriaClicada')) {
                case 'MegaSena':
                    $scope.mapearApostaComum();
                    break;
                case 'Timemania':
                    return "Timemania";
                    break;
                case 'Quina':
                    $scope.mapearApostaComum();
                    break;
                case 'Lotomania':
                    $scope.mapearApostaComum();
                    break;
                case 'DuplaSena':
                    return "Dupla Sena";
                    break;
                case 'Loteca':
                    return "Loteca";
                    break;
                case 'Lotogol':
                    return "Lotogol";
                    break;
                case 'Lotofacil':
                    $scope.mapearApostaComum();
                    break;
            }

            $scope.aposta.TipoLoteria = window.localStorage.getItem('tipoLoteriaClicada');
            
            if (loteriaComum($scope.loteria.tipo) == true) {
                //Loterias com dezenas
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
            else {
                switch ($scope.loteria.tipo) {
                    case 'Timemania':
                        return "Timemania";
                        break;
                    case 'DuplaSena':
                        return "Dupla Sena";
                        break;
                    case 'LoteriaFederal':
                        if ($scope.aposta.numeroBilhete != '' && $scope.aposta.numeroBilhete != undefined) {
                            apostasFactory.add($scope.aposta, function (result) {
                                $scope.aposta.ID = result.insertId;
                                //Inserindo número do bilhete
                                bilheteFactory.add($scope.aposta, $scope.aposta.numeroBilhete, function (result) {
                                    ocultaAguarde();
                                    mostraPopUpSucesso('Aposta realizada!', 'Sua aposta foi realizada com sucesso!', 'minhasApostas');
                                });
                            });
                        }
                        else {
                            ocultaAguarde();
                            mostraMensagemTemporaria('Preencha o número do bilhete.', '', '');
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
        catch (e) {
            alert('Erro ao apostar: ' + JSON.stringfy(e));
        }
    };


    $scope.mapearApostaComum = function () {
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

    //Fim métodos de apostas.


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
            return 'Timemania';
            break;
        case 'Quina':
            return 7;
            break;
        case 'Lotomania':
            return 50;
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
            return 18;
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
            return 50;
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
            return 15;
        default:
            break;
    }
}

function retornaQuantidadeIdealPorLinha() {
    return (window.innerWidth * 6) / 320;
}



function retornaQuantidadeNumerosNoFormulario(tipoLoteria) {
    var i = 0;
    switch (tipoLoteria) {
        case 'MegaSena':
            i= 60;
            break;
        case 'Timemania':
            return "Timemania";
            break;
        case 'Quina':
            i = 80;
            break;
        case 'Lotomania':
            i= 100;
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
            i = 25;
            break;
        default:
            break;
    }

    return i + 1;
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

            if (checkbox.Value == '100') {
                checkbox.Value = '00';
            }

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
            if (checkbox.Value == '100') {
                checkbox.Value = '00';
            }
            linha.CheckBoxes.push(checkbox);
            quantidaderenderizada++;
        }
        linhas.push(linha);
    }

    return linhas;
}