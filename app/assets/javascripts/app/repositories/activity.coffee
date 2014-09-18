angular.module('inspotle').

factory 'Activity', (RailsResource) ->
  class extends RailsResource
    @configure url: '/api/activities', name: 'activity'
