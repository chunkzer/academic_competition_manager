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
      .state "users",
        url: "/users",
        templateUrl: "app/views/users.html",
        controller: "UsersCtrl"
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
