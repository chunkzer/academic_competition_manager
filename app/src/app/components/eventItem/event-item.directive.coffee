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
        vm.userIsAdmin = localStorage.get("role_id") != "student"
        vm.userSubscription = vm.event.userSubscription

        modalUpdateSubscription = ($scope, close, lodash, Requirement, Event ) ->
          $scope.requirements = []
          Requirement.query().then (requirements) ->
            for requirement in requirements
              do (requirement) -> requirement.checked = false
            $scope.requirements = requirements

          $scope.newEvent =
            name: ''
            description: ''
            deadline: ''
            eventDate: ''
            newRequirements: []

          $scope.dateOptions =
            minDate: new Date()

          checkedRequirements = () ->
            newRequirements = []
            lodash.forEach($scope.requirements, (requirement) ->
              if requirement.checked
                newRequirements.push(requirement)
              )
            newRequirements

          $scope.createEvent = () ->
            data =
              name: $scope.newEvent.name
              description: $scope.newEvent.description
              registration_deadline: $scope.newEvent.deadline
              event_date: $scope.newEvent.eventDate
              requirements: checkedRequirements()

            new Event(data).create()
            close({}, 200)
          $scope.approve  = (result) ->
            close(result, 200)


        modalNewSubscription = ($scope, close, item, EventSubscription, ModalService, localStorage) ->
          $scope.item = item
          $scope.doc = []
          $scope.subscribe = () ->
            data =
              user_id: localStorage.get("user_id")
              event_id: $scope.item.id
              approved: false
              requirements: $scope.item.requirements
            if $scope.item.userSubscription
              data.id = $scope.item.userSubscription.id
              new EventSubscription(data).update()
            else
              new EventSubscription(data).create()
            close({}, 200)

          $scope.dismissModal = (result) ->
            close(result, 200)

        $scope.newSubscription = () ->
          ModalService.showModal(
            templateUrl: "app/views/modal-templates/new-subscription.html"
            controller: modalNewSubscription
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
            templateUrl: "app/views/modal-templates/edit-event.html"
            controller: modalUpdateSubscription
            inputs:
              item: vm.event
            )
          .then((modal) ->
            modal.element.modal()
            modal.close.then((result) ->
              backdrop = document.getElementsByClassName("modal-backdrop fade in")
              backdrop[0].parentNode.removeChild(backdrop[0])))
        vm
