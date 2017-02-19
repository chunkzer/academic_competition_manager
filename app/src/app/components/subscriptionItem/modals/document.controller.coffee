angular.module 'servicio'
  .controller 'documentCtrl', ($scope, doc, sub, Document, close) ->
    $scope.doc = doc
    $scope.sub = sub
    $scope.root = location.protocol + '//' + location.host
    $scope.dismissModal = (result) ->
      close(result, 200)

    $scope.approve  = (result) ->
      doc.approved = true
      new Document({doc}).update()
      close(result, 200)
