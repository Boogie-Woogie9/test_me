# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
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

  post 'submit_form'=> 'groups#submit_form'
  post 'submit_group' => 'groups#submit_group'

  resources :students
  get 'signup' => 'students#new'

  resources :mentors
  get 'signup' => 'mentors#new'

  resources :groups

  get 'group_destroy' => 'groups#destroy'

  get 'quiz_submissions/create'
  get 'quiz_submissions/show'

  resources :quizzes do
    resources :questions
    resources :quiz_submissions, only: [:show, :create], as: 'submissions'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
