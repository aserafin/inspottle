angular.module("inspotle").

controller "SpotCtrl", ($scope, $stateParams, Spot) ->

  Spot.get($stateParams.spotId).then (data) ->
    $scope.spot = data