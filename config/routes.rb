Rails.application.routes.draw do
  resources :reports, only: [:create], defaults: { :format => 'json'}
  resources :patients, param: :ssn, only: [:show, :index]#, defaults: { :format => 'json'}

  root 'patients#index'
  post '/save' => 'reports#create'
  post '/token' => 'tokens#new'
  get '/patient/:ssn' => 'patient#index'

end
