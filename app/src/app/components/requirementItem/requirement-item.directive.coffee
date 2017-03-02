angular.module 'servicio'
  .directive 'requirementItem', () ->
    directive =
      restrict: 'E'
      templateUrl: 'app/components/requirementItem/requirement-item.html'
      scope: requirement: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, localStorage, Requirement) ->
        vm = $scope.vm

        vm.switch = vm.requirement.enabled

        vm.toggleRequirement = () ->
          vm.requirement.enabled = !vm.requirement.enabled
          vm.switch = vm.requirement.enabled
          # debugger;
          new Requirement(vm.requirement).update()

        vm.userIsAdmin = localStorage.userIsAdmin()
        vm
