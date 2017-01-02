angular.module 'servicio'
  .service 'authentication', ($state, $rootScope, $q, $http, localStorage) ->
    vm = this
    jwt = token: null
    credentials =
      role: null
      name: null
      id: null
      imageUrl: null

    hardSignOut = ->
      localStorage.clear()
      localStorage.store 'signedOut', '1'
      jwt = token: null
      credentials =
        full_name: null
        role_id: null
        user_id: null
        email: null
      $state.go("/")
      location.reload()
      return

    validateSignedIn = ->
      if localStorage and localStorage.isAvailable()
        signedOut = localStorage.get('signedOut')
        if ! !signedOut
          jwt = {}
          credentials = {}
        else
          tryToken = localStorage.get('token')
          tryRoleId = localStorage.get('role_id')
          tryFullName = localStorage.get('full_name')
          tryUserId = localStorage.get('user_id')
          tryEmail = localStorage.get('email')
          if ! !tryToken
            ! !tryRoleId
            ! !tryFullName
            ! !tryUserId
            jwt.token = tryToken
            credentials.full_name = tryFullName
            credentials.role_id = tryRoleId
            credentials.user_id = tryId
            credentials.email = tryEmail
      return

    validate = ->
      validateSignedIn()
      session = ! !credentials.user_id
      if !session
        $rootScope.$emit 'signOut', {}
      session

    getCredentials = ->
      validateSignedIn()
      credentials

    getToken = ->
      validateSignedIn()
      jwt

    signIn = (username, password) ->
      url = '/api/user_sessions'
      data = {email: username, password: password}
      config = {}
      $http.post(url, data, config)
      .then (response) ->
        localStorage.clear()
        userData = response.data
        jwt.token = userData.token
        credentials.role_id = userData.payload.role_id
        credentials.user_id = userData.payload.user_id
        credentials.full_name = userData.payload.full_name
        credentials.email = userData.payload.email
        localStorage.massStorage(response.data.payload)
        localStorage.store("token", response.data.token)
        true
      .catch -> false

    signOut = ->
      localStorage.clear()
      localStorage.store('signedOut', '1')
      jwt = token: null
      credentials =
        full_name: null
        role_id: null
        user_id: null
        email: null
      true

    detokenizedCredentials = ->
      defer = $q.defer()
      $http.post('user_credentials/', token: jwt.token).then((data, status) ->
        defer.resolve data[0]
        return
      ).catch (status) ->
        if status == 404
          # ToastService.showErrorToast 'Invalid token'
          true
        if status == 403
          # ToastService.showErrorToast 'Your session has expired. Log back in'
          false
        defer.reject()
        return
      defer.promise

    vm.validate = validate
    vm.getCredentials = getCredentials
    vm.getToken = getToken
    vm.signIn = signIn
    vm.signOut = signOut
    vm.detokenizedCredentials = detokenizedCredentials

    window.addEventListener 'storage', (e) ->
      if e.key == 'signedOut' and e.newValue == '1' and ! !credentials.id
        hardSignOut()
      return
    vm
