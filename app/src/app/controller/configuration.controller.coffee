angular.module "servicio"
  .controller "ConfigurationCtrl", ($scope, localStorage) ->
    $scope.userIsAdmin = localStorage.userIsAdmin()

    userRole = localStorage.get("role_id")
    $scope.content = "Perfil"

    $scope.setContent = (content) ->
      console.log(content)
      $scope.content = content

    $scope.noOp = () ->
      return null

    if userRole != "student"
      $scope.menu = [
        {
          name: "Perfil"
          url: "#"
          func: $scope.setContent
        }
        # ,{
        #   name: "Notificaciones"
        #   url: "#"
        #   func: $scope.setContent
        # }
      ]
    else
      $scope.menu = [
        {
          name: "Perfil"
          url: "#"
          func: $scope.setContent
        }
        # ,{
        #   name: "Notificaciones"
        #   url: "#"
        #   func: $scope.setContent
        # }
      ]
