guiaDoApostador.controller('cadastrarApostaController', ['$scope', function ($scope) {
   
    $scope.linhas = retornaLinhasPorConcurso('MegaSena');
    $scope.loteria = {
        id: 1, concurso: '1234',
        loteria: 'Mega-Sena',
        image: 'img/loteriaslogo/megasena.png',
        premio: 'R$ 25 milhões',
        tipo: window.localStorage.getItem('tipoLoteriaClicada')
    };

    

    //document.getElementById('dadosAposta').innerHTML = montaFormularioApostaMegaSenaHTML();
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