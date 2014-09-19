angular.module("inspotle").

controller "SpotCtrl", ($scope, $stateParams, Spot) ->

  init = ->
    Spot.get($stateParams.spotId).then (data) ->
      $scope.spot = data

  init()