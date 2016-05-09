class SessionsController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views/sessions'
  end

  get '/signup' do
    if !session[:user_id]
      erb :'signup'
    else
      redirect "/movies"
    end
  end

  post '/signup' do
    if params[:user][:name] == "" || params[:user][:email] == "" || params[:user][:password] == ""
      redirect to '/signup'
    else
      @user = User.create(params[:user])
      session["user_id"] = @user.id
      redirect to '/movies'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'login'
    else
      redirect '/movies'
    end
  end

  post '/login' do
   user = User.find_by(:email => params[:user][:email])
   if user && user.authenticate(params[:user][:password])
     session[:user_id] = user.id
     redirect "/movies"
   else
     redirect to '/signup'
   end
 end

 get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/movies'
    else
      redirect to '/movies'
    end
  end


end
