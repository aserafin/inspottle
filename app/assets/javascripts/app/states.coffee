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

  .state 'main.spots',
    url: '/spots/'
    templateUrl: 'templates/spots/index'
    controller: 'SpotsCtrl'

  .state 'main.new-spot',
    url: '/spots/new'
    templateUrl: 'templates/spots/new'
    controller: 'NewSpotCtrl'

  .state 'main.spot',
    url: '/spots/:spotId'
    templateUrl: 'templates/spots/show'
    controller: 'SpotCtrl'
