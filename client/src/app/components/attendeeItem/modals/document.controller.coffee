angular.module 'servicio'
  .controller 'documentCtrl', ($scope, requirement, event, Document, close, localStorage) ->
    $scope.userIsAdmin = localStorage.get("role_id") != "student"
    $scope.requirement = requirement
    $scope.event = event
    $scope.event = event
    $scope.root = location.protocol + '//' + location.host

    $scope.submit = (result) ->
      $scope.requirement.document.state = "pending_review"
      doc = $scope.requirement.document
      if doc.id == undefined
        doc.event_id = $scope.event.id
        doc.requirement_id = $scope.requirement.id
        new Document(doc).create()
      else
        new Document(doc).update()
      close(result, 200)

    $scope.dismissModal = (result) ->
      close(result, 200)

    $scope.approve = (result) ->

      $scope.requirement.document.state = "approved"
      doc = $scope.requirement.document
      new Document(doc).update()
      close(result, 200)

    $scope.reject = (result) ->
      $scope.requirement.document.state = "rejected"
      doc = $scope.requirement.document
      new Document(doc).update()
      close(result, 200)
