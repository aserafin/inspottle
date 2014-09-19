angular.module("inspotle").

controller "EventsCtrl", ($scope, $state, $stateParams, localStorageService, Activity, Spot, Event) ->

  Spot.get($stateParams.spotId).then (data) ->
    $scope.spot = data

  Activity.get().then (data) ->
    $scope.activities = data

  $scope.hstep = 1;
  $scope.mstep = 1;

  token = localStorageService.get('authToken');


  $scope.setDefaults = ->
    $scope.activityId = null
    $scope.eventDate = new Date()
    $scope.eventTime = new Date()

  $scope.setDefaults()

  $scope.createEvent = ->
    eventData = { spot_id: $stateParams.spotId, activity_id: $scope.activityId }

    new Event({ auth_token: token, event: eventData }).create().then (promise) ->
      $state.go('main.spot', {spotId: $scope.spot.id})
    , (errors) ->
      $scope.errors = errors.data
      console.log(errors.statusText)
