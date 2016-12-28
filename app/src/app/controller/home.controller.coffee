angular.module "servicio"
  .controller "HomeCtrl", ($scope, User, PendingSubscriber) ->
    User.query().then (users) -> $scope.users = users
    PendingSubscriber.query().then (subscribers) -> $scope.subscribers = subscribers
