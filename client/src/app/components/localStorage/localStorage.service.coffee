angular.module 'servicio'
  .service 'localStorage', () ->
    vm = this
    isAvailable = ->
      typeof(Storage) != "undefined"

    store = (key, value) ->
      if isAvailable()
        localStorage.setItem(key, value)
        return true
      false

    massStorage = (obj) ->
      if isAvailable()
        for k,v of obj
          localStorage.setItem(k, v)
        return true
      false

    modify = (key, value) ->
      if isAvailable()
        if remove(key)
          return store(key, value)
      false

    remove = (key) ->
      if isAvailable()
        localStorage.removeItem(key)
        return true
      false

    get = (key) ->
      if isAvailable()
        return localStorage.getItem(key)
      null

    clear = ->
      if isAvailable()
        localStorage.clear()
        return true
      false

    clearFilters = ->
      if isAvailable()
        return true
      false

    payload = ->
      data = {payload: {}}
      data.payload.role_id = localStorage.getItem('role_id')
      data.payload.user_id = localStorage.getItem('user_id')
      data.payload.token = localStorage.getItem('token')
      data

    userIsAdmin = ->
      if isAvailable()
        return localStorage.getItem('role_id') == 'admin' || localStorage.getItem('role_id') == 'super_admin'
      false

    getRole = ->
      if isAvailable()
        return localStorage.getItem('role_id')

    vm.isAvailable = isAvailable
    vm.massStorage = massStorage
    vm.store = store
    vm.modify = modify
    vm.remove = remove
    vm.get = get
    vm.clear = clear
    vm.clearFilters = clearFilters
    vm.payload = payload
    vm.userIsAdmin = userIsAdmin
    vm.getRole = getRole
    vm
