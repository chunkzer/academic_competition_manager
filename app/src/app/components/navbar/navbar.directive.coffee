angular.module 'servicio'
  .directive 'acmeNavbar', () ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: stuff: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $state, authentication) ->
        'ngInject'
        vm = this
        $scope.$on 'signOut', (event, data) -> $scope.signOut()

        vm.signOut = () ->
          if authentication.signOut()
            $scope.signedIn = false
            $state.go('login')
            return true
          false
        vm
