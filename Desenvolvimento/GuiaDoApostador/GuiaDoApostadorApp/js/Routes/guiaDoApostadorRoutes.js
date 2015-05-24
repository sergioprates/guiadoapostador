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
    .state('selecionarLoteriaParaApostar', {
        url: '/3',
        templateUrl: 'paginas/selecionarLoteriaParaApostar.html',
        controller: "selecionarLoteriaParaApostarController"
    })
    .state('cadastrarAposta', {
        url: '/4',
        templateUrl: 'paginas/cadastrarAposta.html',
        controller: "cadastrarApostaController"
    })

    $urlRouterProvider.otherwise("/1");
})