angular.module "servicio"
  .controller "HomeCtrl", ($scope, EventSubscription, localStorage) ->
    page = 1
    EventSubscription.query({page: page}).then (subscriptions) -> $scope.subscriptions = subscriptions
    $scope.nextPage = () ->
      page += 1
      EventSubscription.query({page: page}).then (subscriptions) -> $scope.subscriptions = subscriptions
    $scope.previousPage = () ->
      page -= 1 if page != 1
      EventSubscription.query({page: page}).then (subscriptions) -> $scope.subscriptions = subscriptions
