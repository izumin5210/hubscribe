Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'auth/session#create'
end
