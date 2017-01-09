angular.module 'servicio'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'login',
        url: '/login'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'
        onEnter: ['localStorage', '$state', (localStorage, $state) ->
          if localStorage.get("signedIn")
            $state.transitionTo('home')]
