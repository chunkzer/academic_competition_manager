angular.module 'servicio'
  .directive 'subscriptionItem', () ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/subscriptionItem/subscription-item.html'
      scope: subscription: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $uibModal, $log, $document) ->
        vm = $scope.vm
        vm.isCollapsed = true
        inspectDocument = (doc) ->
          $scope.$emit('showModal', doc)
          console.log('inspect!')
        toggleCollapse = () ->
          vm.isCollapsed = !vm.isCollapsed
          console.log("toggle!")
        vm.inspectDocument = inspectDocument
        vm.toggleCollapse = toggleCollapse
        vm
