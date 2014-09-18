angular.module('inspotle').

config ($stateProvider) ->
  $stateProvider

  .state 'main',
    abstract: true
    templateUrl: 'templates/layouts/main'
    controller: 'LoginCtrl'

  .state 'main.landing',
    url: '/'
    templateUrl: 'templates/static/landing'
