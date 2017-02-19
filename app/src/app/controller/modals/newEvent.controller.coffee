angular.module 'servicio'
  .controller "newEventCtrl", ($scope, close, lodash, Requirement, Event, localStorage) ->
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
