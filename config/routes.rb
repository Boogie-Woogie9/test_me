# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'students/new'
  get 'mentors/new'

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  resources :students
  get 'signup' => 'students#new'
  resources :mentors
  get 'signup' => 'mentors#new'

  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
