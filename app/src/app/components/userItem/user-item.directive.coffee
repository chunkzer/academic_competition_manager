angular.module 'servicio'
  .directive 'userItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/userItem/user-item.html'
      scope: user: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, localStorage, ModalService) ->
        vm = $scope.vm
        vm.userIsAdmin = localStorage.userIsAdmin()
        vm
