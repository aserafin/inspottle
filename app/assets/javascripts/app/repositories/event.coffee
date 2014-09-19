angular.module('inspotle').

factory 'Event', (RailsResource) ->
  class extends RailsResource
    @configure url: '/api/events', name: 'event'
