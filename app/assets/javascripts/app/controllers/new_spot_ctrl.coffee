angular.module("inspotle").

controller "NewSpotCtrl", ($scope, Activity) ->
  $scope.name = ''
  $scope.description = ''

  $scope.markers = []

  $scope.map =
    center:
      latitude: 52.0997
      longitude: 19.0722
    zoom: 6

  $scope.eventsProperty =
    click: (mapModel, eventName, originalEventArgs) ->
      $scope.$apply ->
        $scope.markers.push
          id: 'new_spot_position'
          options:
            draggable: true
          latitude: originalEventArgs[0].latLng.k
          longitude: originalEventArgs[0].latLng.B


  Activity.query().then (response) ->
    $scope.activities = response.activities


  $scope.createSpot = ->
    alert 'Spot created!'
