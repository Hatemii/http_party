Rails.application.routes.draw do
  get '/test', to: 'res#index'
  get '/test/all_names', to: 'res#all_names'
end
