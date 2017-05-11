angular.module "servicio"
  .controller "UsersCtrl", ($scope, User, localStorage, $http) ->
    $scope.userIsAdmin = localStorage.userIsAdmin()
    $scope.userIsTutor = (localStorage.getRole() == "tutor")
    $scope.query = ""

    page = 1

    User.query({page: page, search: $scope.query}).then (users) -> $scope.users = users
    $scope.searchQuery = () ->
      page = 1
      User.query({page: 1, search: $scope.query}).then (users) -> $scope.users = users
    $scope.nextPage = () ->
      page += 1
      User.query({page: page, search: $scope.query}).then (users) -> $scope.users = users
    $scope.previousPage = () ->
      page -= 1 if page != 1
      User.query({page: page, search: $scope.query}).then (users) -> $scope.users = users

    $scope.saveEmail = (email) ->
      $http.post('api/users/tutor_follow', localStorage.payload())
