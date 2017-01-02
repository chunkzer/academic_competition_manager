angular.module 'servicio'
  .directive 'subscriptionItem', () ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/subscriptionItem/subscription-item.html'
      scope: subscription: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $uibModal, $log, $document) ->
        vm = $scope.vm
        vm.isCollapsed = true
        modalController = ($scope, $uibModalInstance, doc, sub, Document) ->
          $scope.doc = doc
          $scope.sub = sub
          $scope.approve  = () ->
            doc.approved = true
            new Document(doc).update()
            $uibModalInstance.close()
          $scope.cancel = () -> $uibModalInstance.dismiss('cancel')
        inspectDocument = (doc) ->
          $uibModal.open({
            animation: true,
            templateUrl: "app/views/modal-templates/image.html",
            controller: modalController,
            size: 'lg',
            resolve: {
              doc: doc,
              sub: vm.subscription
            }
          })
        toggleCollapse = () ->
          vm.isCollapsed = !vm.isCollapsed
        vm.inspectDocument = inspectDocument
        vm.toggleCollapse = toggleCollapse
        vm
