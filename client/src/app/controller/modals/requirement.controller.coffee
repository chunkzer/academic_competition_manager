angular.module 'servicio'
  .controller "requirementCtrl", ($scope, close, req, Requirement, localStorage) ->

    $scope.requirement =
      description: req.description || ''
      specifications: req.specifications || ''
      enabled: true

    $scope.saveRequirement = () ->
      data = $scope.requirement
      if req.id != undefined
        data.id = req.id
        new Requirement(data).update()
      else
        new Requirement(data).create()
      close({}, 200)
    $scope.approve  = (result) ->
      close(result, 200)
