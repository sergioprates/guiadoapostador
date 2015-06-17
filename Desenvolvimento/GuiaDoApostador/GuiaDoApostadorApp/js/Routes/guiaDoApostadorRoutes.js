guiaDoApostador.config(function ($stateProvider, $urlRouterProvider) {
    $stateProvider
    .state('home', {
        url: '/1',
        templateUrl: 'home.html'
    })
    .state('minhasApostas', {
        url: '/2',
        templateUrl: 'paginas/minhasApostas.html'
    })
    .state('selecionarLoteriaParaApostar', {
        url: '/3',
        templateUrl: 'paginas/selecionarLoteriaParaApostar.html'
    })
    .state('cadastrarAposta', {
        url: '/4',
        templateUrl: 'paginas/cadastrarAposta.html'
    })
    .state('visualizarConcursos', {
        url: '/5',
        templateUrl: 'paginas/visualizarConcursos.html'
    })
    .state('sorteioRealizado', {
        url: '/6',
        templateUrl: 'paginas/sorteioRealizado.html'
    })

    

    $urlRouterProvider.otherwise("/1");
}).config(function ($httpProvider) {
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
});