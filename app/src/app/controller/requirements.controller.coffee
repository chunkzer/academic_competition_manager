angular.module "servicio"
  .controller "RequirementsCtrl", ($scope, localStorage, ModalService, Requirement, lodash) ->
    $scope.userIsAdmin = localStorage.userIsAdmin()
    page = 1
    Requirement.query({page: page}).then (requirements) -> $scope.requirements = requirements
    $scope.nextPage = () ->
      page += 1
      Event.query({page: page}).then (requirements) -> $scope.requirements = requirements
    $scope.previousPage = () ->
      page -= 1 if page != 1
      Event.query({page: page}).then (requirements) -> $scope.requirements = requirements

    $scope.newRequirement = () ->
      ModalService.showModal(
        templateUrl: "app/views/modal-templates/requirement.html"
        controller: "requirementCtrl"
        inputs:
          req: {}
        )
      .then((modal) ->
        modal.element.modal()
        modal.close.then((result) ->
          backdrop = document.getElementsByClassName("modal-backdrop fade in")
          backdrop[0].parentNode.removeChild(backdrop[0])
          Requirement.query({page: page}).then (requirements) -> $scope.requirements = requirements
        )
      )
