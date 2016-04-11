Rails.application.routes.draw do

  root "static_pages#home"

  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :users, only: :show
  resources :user_courses, only: :index
  resources :courses, only: :show
  resources :course_subjects, only: :show

  namespace :admin do
    root "courses#index"
    resources :courses, except: [:new, :edit, :show]
    resources :subjects, except: [:new, :edit, :show]
    resources :users, except: [:new, :edit, :show]
  end
end
