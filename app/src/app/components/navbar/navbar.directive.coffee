angular.module 'servicio'
  .directive 'acmeNavbar', () ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: stuff: '='
      controllerAs: 'vm'
      bindToController: true
      controller: ($scope, $state, authentication, localStorage) ->
        'ngInject'
        vm = this
        userRole = localStorage.get("role_id")
        vm.noOp = () ->
          return null

        vm.signOut = () ->
          if authentication.signOut()
            $scope.signedIn = false
            $state.go('login')
            return true
          false

        if userRole != "student"
          vm.menu = [
            {
              name: "Aplicaciones"
              url: "#/home"
              func: vm.noOp
            },
            {
              name: "Configuracion de Eventos"
              url: "#/events"
              func: vm.noOp
            },
            {
              name: "Configuración de Cuenta"
              url: "#/config"
              func: vm.noOp
            },
            {
              name: "Users"
              url: "#/users"
              func: vm.noOp
            },
            {
              name: "Cerrar Sesión"
              url: "#"
              func: vm.signOut
            }
          ]
        else
          vm.menu = [
            {
              name: "Mis Eventos"
              url: "#/home"
              func: vm.noOp
            },
            {
              name: "Proximos Eventos"
              url: "#/events"
              func: vm.noOp
            },
            {
              name: "Configuración"
              url: "#/config"
              func: vm.noOp
            },
            {
              name: "Cerrar Sesión"
              url: "#"
              func: vm.signOut
            }
          ]

        $scope.$on 'signOut', (event, data) -> $scope.signOut()


        vm
