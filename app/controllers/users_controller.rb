require 'pry'
class UsersController < ApplicationController

  get '/front' do
    @users = User.all
    erb :'users/index'
  end

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/front'
    end
  end

  post '/signup' do
    @user = User.create(username: params[:username], password: params[:password])
    if params[:username].empty? || params[:password].empty?
      redirect '/signup'
    else
      session[:user_id] = @user.id
      redirect to '/front'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/front'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect '/front'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if !logged_in?
      redirect '/login'
    else
      session.clear
      redirect '/login'
    end
  end

end
