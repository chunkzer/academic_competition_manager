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
      .state "home",
        url: "/home",
        templateUrl: "app/views/home.html",
        controller: "HomeCtrl"
        onEnter: ['localStorage', '$state', (localStorage, $state) ->
          userRole = localStorage.get("role_id")
          if !userRole
            $state.transitionTo('login')
          if userRole != "2"
            $state.transitionTo('events')]
      .state "events",
        url: "/events",
        templateUrl: "app/views/events.html",
        controller: "EventsCtrl"
        onEnter: ['localStorage', '$state', (localStorage, $state) ->
          userRole = localStorage.get("role_id")
          if !userRole
            $state.transitionTo('login')
          if userRole != "1"
            $state.transitionTo('home')]
    $urlRouterProvider.otherwise '/login'
