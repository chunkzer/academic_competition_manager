angular.module 'servicio'
  .directive 'attendeeItem', (ModalService) ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/attendeeItem/attendee-item.html'
      scope:
        subscription: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $uibModal, $log, localStorage) ->
        vm = $scope.vm
        vm.userIsAdmin = localStorage.userIsAdmin()
        vm
