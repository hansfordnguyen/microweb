require_relative '../core/router'

Router.draw do
  Router.get 'home', to: 'home#index'
  Router.get 'about', to: 'home#about'
  Router.get 'users', to: 'users#index'
end
