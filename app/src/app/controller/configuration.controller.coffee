angular.module "servicio"
  .controller "ConfigurationCtrl", ($scope, localStorage) ->
    $scope.userIsAdmin = localStorage.userIsAdmin()

    userRole = localStorage.get("role_id")
    $scope.content = "Perfil"

    $scope.setContent = (content) ->
      $scope.content = content

    $scope.noOp = () ->
      return null

    if userRole != "student"
      $scope.menu = [
        {
          name: "Perfil"
          url: "#"
          func: $scope.noOp
        },
        {
          name: "Notificaciones"
          url: "#"
          func: $scope.noOp
        }
      ]
    else
      $scope.menu = [
        {
          name: "Perfil"
          url: "#"
          func: $scope.noOp
        },
        {
          name: "Notificaciones"
          url: "#"
          func: $scope.noOp
        }
      ]
