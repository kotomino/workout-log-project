require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
  end

  

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def redirect_if_logged_in
      flash[:errors] = ["You're already logged in."] if logged_in?
      redirect "/workouts" if logged_in?
    end

    def redirect_if_not_logged_in
      flash[:errors] = ["You're not logged in."] unless logged_in?
      redirect "/login" unless logged_in?
    end
  end

end
