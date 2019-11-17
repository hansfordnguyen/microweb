require 'router'

Router.draw do
  Router.get 'home', to: 'home#index'
  Router.get 'about', to: 'home#about'
end
