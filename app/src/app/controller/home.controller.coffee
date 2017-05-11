angular.module "servicio"
  .controller "HomeCtrl", ($scope, EventSubscription, localStorage, $state) ->
    $scope.userIsAdmin = localStorage.userIsAdmin()

    if localStorage.getRole() == "tutor"
      $state.go("users")

    page = 1
    EventSubscription.query({page: page}).then (subscriptions) -> $scope.subscriptions = subscriptions
    $scope.nextPage = () ->
      page += 1
      EventSubscription.query({page: page}).then (subscriptions) -> $scope.subscriptions = subscriptions
    $scope.previousPage = () ->
      page -= 1 if page != 1
      EventSubscription.query({page: page}).then (subscriptions) -> $scope.subscriptions = subscriptions
