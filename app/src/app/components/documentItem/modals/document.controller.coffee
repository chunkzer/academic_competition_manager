angular.module 'servicio'
  .controller 'documentCtrl', ($scope, doc, Document, close) ->
    $scope.doc = doc
    $scope.root = location.protocol + '//' + location.host
    $scope.dismissModal = (result) ->
      close(result, 200)

    $scope.approve  = (result) ->
      doc.approved = true
      new Document({doc}).update()
      close(result, 200)
