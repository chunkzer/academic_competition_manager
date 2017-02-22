angular.module 'servicio'
  .directive 'documentItem', (ModalService) ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/documentItem/document-item.html'
      scope:
        requirement: '='
        event: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $uibModal, $log, ModalService, localStorage) ->
        vm = $scope.vm
        vm.doc = vm.requirement.document
        vm.userIsAdmin = localStorage.get("role_id") != "student"
        inspectDocument = (requirement, event) ->
          ModalService.showModal(
            templateUrl: "app/views/modal-templates/document.html"
            inputs:
              requirement: requirement
              event: event
            controller: "documentCtrl"
            )
          .then((modal) ->
            modal.element.modal()
            modal.close.then((result) ->
              backdrop = document.getElementsByClassName("modal-backdrop fade in")
              backdrop[0].parentNode.removeChild(backdrop[0])))

        vm.inspectDocument = inspectDocument
        vm
