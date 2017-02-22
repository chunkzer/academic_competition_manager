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
        vm.userIsAdmin = localStorage.get("role_id") != "student"
        vm.isCollapsed = true
        toggleCollapse = () ->
          vm.isCollapsed = !vm.isCollapsed

        vm.toggleCollapse = toggleCollapse
        vm
