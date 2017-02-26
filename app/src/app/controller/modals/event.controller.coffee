angular.module 'servicio'
  .controller "eventCtrl", ($scope, close, lodash, event, Requirement, Event, localStorage) ->

    $scope.event =
      name: event.name || ''
      description: event.description || ''
      deadline: event.registrationDeadline || ''
      eventDate: event.eventDate || ''

    checkedReqs = lodash.map(event.requirements, "id")

    Requirement.query().then (requirements) ->
      for requirement in requirements
        do (requirement) ->
          requirement.checked = lodash.includes(checkedReqs, requirement.id)
      $scope.event.requirements = requirements

    $scope.dateOptions =
      minDate: new Date()

    checkedRequirements = () ->
      newRequirements = []
      lodash.forEach($scope.event.requirements, (requirement) ->
        if requirement.checked
          newRequirements.push(requirement)
        )
      newRequirements

    $scope.saveEvent = () ->
      data =
        name: $scope.event.name
        description: $scope.event.description
        registration_deadline: $scope.event.deadline
        event_date: $scope.event.eventDate
        requirements: checkedRequirements()
      if event.id != undefined
        data.id = event.id
        new Event(data).update()
      else
        new Event(data).create()
      close({}, 200)
    $scope.approve  = (result) ->
      close(result, 200)
