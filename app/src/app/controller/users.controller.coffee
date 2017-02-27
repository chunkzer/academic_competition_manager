angular.module "servicio"
  .controller "UsersCtrl", ($scope, User, localStorage) ->
    $scope.userIsAdmin = localStorage.userIsAdmin()
    page = 1
    User.query({page: page}).then (users) -> $scope.users = users
    $scope.nextPage = () ->
      page += 1
      User.query({page: page}).then (users) -> $scope.users = users
    $scope.previousPage = () ->
      page -= 1 if page != 1
      User.query({page: page}).then (users) -> $scope.users = users
