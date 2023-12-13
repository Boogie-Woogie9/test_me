# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :views
  devise_for :mentors, controllers: {
    sessions: 'mentors/sessions',
    registrations: 'mentors/registrations'
  }

  devise_for :students, controllers: {
    sessions: 'students/sessions',
    registrations: 'students/registrations'
  }
  get 'sessions/new'
  get 'students/new'
  get 'mentors/new'

  # delete 'destroy_mentor' => 'mentors#destroy'
  # delete 'destroy_student' => 'students#destroy'
  # match 'students/:id' => 'students#destroy', :via => :delete, :as => :destroy_student

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  # get 'contact' => 'static_pages#contact'
  get 'choice' => 'static_pages#choice'

  resources :students
  get 'signup' => 'students#new'
  resources :mentors
  get 'signup' => 'mentors#new'

  # get 'login'  => 'sessions#new'
  # post 'login' => 'sessions#create'
  # get 'logout' => 'sessions#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
