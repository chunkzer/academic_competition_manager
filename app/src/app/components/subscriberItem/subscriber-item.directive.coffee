angular.module 'servicio'
  .directive 'subscriberItem', () ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/subscriberItem/subscriber-item.html'
      scope: subscriber: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $attrs, $transclude) ->
        vm = $scope.vm
        vm.isCollapsed = true;
