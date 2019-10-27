# frozen_string_literal: true

Rails.application.routes.draw do
  resources :emails, only: :create
end
