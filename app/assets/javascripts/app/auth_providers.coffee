angular.module('inspotle')

.config (FacebookProvider) ->
  FacebookProvider.init '1468120840116374'

.config (RailsResourceProvider) ->
  RailsResourceProvider.rootWrapping false
