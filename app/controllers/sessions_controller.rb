class SessionsController < ApplicationController

  get '/signup' do
    redirect_if_logged_in
    erb :'/sessions/signup'
  end

  get '/login' do
    redirect_if_logged_in
    erb :'/sessions/login'
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  post '/signup' do
  
    user = User.new(params[:user])

    if user.save
      session[:user_id] = user.id
      redirect "/workouts"
    else
      flash[:errors] = ["One or more required fields were left empty."]
      redirect "/signup"
    end
  end

  post '/login' do
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/workouts"
    else
      flash[:errors] = ["Please enter valid username and password."]
      redirect "/login"
    end 
  end

end