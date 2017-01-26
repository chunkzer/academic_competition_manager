angular.module 'servicio'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'login',
        url: '/login'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'
        onEnter: ['localStorage', '$state', '$timeout',(localStorage, $state, $timeout) ->
          $timeout ->
            if localStorage.get("signedIn")
              $state.transitionTo('home')
          , 100]

      .state "home",
        url: "/home",
        templateUrl: "app/views/home.html",
        controller: "HomeCtrl"
        onEnter: ['localStorage', '$state', '$timeout',(localStorage, $state, $timeout) ->
          $timeout ->
            userRole = localStorage.get("role_id")
            if !userRole
              $state.transitionTo('login')
            if userRole != "super_admin"
              $state.transitionTo('events')
          , 100]


      .state "events",
        url: "/events",
        templateUrl: "app/views/events.html",
        controller: "EventsCtrl"
        onEnter: ['localStorage', '$state', '$timeout',(localStorage, $state, $timeout) ->
          $timeout ->
            if !localStorage.get("signedIn")
              $state.transitionTo('login')
          , 100]

      .state "config",
        url: "/config",
        templateUrl: "app/views/config.html",
        controller: "ConfigCtrl"
        onEnter: ['localStorage', '$state', '$timeout',(localStorage, $state, $timeout) ->
          $timeout ->
            if !localStorage.get("signedIn")
              $state.transitionTo('login')
          ,100]

    $urlRouterProvider.otherwise '/login'
