angular.module 'servicio'
  .directive 'subscriptionItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/subscriptionItem/subscription-item.html'
      scope: subscription: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $uibModal, $log, $document, ModalService, localStorage) ->
        vm = $scope.vm
        vm.userIsAdmin = localStorage.userIsAdmin()
        vm.isCollapsed = true
        toggleCollapse = () ->
          if !vm.subscription.approved
            vm.isCollapsed = !vm.isCollapsed

        vm.toggleCollapse = toggleCollapse
        vm
