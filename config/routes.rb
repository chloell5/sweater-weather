Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
   namespace :v1 do
     get '/forecast', to: '/api/v1/forecast#index'
     get '/backgrounds', to: '/api/v1/background#index'
   end
 end
end
