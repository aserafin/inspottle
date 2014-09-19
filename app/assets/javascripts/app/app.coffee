app = angular.module "inspotle", [
  'ui.bootstrap.datepicker',
  'ui.bootstrap.timepicker',
  'ui.bootstrap.tpls',
  'ui.router',
  'facebook',
  'rails',
  'LocalStorageModule',
  'google-maps'
]

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
