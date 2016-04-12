Rails.application.routes.draw do
  require "sidekiq/web"

  root "static_pages#home"

  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :users, only: :show
  resources :user_courses, only: :index
  resources :courses, only: :show
  resources :course_subjects, only: :show
  resources :user_subjects, only: :update

  namespace :admin do
    root "courses#index"
    authenticate :user, ->u{u.supervisor?} do
      mount Sidekiq::Web => "/sidekiq"
    end
    resources :courses, except: :new
    resources :subjects, except: [:new, :edit, :show]
    resources :users, except: :show
    resources :course_subjects, only: [:update, :edit]
  end
end
