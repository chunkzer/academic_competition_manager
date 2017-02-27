angular.module 'servicio'
  .directive 'userItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/userItem/user-item.html'
      scope: user: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, localStorage, User) ->
        vm = $scope.vm
        vm.student = "student" == vm.user.role
        vm.admin = "admin" == vm.user.role
        vm.super_admin = "super_admin" == vm.user.role
        vm.tutor = "tutor" == vm.user.role

        vm.toggleRole = (newRole) ->
          vm.student = "student" == newRole
          vm.admin = "admin" == newRole
          vm.super_admin = "super_admin" == newRole
          vm.tutor = "tutor" == newRole
          vm.user.role_id = newRole
          new User(vm.user).update()

        vm.userIsAdmin = localStorage.userIsAdmin()
        vm
