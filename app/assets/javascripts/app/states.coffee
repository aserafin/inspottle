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

  .state 'main.new-spot',
    url: '/spots/new'
    templateUrl: 'templates/spots/new'
    controller: 'SpotsCtrl'

  .state 'main.spot',
    url: '/spots/:spotId'
    templateUrl: 'templates/spots/show'
    controller: 'SpotCtrl'

  .state 'main.new-event',
    url: '/spots/:spotId/events/new'
    templateUrl: 'templates/events/new'
    controller: 'EventsCtrl'