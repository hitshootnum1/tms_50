Rails.application.routes.draw do

  root "static_pages#home"

  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :user_courses, only: :index
  resources :courses, only: :show
end
