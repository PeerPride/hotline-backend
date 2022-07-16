# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  resources :incoming_lines
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  post :incoming_call, to: 'incoming_voice#incoming'

  namespace :api do
    namespace :v1 do
      resources :users do
        get :oncall
        get 'oncall/:language_id'
      end
      resources :teams
      resources :contacts do
        member do
          patch :block
          patch :unblock
        end
      end
      resources :contactphones
      resources :conversations
      get :status, to: 'status#index'
    end
  end
end
# rubocop:enable Metrics/BlockLength
