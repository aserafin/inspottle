angular.module("inspotle").

controller "LoginCtrl", ($scope, Facebook, Session, localStorageService) ->
  Facebook.getLoginStatus (response) ->
    $scope.loggedIn = response.status is "connected"

  $scope.authenticate = ->
    Facebook.login (response) ->
      authResponse = response.authResponse
      new Session(facebook_id: authResponse.userID, facebook_token: authResponse.accessToken).create().then (user) ->
        localStorageService.set 'authToken', user.authToken
