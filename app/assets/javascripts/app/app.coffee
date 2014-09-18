"use strict"

app = angular.module "inspotie", [
  'ui.router'
]

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
  .state 'main',
    abstract: true
    templateUrl: 'templates/layouts/main'
