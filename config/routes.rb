# frozen_string_literal: true

Rails.application.routes.draw do
  get 'tests/index'
  get 'tests/show'

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

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'choice' => 'static_pages#choice'

  resources :students
  get 'signup' => 'students#new'

  resources :mentors
  get 'signup' => 'mentors#new'

  resources :tests do
    resources :questions
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
