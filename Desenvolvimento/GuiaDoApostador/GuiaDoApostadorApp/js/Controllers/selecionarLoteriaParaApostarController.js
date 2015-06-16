guiaDoApostador.controller('selecionarLoteriaParaApostarController', ['$scope', function ($scope) {

    $scope.setaTipoLoteria = function(tipo){
        window.localStorage.setItem("tipoLoteriaClicada",tipo);
    };

    $scope.items = [
    {
        loteria: 'Mega Sena',
        image: retornaCaminhoDaImagemPorTipoLoteria('MegaSena'),
        tipo: 'MegaSena'
    },
    {
        loteria: 'Quina',
        image: retornaCaminhoDaImagemPorTipoLoteria('Quina'),
        tipo: 'Quina'
    },
    {
        loteria: 'Timemania',
        image: retornaCaminhoDaImagemPorTipoLoteria('Timemania'),
        tipo: 'Timemania'
    },
    {
        loteria: 'Lotomania',
        image: retornaCaminhoDaImagemPorTipoLoteria('Lotomania'),
        tipo: 'Lotomania'
    },
    {
        loteria: 'Dupla Sena',
        image: retornaCaminhoDaImagemPorTipoLoteria('DuplaSena'),
        tipo: 'DuplaSena'
    },
    {
        loteria: 'Loteria Federal',
        image: retornaCaminhoDaImagemPorTipoLoteria('LoteriaFederal'),
        tipo: 'LoteriaFederal'
    },
    {
        loteria: 'Lotofácil',
        image: retornaCaminhoDaImagemPorTipoLoteria('Lotofacil'),
        tipo: 'Lotofacil'
    }
    //,
    //{
    //    loteria: 'Loteca',
    //    image: retornaCaminhoDaImagemPorTipoLoteria('Loteca'),
    //    tipo: 'Loteca'
    //},
    //{
    //    loteria: 'Lotogol',
    //    image: retornaCaminhoDaImagemPorTipoLoteria('Lotogol'),
    //    tipo: 'Lotogol'
    //}
    ];
}]);