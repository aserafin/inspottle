angular.module('inspotle').

factory 'Session', (RailsResource) ->
  class extends RailsResource
    @configure url: '/api/users/login', name: 'user'
