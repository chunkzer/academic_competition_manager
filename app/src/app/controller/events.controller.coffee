angular.module "servicio"
  .controller "EventsCtrl", ($scope, Event, localStorage, ModalService, Requirement, lodash) ->
    $scope.role = localStorage.get("role_id")
    payload = localStorage.payload()
    Event.query({page: 1, payload}).then (events) -> $scope.events = events
    $scope.nextPage = () ->
      page += 1
      Event.query({page: page, payload}).then (events) -> $scope.events = events
    $scope.previousPage = () ->
      page -= 1 if page != 1
      Event.query({page: page, payload}).then (events) -> $scope.events = events

    modalController = ($scope, close, lodash, Requirement, Event ) ->
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

    $scope.newEvent = () ->
      ModalService.showModal(
        templateUrl: "app/views/modal-templates/new-event.html"
        controller: modalController
        )
      .then((modal) ->
        modal.element.modal()
        modal.close.then((result) ->
          backdrop = document.getElementsByClassName("modal-backdrop fade in")
          backdrop[0].parentNode.removeChild(backdrop[0])))
