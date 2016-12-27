angular.module "servicio"
  .controller "EventsCtrl", ($scope, Event) ->
    Event.query().then (events) -> $scope.events = events
