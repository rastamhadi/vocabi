# frozen_string_literal: true

Rails.application.routes.draw do
  root 'headwords#index'

  devise_for :users

  resources :headwords
  resources :examples

  namespace :how_to_study_korean do
    resources :lessons, only: %i[index show]
  end
end
