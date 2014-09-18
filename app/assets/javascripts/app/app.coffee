app = angular.module "inspotle", [
  'ui.router',
  'facebook',
  'rails',
  'LocalStorageModule',
  'google-maps'
]

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
