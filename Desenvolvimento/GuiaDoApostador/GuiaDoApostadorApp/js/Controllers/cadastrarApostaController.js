guiaDoApostador.controller('cadastrarApostaController', ['$scope', '$ionicLoading', '$cordovaSQLite', '$ionicPopup', '$location', function ($scope, $ionicLoading, $cordovaSQLite, $ionicPopup, $location) {

    //OnLoad
    $scope.mostraAguarde = mostraAguarde($ionicLoading);
    $scope.ocultaAguarde = ocultaAguarde($ionicLoading);
    $scope.mostraAguarde();

    $scope.aposta = new Object();
    $scope.aposta.Loteria = new Object();

    $scope.linhas = retornaLinhasPorConcurso('MegaSena');
    $scope.loteria = {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/loteriaslogo/megasena.png',
        premio: 'R$ 25 milhões',
        tipo: window.localStorage.getItem('tipoLoteriaClicada')
    };

    $scope.ocultaAguarde();
    //Fim OnLoad

    $scope.apostar = function () {
        $scope.mostraAguarde();
        switch (window.localStorage.getItem('tipoLoteriaClicada'))
        {
            case 'MegaSena':
                $scope.apostarMegaSena();
                break;
        }
        cadastraAposta($scope.aposta, $cordovaSQLite);
        $scope.ocultaAguarde();

        $scope.mostraPopUpSucesso = mostraPopUpSucesso($location,$ionicPopup, 'Aposta realizada!', 'Sua aposta foi realizada com sucesso!', 'minhasApostas');
        $scope.mostraPopUpSucesso();
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
        $scope.aposta.Loteria.Tipo = retornaTipoLoteriaID(window.localStorage.getItem('tipoLoteriaClicada'));
    };

}]);

function retornaQuantidadeIdealPorLinha() {
    return (window.innerWidth * 6) / 320;
}

function retornaQuantidadeNumerosNoFormulario(tipoLoteria) {
    switch (tipoLoteria) {
        case 'MegaSena':
            return 61;
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