# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  # get 'tests/index'
  # get 'tests/show'

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

  # get 'new' => 'tests#new'

  resources :students
  get 'signup' => 'students#new'

  resources :mentors
  get 'signup' => 'mentors#new'

  # get 'edit' => 'tests#edit'
  # resources :tests do
  #   resources :questions
  # end

  get 'quiz_submissions/create'
  get 'quiz_submissions/show'

  resources :quizzes do
    resources :questions
    # post 'submit', to: 'quiz_submissions#create'
    resources :quiz_submissions, only: [:show, :create], as: 'submissions'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
