rails g model User user_name:string email:string password:string salt:string
rails g model Bookmark user:references movie:string

rails generate controller User new
rails generate controller Session new
rails generate controller Home new
rails generate controller Movie new
rails generate controller Browse new

rails db:migrate