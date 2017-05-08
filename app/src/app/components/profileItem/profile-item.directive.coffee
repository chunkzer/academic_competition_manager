angular.module 'servicio'
  .directive 'profileItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/profileItem/profile-item.html'
      controllerAs: 'vm'
      scope: user: '='
      bindToController: true
      controller: ($scope, $state, localStorage, User) ->
        $scope.user = {}
        $scope.toastDisplay = false
        User.get(localStorage.get("user_id")).then (user) ->
          $scope.user = user

        $scope.updateUser = () ->
          console.log("Ok...")
          new User($scope.user).update() ->
            $scope.toastDisplay = true
