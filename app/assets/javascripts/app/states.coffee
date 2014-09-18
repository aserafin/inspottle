angular.module('inspotie').

config ($stateProvider) ->
  $stateProvider
  .state 'main.landing',
    url: '/'
    templateUrl: 'templates/static/landing'
