Rails.application.routes.draw do

if Rails.env.development? #開発環境の場合
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

namespace :admins do
  resources :reviews, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show, :destroy]
end

root 'reviews#top'
resources :reviews do
 collection do
    match 'search' => 'reviews#search', via: [:get, :post], as: :search
  end
end

post   '/like/:review_id' => 'likes#create', as: 'like'
delete '/like/:review_id' => 'likes#destroy', as: 'unlike'

resources :users, only: [:show, :edit, :update, :destroy] do
  get ':prefecture' => 'users#index', as: 'prefecture'
  resources :likes, only: [:index]
end
get 'users/:id/check' => 'users#check', as:'check'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
