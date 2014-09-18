angular.module('inspotle').

factory 'Spot', (RailsResource) ->
  class extends RailsResource
    @configure url: '/api/spots', name: 'spot'
