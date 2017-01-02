angular.module 'servicio'
  .controller 'MainController', ($scope, $http, User) ->
    $scope.credentials = {}
    $scope.username = ''
    $scope.password = ''
    $scope.creatingNewUser = false;
    $scope.newUser =
      name: ""
      last_name: ""
      email: ""
      password: ""

    $scope.login = ->
      url = '/api/user_sessions'
      data = {username: $scope.username, password: $scope.password}
      config = {}
      $http.post(url, data, config)
      .then (response) => credentials = response
      .catch => alert "Usuario o contraseña incorrecta."
      return
    $scope.toggleNewUser = ->
      $scope.creatingNewUser = !$scope.creatingNewUser
      return
    $scope.createUser = () ->
      new User($scope.newUser).create()
      .then (response) => alert "Usuario creado con exito!"
      .catch => alert "Ese usuario ya existe."
      return
    return
