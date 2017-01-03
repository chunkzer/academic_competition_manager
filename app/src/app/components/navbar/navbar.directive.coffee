angular.module 'servicio'
  .directive 'acmeNavbar', ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: stuff: '='
      controller: NavbarController
      controllerAs: 'vm'
      bindToController: true

    NavbarController = ($scope, $state, authentication) ->
      'ngInject'
      $scope.lol = "shit son"
      $scope.$on 'signOut', (event, data) -> $scope.signOut()

      $scope.signOut = () ->
        if authentication.signOut()
          console.log("yay")
          $scope.signedIn = false
          $state.go('login')
          return true
        false
      return
