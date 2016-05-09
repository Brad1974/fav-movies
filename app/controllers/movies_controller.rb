class MoviesController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views/movies'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    redirect to '/movies'
  end

  get '/movies' do
    @movies = Movie.all
    erb :index
  end

  get '/movies/new' do
    @movies = Movie.all
    if !session[:user_id]
      erb :index, locals: {message: "You must have an account and be logged in to create a new movie page."}
    else
      @user = current_user
      @movie = @user.movies.build(params)
      @director = @movie.build_director(params)
      erb :new
    end
  end

  post '/movies' do
    @user = current_user
    @movie = @user.movies.build(params[:movie])
    if @movie.save
      redirect to '/movies'
    else
      erb :new
    end
  end

  get '/movies/:id' do
    @movie = Movie.find(params[:id])
    @user = @movie.user
    erb :show, :layout => :'./layout'
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    @user = @movie.user
    #binding.pry
    if logged_in? && (session[:user_id] == @movie.user.id)
      erb :edit
    else
      erb :show, locals: {message: "Only the authors of movie appreciation pages may edit them. If you are the author of this page, then log into your account."}
    end
  end

  post '/movies/:id' do
    @movie = Movie.find_by_id(params[:id])
    if @movie.update(params[:movie])
      redirect '/movies'
    else
      erb :edit
    end
  end

  delete '/movies/:id/delete' do
    @movie = Movie.find(params[:id])
    @user = @movie.user
    if @user.id == session[:user_id]
      @movie.destroy
      redirect '/movies'
    else
      erb :show, locals: {message: "Only the author of a movie appreciation page may delete it. If you are the author of this page, then log into your account."}
    end
  end

  helpers do


    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
