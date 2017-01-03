angular.module 'servicio', ['ngAnimate',
                            'ngCookies',
                            'ngTouch',
                            'ngSanitize',
                            'ngMessages',
                            'ngAria',
                            'ngResource',
                            'ui.router',
                            'ui.bootstrap',
                            'toastr',
                            'rails']
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "home",
        url: "/home",
        templateUrl: "app/views/home.html",
        controller: "HomeCtrl"
        onEnter: ['localStorage', '$state', (localStorage, $state) ->
          userRole = localStorage.get("role_id")
          if !userRole
            # $state.transitionTo('login')
            x = 1
            console.log("trans to login")
          if userRole != "2"
            # $state.transitionTo('events')]
            x = 2
            console.log("trans to events")]
      .state "events",
        url: "/events",
        templateUrl: "app/views/events.html",
        controller: "EventsCtrl"
        onEnter: ['localStorage', '$state', (localStorage, $state) ->
          userRole = localStorage.get("role_id")
          if !userRole
            # $state.transitionTo('login')
            x = 2
            console.log("trans to login")
          if userRole != "2"
            # $state.transitionTo('events')]
            x = 2
            console.log("trans to events")]
    $urlRouterProvider.otherwise '/login'

  .factory "User", (RailsResource) ->
    class User extends RailsResource
      @configure url: "/api/users", name: "user"

  .factory "Event", (RailsResource) ->
    class Event extends RailsResource
      @configure url: "/api/events", name: "event"

  .factory "Document", (RailsResource) ->
    class Document extends RailsResource
      @configure url: "/api/documents", name: "document"

  .factory "PendingSubscription", (RailsResource) ->
    class PendingSubscription extends RailsResource
      @configure url: "/api/event_subscriptions/pending_subscriptions", name: "pending_subscription"
