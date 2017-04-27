angular.module 'servicio'
  .directive 'eventItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/eventItem/event-item.html'
      scope: event: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, localStorage, ModalService, $state, Event, $http) ->
        vm = $scope.vm
        vm.userIsAdmin = localStorage.userIsAdmin()
        vm.userSubscription = vm.event.userSubscription
        vm.isCollapsed = true
        encoded_payload = $.param(localStorage.payload())
        root = location.protocol + '//' + location.host
        vm.download_url = "#{root}/api/events/#{vm.event.id}/csv?#{encoded_payload}"


        toggleCollapse = () ->
          vm.isCollapsed = !vm.isCollapsed

        vm.toggleCollapse = toggleCollapse
        vm

        $scope.goToSub = () ->
          $state.go("home")

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

        $scope.updateEvent = () ->
          ModalService.showModal(
            templateUrl: "app/views/modal-templates/event.html"
            controller: "eventCtrl"
            inputs:
              event: vm.event
            )
          .then((modal) ->
            modal.element.modal()
            modal.close.then((result) ->
              backdrop = document.getElementsByClassName("modal-backdrop fade in")
              backdrop[0].parentNode.removeChild(backdrop[0])
              $state.go('home')
            )
          )
        vm
