Rails.application.routes.draw do
  mount Base => '/api'
  mount GrapeSwaggerRails::Engine => '/apidoc'
end
