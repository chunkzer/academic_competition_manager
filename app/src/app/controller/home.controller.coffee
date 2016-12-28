angular.module "servicio"
  .controller "HomeCtrl", ($scope, User, PendingSubscriber) ->
    page = 1
    User.query().then (users) -> $scope.users = users
    PendingSubscriber.query().then (subscribers) -> $scope.subscribers = subscribers
    $scope.nextPage = () ->
      page += 1
      PendingSubscriber.query({page: page}).then (subscribers) -> $scope.subscribers = subscribers
    $scope.previousPage = () ->
      page -= 1 if page != 1
      PendingSubscriber.query({page: page}).then (subscribers) -> $scope.subscribers = subscribers
