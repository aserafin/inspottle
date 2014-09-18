app = angular.module "inspotle", [
  'ui.router',
  'facebook',
  'rails',
  'LocalStorageModule'
]

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
