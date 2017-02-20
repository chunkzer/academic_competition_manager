angular.module 'servicio'
  .directive 'documentItem', (ModalService) ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/documentItem/document-item.html'
      scope: doc: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $uibModal, $log, ModalService) ->
        vm = $scope.vm
        inspectDocument = (doc) ->
          ModalService.showModal(
            templateUrl: "app/views/modal-templates/image.html"
            inputs:
              doc: doc
            controller: "documentCtrl"
            )
          .then((modal) ->
            modal.element.modal()
            modal.close.then((result) ->
              backdrop = document.getElementsByClassName("modal-backdrop fade in")
              backdrop[0].parentNode.removeChild(backdrop[0])))

        vm.inspectDocument = inspectDocument
        vm