angular.module 'servicio', ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngMessages', 'ngAria', 'ngResource', 'ui.router', 'ui.bootstrap', 'toastr', 'rails']
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "events",
        url: "/events",
        templateUrl: "app/views/events.html",
        controller: "EventsCtrl"

    $urlRouterProvider.otherwise '/'

  .factory "Event", (RailsResource) ->
    class Event extends RailsResource
      @configure url: "/api/events", name: "event"

  .factory "Users", (RailsResource) ->
    class User extends RailsResource
      @configure url: "/api/users", name: "user"
