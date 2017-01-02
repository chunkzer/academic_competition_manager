angular.module 'servicio'
  .directive 'acmeNavbar', ->

    NavbarController = ($scope, $state, authentication) ->
      'ngInject'
      vm = this
      # "vm.creationDate" is available by directive option "bindToController: true"
      $scope.$on('signOut', () ->
        vm.signOut()

      vm.signOut = ->
        if authentication.signOut() ->
          $scope.signedIn = false
          $state.go('login')
          return true
        false


    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: stuff: '='
      controller: NavbarController
      controllerAs: 'vm'
      bindToController: true
