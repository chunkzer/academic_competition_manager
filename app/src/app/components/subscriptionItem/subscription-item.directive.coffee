angular.module 'servicio'
  .directive 'subscriptionItem', (ModalService) ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/subscriptionItem/subscription-item.html'
      scope: subscription: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $uibModal, $log, $document, ModalService) ->
        vm = $scope.vm
        vm.isCollapsed = true
        toggleCollapse = () ->
          vm.isCollapsed = !vm.isCollapsed

        vm.toggleCollapse = toggleCollapse
        vm
