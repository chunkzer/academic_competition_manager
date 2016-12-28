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
      .state "events",
        url: "/events",
        templateUrl: "app/views/events.html",
        controller: "EventsCtrl"
    $urlRouterProvider.otherwise '/'

  .factory "User", (RailsResource) ->
    class User extends RailsResource
      @configure url: "/api/users", name: "user"

  .factory "Event", (RailsResource) ->
    class Event extends RailsResource
      @configure url: "/api/events", name: "event"

  .factory "PendingSubscriber", (RailsResource) ->
    class PendingSubscriber extends RailsResource
      @configure url: "/api/event_subscribers/pending_subscribers", name: "pending_subscriber"
