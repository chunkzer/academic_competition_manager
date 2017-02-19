angular.module "servicio"
  .controller "EventsCtrl", ($scope, Event, localStorage, ModalService, Requirement, lodash) ->
    $scope.role = localStorage.get("role_id")
    page = 1
    Event.query({page: page}).then (events) -> $scope.events = events
    $scope.nextPage = () ->
      page += 1
      Event.query({page: page}).then (events) -> $scope.events = events
    $scope.previousPage = () ->
      page -= 1 if page != 1
      Event.query({page: page}).then (events) -> $scope.events = events

    $scope.newEvent = () ->
      ModalService.showModal(
        templateUrl: "app/views/modal-templates/new-event.html"
        controller: "newEventCtrl"
        )
      .then((modal) ->
        modal.element.modal()
        modal.close.then((result) ->
          backdrop = document.getElementsByClassName("modal-backdrop fade in")
          backdrop[0].parentNode.removeChild(backdrop[0])
          Event.query({page: page}).then (events) -> $scope.events = events
        )
      )
