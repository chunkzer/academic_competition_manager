angular.module 'servicio'
  .directive 'eventItem', () ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/eventItem/event-item.html'
      scope: event: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, localStorage, EventSubscription, ModalService) ->
        vm = $scope.vm

        modalController = ($scope, close, item, EventSubscription, ModalService, localStorage) ->
          $scope.item = item
          $scope.doc = []
          $scope.subscribe = () ->
            data =
              user_id: localStorage.get("user_id")
              event_id: $scope.item.id
              approved: false
              requirements: $scope.item.requirements
            new EventSubscription(data).create()
            close({}, 200)

          $scope.dismissModal = (result) ->
            close(result, 200)

        $scope.newSubscription = () ->
          ModalService.showModal(
            templateUrl: "app/views/modal-templates/new-subscription.html"
            controller: modalController
            inputs:
              item: vm.event
            )
          .then((modal) ->
            modal.element.modal()
            modal.close.then((result) ->
              backdrop = document.getElementsByClassName("modal-backdrop fade in")
              backdrop[0].parentNode.removeChild(backdrop[0])))
        vm
