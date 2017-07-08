Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :users}
  resources :users, only: [:create,:update,:destroy,:index]
  resources :notes, only: [:create,:update,:destroy,:index,:show]
  resources :goals, only: [:create,:update,:destroy,:index,:Show]
  post 'tokens/verify', to:'tokens#verify'
  post 'tokens/verify_token', to:'tokens#verify_token'
  post 'notes/other_user', to:'notes#other_user'

end
