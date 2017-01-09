angular.module 'servicio'
  .directive 'eventItem', () ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/eventItem/event-item.html'
      scope: eventItem: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $uibModal, $log, $document) ->
        vm = $scope.vm
        vm.isCollapsed = true

        toggleCollapse = () ->
          vm.isCollapsed = !vm.isCollapsed

        inspectDocument = (doc) ->
          $uibModal.open({
            animation: true,
            templateUrl: "app/views/modal-templates/image.html",
            controller: () -> true,
            size: 'lg',
            resolve: {
              doc: doc,
              sub: vm.eventItem
            }
          })

        vm.inspectDocument = inspectDocument
        vm.toggleCollapse = toggleCollapse
        vm
