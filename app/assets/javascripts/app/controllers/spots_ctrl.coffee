angular.module("inspotle").

controller "SpotsCtrl", ($scope, Spot) ->
  $scope.map =
    center:
      latitude: 52.0997
      longitude: 19.0722
    zoom: 6

  $scope.markers = []

  Spot.query().then (spots) ->
    $scope.spots = spots

    $scope.markers = spots.map (spot) ->
      id: spot.id
      latitude: spot.latitude
      longitude: spot.longitude
      title: spot.name
