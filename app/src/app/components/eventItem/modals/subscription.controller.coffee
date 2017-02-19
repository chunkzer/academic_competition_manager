angular.module 'servicio'
  .controller "subscriptionCtrl", ($scope, close, item, EventSubscription, ModalService, localStorage) ->
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
