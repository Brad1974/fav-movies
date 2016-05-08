class MoviesController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views/movies'
  end

  get '/movies' do
    @movies = Movie.all
    erb :index
  end

  get '/movies/new' do
    @user = User.first
    @movie = @user.movies.build(params)
    @director = @movie.build_director(params)

    erb :new
  end

  post '/movies' do
    @user = User.first
    @movie = @user.movies.build(params[:movie])

    if @movie.save
      redirect to '/movies'
    else
      erb :new
    end
  end



  get '/movies/:id' do
    @movie = Movie.find(params[:id])
    erb :show
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    erb :edit
  end

  post '/movies/:id' do
    @movie = Movie.find_by_id(params[:id])
    @movie.update(params[:movie])
    redirect '/movies'
  end

  delete '/movies/:id/delete' do
    movie = Movie.find(params[:id])
    movie.destroy
    redirect '/movies'
  end



end
