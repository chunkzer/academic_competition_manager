angular.module 'servicio'
  .controller 'MainController', ($scope, $http, $state, User, authentication, localStorage) ->
    $scope.credentials = {}
    $scope.username = ''
    $scope.password = ''
    $scope.creatingNewUser = false
    $scope.newUser =
      name: ""
      last_name: ""
      email: ""
      password: ""

    $scope.login = ->
      authentication.signIn($scope.username, $scope.password)
      .then (response) ->
        if response == true
          $state.go("home")
        else
          alert "Error de usuario o contraseña!"
      .catch -> alert "No se pudo iniciar sesión!"
    $scope.toggleNewUser = ->
      $scope.creatingNewUser = !$scope.creatingNewUser
      return
    $scope.createUser = () ->
      new User($scope.newUser).create()
      .then (response) ->
        alert "Usuario creado con exito!"
        $scope.creatingNewUser = !$scope.creatingNewUser
      .catch -> alert "Ese usuario ya existe."
      return
    return
