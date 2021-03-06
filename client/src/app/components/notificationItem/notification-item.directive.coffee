angular.module 'servicio'
  .directive 'notificationItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/notificationItem/notification-item.html'
      controllerAs: 'vm'
      scope: user: '='
      bindToController: true
      controller: ($scope, $state, localStorage, User) ->
        $scope.user = {}
        $scope.notifications = {}
        User.get(localStorage.get("user_id")).then (user) ->
          $scope.user = user
          $scope.notifications = user.notifications

        $scope.updateUser = () ->
          new User($scope.user).update() ->
            $scope.toastDisplay = true
