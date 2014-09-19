angular.module("inspotle").

controller "SpotsCtrl", ($scope, Spot) ->

  Spot.query().then (spots) ->
    $scope.spots = spots
