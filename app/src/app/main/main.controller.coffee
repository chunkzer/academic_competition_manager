angular.module 'servicio'
  .controller 'MainController', ($scope, $http, $state, User, localStorage) ->
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
      url = '/api/user_sessions'
      data = {email: $scope.username, password: $scope.password}
      config = {}
      $http.post(url, data, config)
      .then (response) ->
        localStorage.massStorage(response.data.payload)
        $scope.creatingNewUser = !$scope.creatingNewUser
        $state.go("home")
      .catch -> alert "Usuario o contraseña incorrecta."
      return
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
