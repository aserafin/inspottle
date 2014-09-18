Rails.application.routes.draw do
  mount Base => '/api'
  mount GrapeSwaggerRails::Engine => '/apidoc'

  resources :templates, only: :show, constraints: { id: /.*/ }
  root to: 'templates#show'
end
