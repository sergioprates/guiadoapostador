﻿guiaDoApostador.controller('cadastrarApostaController', ['$scope', 'returnToState', 'mostraAguarde', 'ocultaAguarde', 'mostraPopUpSucesso', 'apostasFactory', 'dezenasFactory', 'mostraMensagemTemporaria', function ($scope, returnToState, mostraAguarde, ocultaAguarde, mostraPopUpSucesso, apostasFactory, dezenasFactory, mostraMensagemTemporaria) {

    //OnLoad
    $scope.$on('$ionicView.beforeEnter', function () {
        $scope.aposta = new Object();
        $scope.aposta.Loteria = new Object();

        $scope.linhas = retornaLinhasPorConcurso('MegaSena');
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
        mostraAguarde();
        switch (window.localStorage.getItem('tipoLoteriaClicada'))
        {
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

        apostasFactory.add($scope.aposta, function (result) {
            $scope.aposta.ID = result.insertId;
            for (var i = 0; i < $scope.aposta.Dezenas.length; i++) {
                dezenasFactory.add($scope.aposta, $scope.aposta.Dezenas[i], function () { });
            }
            ocultaAguarde();
            mostraPopUpSucesso('Aposta realizada!', 'Sua aposta foi realizada com sucesso!', 'minhasApostas');
        });
    };

    $scope.apostarMegaSena = function () {
        var linhasCheckBoxes = _.pluck($scope.linhas, 'CheckBoxes');
        window.localStorage.setItem('dezenas', null);

        _.filter(linhasCheckBoxes, function (checkboxes) {
            var checkbox = _.filter(checkboxes, function (checkbox) { return checkbox.Checked == true });
            var dezenas = JSON.parse(window.localStorage.getItem('dezenas'));

            if (dezenas == undefined) {
                dezenas = new Array();
            }

            for (var i = 0; i < checkbox.length; i++) {
                dezenas.push(parseInt(checkbox[i].Value));
            }

            window.localStorage.setItem('dezenas', JSON.stringify(dezenas));
        });

        $scope.aposta.Dezenas = JSON.parse(window.localStorage.getItem('dezenas'));
        $scope.aposta.TipoLoteria = window.localStorage.getItem('tipoLoteriaClicada');
    };


    $scope.validaQuantidadeDezenas = function (check) {
        var linhasCheckBoxes = _.pluck($scope.linhas, 'CheckBoxes');
        window.localStorage.setItem('dezenas', null);

        _.filter(linhasCheckBoxes, function (checkboxes) {
            var checkbox = _.filter(checkboxes, function (checkbox) { return checkbox.Checked == true });
            var dezenas = JSON.parse(window.localStorage.getItem('dezenas'));

            if (dezenas == undefined) {
                dezenas = new Array();
            }

            for (var i = 0; i < checkbox.length; i++) {
                dezenas.push(parseInt(checkbox[i].Value));
            }

            window.localStorage.setItem('dezenas', JSON.stringify(dezenas));
        });

        $scope.aposta.Dezenas = JSON.parse(window.localStorage.getItem('dezenas'));

        if ($scope.aposta.Dezenas.length > retornaQuantidadeDezenasPorAposta(window.localStorage.getItem('tipoLoteriaClicada'))) {
            check.checkbox.Checked = false;
            try{
                mostraMensagemTemporaria('Nos concursos da ' + window.localStorage.getItem('tipoLoteriaClicada') + ' você só pode selecionar ' + retornaQuantidadeDezenasPorAposta(window.localStorage.getItem('tipoLoteriaClicada')) + ' dezenas por aposta.', 'short', 'bottom');
            }
            catch (e) {

            }
        }
    };

}]);

function retornaQuantidadeDezenasPorAposta(tipo){
    switch(tipo)
    {
        case 'MegaSena':
            return 15;
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
        default:
    }
}

function retornaLinhasPorConcurso() {
    var quantidadeIdealPorLinha = parseInt(retornaQuantidadeIdealPorLinha());
    var quantidadeNumerosFormulario = retornaQuantidadeNumerosNoFormulario('MegaSena');
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