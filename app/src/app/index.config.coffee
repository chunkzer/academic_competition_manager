angular.module 'servicio'
  .config ($logProvider, toastrConfig, $httpProvider) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    #Send x-csrf-token with every request
    authToken = $("meta[name=\"csrf-token\"]").attr("content")
    $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
