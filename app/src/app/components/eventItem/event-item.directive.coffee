angular.module 'servicio'
  .directive 'eventItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/eventItem/event-item.html'
      scope: event: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, localStorage, ModalService) ->
        vm = $scope.vm
        vm.userIsAdmin = localStorage.get("role_id") != "student"
        vm.userSubscription = vm.event.userSubscription
        $scope.newSubscription = () ->
          ModalService.showModal(
            templateUrl: "app/views/modal-templates/new-subscription.html"
            controller: "subscriptionCtrl"
            inputs:
              item: vm.event
            )
          .then((modal) ->
            modal.element.modal()
            modal.close.then((result) ->
              backdrop = document.getElementsByClassName("modal-backdrop fade in")
              backdrop[0].parentNode.removeChild(backdrop[0])))
        vm
