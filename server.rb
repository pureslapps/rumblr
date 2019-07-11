require "sinatra"
require "sinatra/activerecord"
enable "sessions"

class User < ActiveRecord::Base
end


#LOCAL
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "./db.sqlite3")
#HEROKU
#require "active_record"
#ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])


get "/" do
  erb :home
end

get "/login" do
  erb :login
end

post "/login" do
  email = params[:email]
  given_password = params[:password]
  user = User.find_by(email: email)
  session[:user] = user
  redirect "/"

  p email
  p given_password
end

get "/signup" do
  erb :signup
end

post "/signup" do
  user = User.new(params)
  user.save
  redirect "/"
end

post "/logout" do
  session.clear
  redirect "/"
end

post "/delete" do
  email = params[:email]
  user = User.find_by(email: session[:user].email)
  user.destroy
  session.clear
  redirect "/success"
end

get "/success" do
  erb :success
end

get "/myblog" do
  erb :myblog
end

post "/myblog" do

end
