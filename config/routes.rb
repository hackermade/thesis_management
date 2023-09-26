# config/routes.rb

Rails.application.routes.draw do
  get 'professors/index'
  get 'professors/show'
  get 'professors/edit'
  get 'professors/update'
  get 'students/show'
  get 'students/new_thesis'
  get 'students/create_thesis'
  devise_for :students
  devise_for :professors

  resource :student, only: [:show] do
    get 'new_thesis', on: :member
    post 'create_thesis', on: :member
    get 'thesis/:id', to: 'theses#show', as: 'thesis', on: :member

  end


# config/routes.rb
resources :professors, only: [:index, :show, :edit, :update] do
  member do
    post 'assign_thesis'
    patch 'update_thesis'
  end
end



  resources :theses, only: [:index, :show, :edit, :update]

  # Custom route for the 'assign' action
  put 'theses/:id/assign', to: 'theses#assign', as: 'assign_thesis'

  root 'home#index'
end
