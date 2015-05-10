guiaDoApostador.config(function ($stateProvider, $urlRouterProvider) {
    $stateProvider
    .state('home', {
        url: '/1',
        templateUrl: 'home.html'
    })
    .state('minhasApostas', {
        url: '/2',
        templateUrl: 'paginas/minhasApostas.html',
        controller: "minhasApostasController"
    })

    $urlRouterProvider.otherwise("/1");
})