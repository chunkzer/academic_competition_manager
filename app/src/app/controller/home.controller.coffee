angular.module "servicio"
  .controller "HomeCtrl", ($scope, User, PendingSubscription) ->
    page = 1
    User.query().then (users) -> $scope.users = users
    PendingSubscription.query().then (subscriptions) -> $scope.subscriptions = subscriptions
    $scope.nextPage = () ->
      page += 1
      PendingSubscription.query({page: page}).then (subscriptions) -> $scope.subscriptions = subscriptions
    $scope.previousPage = () ->
      page -= 1 if page != 1
      PendingSubscription.query({page: page}).then (subscriptions) -> $scope.subscriptions = subscriptions
