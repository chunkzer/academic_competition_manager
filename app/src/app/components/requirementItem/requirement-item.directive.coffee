angular.module 'servicio'
  .directive 'requirementItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/requirementItem/requirement-item.html'
      scope: user: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, localStorage, Requirement) ->
        vm = $scope.vm
        
        vm.toggleRole = (newRole) ->
          vm.requirement.enabled = !vm.requirement.enabled
          new Requirement(vm.requirement).update()

        vm.userIsAdmin = localStorage.userIsAdmin()
        vm
