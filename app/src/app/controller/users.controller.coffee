angular.module "servicio"
  .controller "UsersCtrl", ($scope, User) ->
    User.query().then (users) -> $scope.users = users
