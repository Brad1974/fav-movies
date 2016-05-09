class UsersController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views/users'
  end

  get '/users' do
    @users = User.all
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :new
  end

  post '/users' do

    @user = User.new(params[:user])

    if @user.save
      redirect to '/users'
    else
      erb :new
    end
  end



  get '/users/:id' do
    @user = User.find(params[:id])
    erb :show
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :edit
  end

  post '/users/:id' do
    @user = User.find_by_id(params[:id])
    @user.update(params[:user])
    redirect '/users'
  end

  delete '/users/:id/delete' do
    movie = User.find(params[:id])
    movie.destroy
    redirect '/users'
  end



end
