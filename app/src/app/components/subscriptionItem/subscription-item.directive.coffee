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

        inspectDocument = (doc) ->
          ModalService.showModal(
            templateUrl: "app/views/modal-templates/image.html"
            inputs:
              doc: doc
              sub: vm.subscription
            controller: "documentCtrl"
            )
          .then((modal) ->
            modal.element.modal()
            modal.close.then((result) ->
              backdrop = document.getElementsByClassName("modal-backdrop fade in")
              backdrop[0].parentNode.removeChild(backdrop[0])))

        vm.inspectDocument = inspectDocument
        vm.toggleCollapse = toggleCollapse
        vm
