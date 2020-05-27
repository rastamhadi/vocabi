# frozen_string_literal: true

Rails.application.routes.draw do
  root 'headwords#index'

  devise_for :users

  resources :headwords
  resources :examples
end
