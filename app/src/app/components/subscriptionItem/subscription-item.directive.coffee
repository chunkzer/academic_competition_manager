angular.module 'servicio'
  .directive 'subscriptionItem', () ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/subscriptionItem/subscription-item.html'
      scope: subscription: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $attrs, $transclude) ->
        vm = $scope.vm
        vm.isCollapsed = true;
