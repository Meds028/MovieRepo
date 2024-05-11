Rails.application.routes.draw do
  get "home" => "home#new"
  get "browse/all", to: "browse#new", as: "browse"
  get "movie/:params/:title", to: "movie#new", as: "movie"
  get "browse/filter/:quality/:genre/:rating/:order_by/:term", to: "browse#filter", as: "filter"
  get "bookmarks", to: "browse#bookmark", as: "bookmark"
  get "bookmark/:params/:title", to: "browse#bookmarked", as: "bookmarked"
  get "bookmarks/:id", to: "browse#bookmarked_list"

  get "register", to: "user#register", as: "register"
  post "user/create", to: "user#create", as: "create_user"

  get "login", to: "session#login", as: "login"
  post "session/create", to: "session#create", as: "session_create"
  get "logout", to: "session#destroy", as: "logout"

  get "profile", to: "user#profile", as: "profile"
  post "profile/change/user", to: "user#change_user_name", as: "change_user"
  post "profile/change/email", to: "user#change_email", as: "change_email"
  post "profile/change/password", to: "user#change_password", as: "change_password"


  # get "browse/:param/:param/:param/:param/:param", to: "browse#filter", as: "filter"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # get "login" => "session#login"
  # post "change/title", to: "website#change_title", as: "change_movie_title"
end
